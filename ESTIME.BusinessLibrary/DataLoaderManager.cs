﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Microsoft.Extensions.Configuration;
using ESTIME.DAL.Interface;
using ESTIME.DAL;
using ESTIME.DAL.EstimeEntity;
using OfficeOpenXml;
using Microsoft.EntityFrameworkCore.ValueGeneration.Internal;

namespace ESTIME.BusinessLibrary
/******************************************************
* This class transforms various input files to a 
* standardized CSV format 
* Author: Claire Hendrickson-Jones
* Date: Mar. 11, 2020
* Modifications:
******************************************************/
{
    public class DataLoaderManager : ManagerBase
    {
        protected readonly IDataLoaderDal dal;
        private TlEstimeFileType estimeFileType;
        private int refPeriodId;
        private TdLoad curLoad;
        ExcelPackage ws;
        private bool loadSuccess;
        private string loadErr = string.Empty;

        public DataLoaderManager(IConfiguration config)
            : 
            base(config)
        {
            dal = new DataLoaderDal(connectionString);
        }
        public DataLoaderManager() : base() { }

        public long StartLoading(string refPeriodCode, string estimeFileTypeCode, string fileName, string userName)
        {
            estimeFileType = dal.GetEstimeFileTypeByCode(estimeFileTypeCode);
            refPeriodId = dal.GetRefPeriodId(refPeriodCode);
            int loadStatusId = dal.GetLoadStatusId("R");
            TdLoad newLoad = new TdLoad()
            {
                Id = 0,
                FilePath = fileName,
                EstimeFileTypeId = estimeFileType.Id,
                StartTime = System.DateTime.Now,
                LoadStatusId = loadStatusId,
                UserId = userName
            };
            curLoad = dal.AddTdLoad(newLoad);

            //TryLoadData(fileName);

            return curLoad.Id;


        }

        public bool TryLoadData(string provCode = null)
        {
            try
            {
                //estimeFileType = dal.GetEstimeFileTypeId("3");
                if (estimeFileType.FileType.Extension == ".txt" || estimeFileType.FileType.Extension == ".csv")
                {
                    //loading text file
                    loadSuccess = dal.LoadTextDataFileByBulk(curLoad.Id, refPeriodId);

                    //new code to construct the loadStagings list from the text file
                    //To test, comment the call above and uncomment the code below
                    List<TdLoadStaging> loadStagings = new List<TdLoadStaging>();
                    loadSuccess = dal.AddTdLoadStaging(curLoad.Id, refPeriodId, loadStagings);
                }
                else if (estimeFileType.FileType.Extension == ".xlsx")
                {
                    
                    //loading excel file
                    var fi = new FileStream(curLoad.FilePath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite);

                    ws = new ExcelPackage(fi);

                    if (estimeFileType.IsUniform)
                    {
                        //Uniform file
                        using (ws = new ExcelPackage(fi))
                        {
                            var sheet = ws.Workbook.Worksheets[estimeFileType.SheetNumber ?? 1];

                            List<TdLoadStaging> myStaging = new List<TdLoadStaging>();

                            var start = sheet.Dimension.Start;
                            var end = sheet.Dimension.End;
                            //The data starts at row 2
                            for (int row = start.Row + 1; row <= end.Row; row++)
                            { // Row by row...  
                                List<string> rowVals = new List<string>();
                                for (int col = start.Column; col <= end.Column; col++)
                                { // ... Cell by cell...  
                                    string cellValue = sheet.Cells[row, col].Value.ToString();
                                    rowVals.Add(cellValue);
                                }
                                //add the province code to the end
                                if (provCode != null)
                                {
                                    rowVals.Add(provCode);
                                }
                                string myRow = string.Join(',', rowVals);
                                myStaging.Add(new TdLoadStaging(curLoad.Id, row - 1, myRow));
                            }
                            loadSuccess = dal.AddTdLoadStaging(curLoad.Id, refPeriodId, myStaging);
                        }
                    }
                    else 
                    {
                        List<TlInputCoordinate> inputCoordinates = dal.GetInputCoordinateListByEstimeFileType(estimeFileType.Id).ToList();
                        //use the input coordinates to converte the data in ws to a list of TdLoadData
                        List<TdLoadData> myData = new List<TdLoadData>();

                        //var fileStream = new FileStream(FilePath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite);


                        using (ws = new ExcelPackage(fi))
                        {
                            var sheet = ws.Workbook.Worksheets[estimeFileType.SheetNumber ?? 1];
                            inputCoordinates.ForEach(delegate (TlInputCoordinate coord)
                            {
                                int rowNum = coord.RowNumber ?? -1;
                                int colNum = coord.ColumnNumber;

                                string val = sheet.Cells[rowNum, colNum].Value.ToString();

                                myData.Add(new TdLoadData(curLoad.Id, coord.RecordNumber, coord.InputVariableId,
                                    refPeriodId, val));
                            });

                        }
                        //Add new data and save to database
                        loadSuccess = dal.AddTdLoadData(curLoad.Id, refPeriodId, myData);
                    }
                }
                return loadSuccess;
            }
            catch (Exception e)
            {
                loadErr = e.Message;
                loadSuccess = false;
                return loadSuccess;
            }
            finally
            {
                EndLoading();
            }
        }

        private void EndLoading()
        {
            curLoad.EndTime = System.DateTime.Now;
            int loadStatusId;
            if (loadSuccess)
            {
                loadStatusId = dal.GetLoadStatusId("C");
            }
            else
            {
                loadStatusId = dal.GetLoadStatusId("F");
            }
            curLoad.LoadStatusId = loadStatusId;
            if (!string.IsNullOrEmpty(loadErr))
            {
                curLoad.ErrorMessage = loadErr;
            }
           
            dal.UpdateTdLoad(curLoad);

        }
        public void WriteToLog(string filePath, string fileContents)
        {
            try
            {
                System.IO.File.WriteAllText(filePath, fileContents);
            }
            catch (Exception e)
            {
                throw e;
            }
        }



    }
}
