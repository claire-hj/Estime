using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ESTIME.BusinessLibrary;
using System.IO;
using OfficeOpenXml;
using Microsoft.AspNetCore.Mvc.Formatters;

namespace ESTIME.RESTfulAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DataLoaderController : ControllerBase
    {
        private DataLoaderManager dataLoaderManager;
        //private const string filePath = "\\\\fld5filer\\TransSurfaceIM\\Systems\\SystemDocs\\EstimeLoaderInputFiles\\";
        //private const string filePath = "C:\\Users\\Claire\\Desktop\\ESTIME\\"; //temporary
        private const string filePath = "C:\\Users\\ShanC\\Desktop\\Work\\Requirements\\Epic101_Birth\\"; //temporary
        public DataLoaderController(DataLoaderManager manager)
        {
            //this.config = config;
            dataLoaderManager = manager;
        }

        [HttpGet("Starting/{fileName}/{userId}")]
        public void Start(string fileName, string userId)
        {
            //get EstimeFileTypeCode and RefPeriod from fileName
            
            string[] splitName = fileName.Split('_');
            string estimeFileTypeCode = splitName[0].Trim();
            string refPeriod = splitName[1].Trim();
            string prov = splitName[2].Trim();

            fileName = filePath + fileName;

            dataLoaderManager.StartLoading(refPeriod, estimeFileTypeCode, fileName, userId);

            dataLoaderManager.TryLoadData(prov.Length == 2 ? prov : null);
        }
        [HttpGet("Loading")]
        public void Loading()
        {
            dataLoaderManager.TryLoadData();

            //ESTIME.DAL.DataLoaderDal dataLoader = new DAL.DataLoaderDal("server=EETSDFTSDEV;database=EETSD_FTS_D;Integrated Security=True");
            //dataLoader.LoadDataFileOld("test", userId);
        }

        [HttpGet("ReadFile", Name = "ReadFile")]
        public void ReadFile()
        {

            var fi = new FileInfo(@"C:\Users\Claire\Desktop\ESTIME\test.xlsx");
            using (var p = new ExcelPackage(fi))
            {
                var ws = p.Workbook.Worksheets[1];
                //[h, 8]
                var v = ws.Cells[10, 8].Value;

            }
        }

    }
}