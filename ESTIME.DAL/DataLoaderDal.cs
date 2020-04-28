using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;

using Microsoft.EntityFrameworkCore;
using ESTIME.DAL.Interface;
using ESTIME.DAL.EstimeEntity;
using System.Data;
using System.Data.SqlClient;

namespace ESTIME.DAL
{
    public class DataLoaderDal : IDataLoaderDal
    {
        private string connString;
        private DbContextOptions<EstimeContext> options;

        public DataLoaderDal(string connStr)
        {
            connString = connStr;
            options = new DbContextOptions<EstimeContext>();
        }

        public int GetEstimeFileTypeId(string estimeFileTypeCode)
        {
            int id = 0;
            using (var context = new EstimeContext(options, connString))
            {
                EFHelper.CallEF(() =>
                {
                    id = context.TlEstimeFileType.FirstOrDefault(eft => eft.Code == estimeFileTypeCode).Id;
                });
            }
            return id;
        }
        public TlEstimeFileType GetEstimeFileTypeByCode(string estimeFileTypeCode)
        {
            TlEstimeFileType eft = null;
            using (var context = new EstimeContext(options, connString))
            {
                EFHelper.CallEF(() =>
                {
                    eft = context.TlEstimeFileType.Include(e => e.FileType).FirstOrDefault(e => e.Code == estimeFileTypeCode);
                });
            }
            return eft;
        }
        public int GetLoadStatusId(string loadStatusCode)
        {
            int id = 0;
            using (var context = new EstimeContext(options, connString))
            {
                EFHelper.CallEF(() =>
                {
                    id = context.TlLoadStatus.FirstOrDefault(l => l.Code == loadStatusCode).Id;
                });
            }
            return id;
        }
        public TlLoadStatus GetLoadStatusByCode(string loadStatusCode)
        {
            TlLoadStatus ls = null;
            using (var context = new EstimeContext(options, connString))
            {
                EFHelper.CallEF(() =>
                {
                    ls = context.TlLoadStatus.FirstOrDefault(l => l.Code == loadStatusCode);
                });
            }
            return ls;
        }
        public int GetRefPeriodId(string refPeriodCode)
        {
            int id = 0;
            using (var context = new EstimeContext(options, connString))
            {
                EFHelper.CallEF(() =>
                {
                    id = context.TcRefPeriod.FirstOrDefault(r => r.Code == refPeriodCode).Id;
                });
            }
            return id;
        }
        public TcRefPeriod GetRefPeriodByCode(string refPeriodCode)
        {
            TcRefPeriod rp = null;
            using (var context = new EstimeContext(options, connString))
            {
                EFHelper.CallEF(() =>
                {
                    rp = context.TcRefPeriod.Include(r => r.RefPeriodType).FirstOrDefault(r => r.Code == refPeriodCode);
                });
            }
            return rp;
        }
        public EnumReturnCode AddTdLoad(ref TdLoad newLoad)
        {
            EnumReturnCode retVal = EnumReturnCode.Success;
            using (var context = new EstimeContext(options, connString))
            {
                try
                {
                    context.TdLoad.Add(newLoad);
                    context.SaveChanges();
                }
                catch
                {
                    retVal = EnumReturnCode.EfException;
                }
            }
            return retVal;
        }
        public EnumReturnCode UpdateTdLoad(TdLoad curLoad)
        {
            EnumReturnCode retVal = EnumReturnCode.Success;
            using (var context = new EstimeContext(options, connString))
            {
                try 
                {
                    context.TdLoad.Update(curLoad);
                    context.SaveChanges();
                }
                catch
                {
                    retVal = EnumReturnCode.EfException;
                }
            }
            return retVal;
        }
        public IEnumerable<TlInputCoordinate> GetInputCoordinateListByEstimeFileType(int estFileTypeId)
        {
            IQueryable<TlInputCoordinate> coors = null;
            List<TlInputCoordinate> myList = new List<TlInputCoordinate>();

            using (var context = new EstimeContext(options, connString))
            {
                EFHelper.CallEF(() =>
                {
                    coors = (from ic in context.TlInputCoordinate.Include(ic => ic.InputVariable).ThenInclude(iv => iv.Variable)
                             join iv in context.TlInputVariable
                             on ic.InputVariableId equals iv.Id
                             where iv.EstimeFileTypeId == estFileTypeId
                             select ic);
                });
                myList = coors.ToList();
            }
            return myList;
        }
        public EnumReturnCode AddTdLoadData(int loadId, int refPeriodId, List<TdLoadData> newLoadData)
        {
            EnumReturnCode retVal;

            using (var context = new EstimeContext(connString))
            {
                using (var trans = context.Database.BeginTransaction())
                {
                    //Add parameters for the stored proc
                    SqlParameter loadIdParam = new SqlParameter("@LoadId", SqlDbType.Int)
                    {
                        Value = loadId
                    };

                    SqlParameter refPeriodIdParam = new SqlParameter("@RefPeriodId", SqlDbType.Int)
                    {
                        Value = refPeriodId
                    };

                    SqlParameter successParam = new SqlParameter("@SuccessCode", SqlDbType.Int)
                    {
                        Direction = ParameterDirection.Output
                    };

                    SqlParameter errorMessageParam = new SqlParameter("@ErrorExceptionMessage", SqlDbType.NVarChar)
                    {
                        Size = 50000,
                        Direction = ParameterDirection.Output
                    };

                    SqlParameter[] parameters = new SqlParameter[] { loadIdParam, refPeriodIdParam, successParam, errorMessageParam };

                    try
                    {
                        context.Database.ExecuteSqlCommand("ESTIME.usp_InsertLoadData_MetadataPoint @LoadId, @RefPeriodId, @SuccessCode OUTPUT, @ErrorExceptionMessage OUTPUT", parameters);

                        retVal = (int)successParam.Value == 0 ? EnumReturnCode.Success : EnumReturnCode.DbException;

                        context.TdLoadData.AddRange(newLoadData);
                        context.SaveChanges();
                        trans.Commit();
                    }
                    catch (Exception)
                    {
                        retVal = EnumReturnCode.EfException;
                        trans.Rollback();
                    }
                }
            }
            return retVal;
        }
        public EnumReturnCode AddTdLoadStaging(int loadId, int refPeriodId, List<TdLoadStaging> newLoadStaging)
        {
            EnumReturnCode retVal;
            using (var context = new EstimeContext(connString))
            {
                using (var trans = context.Database.BeginTransaction())
                {
                    //Add parameters for the stored proc
                    SqlParameter loadIdParam = new SqlParameter("@LoadId", SqlDbType.Int)
                    {
                        Value = loadId
                    };

                    SqlParameter refPeriodIdParam = new SqlParameter("@RefPeriodId", SqlDbType.Int)
                    {
                        Value = refPeriodId
                    };

                    SqlParameter successParam = new SqlParameter("@SuccessCode", SqlDbType.Int)
                    {
                        Direction = ParameterDirection.Output
                    };

                    SqlParameter errorMessageParam = new SqlParameter("@ErrorExceptionMessage", SqlDbType.NVarChar)
                    {
                        Size = 50000,
                        Direction = ParameterDirection.Output
                    };

                    SqlParameter[] parameters = new SqlParameter[] { loadIdParam, refPeriodIdParam, successParam, errorMessageParam };

                    try
                    {
                        context.TdLoadStaging.AddRange(newLoadStaging);
                        context.SaveChanges();

                        context.Database.ExecuteSqlCommand("ESTIME.usp_ProcessLoadStagingData @LoadId, @RefPeriodId, @SuccessCode OUTPUT, @ErrorExceptionMessage OUTPUT", parameters);
                        retVal = (int)successParam.Value == 0 ? EnumReturnCode.Success : EnumReturnCode.DbException;

                        trans.Commit();
                    }
                    catch (Exception)
                    {
                        retVal = EnumReturnCode.EfException;
                        trans.Rollback();
                    }
                }
            }
            return retVal;
        }
        public EnumReturnCode LoadTextDataFileByBulk(int loadId, int refPeriodId)
        {
            EnumReturnCode retVal;
            using (var context = new EstimeContext(connString))
            {
                var cmd = context.Database.GetDbConnection().CreateCommand();

                cmd.CommandText = "ESTIME.usp_BulkLoadTextFile";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;

                //Add parameters
                DbParameter ldId = cmd.CreateParameter();
                ldId.ParameterName = "@LoadId";
                ldId.Value = loadId;
                cmd.Parameters.Add(ldId);

                DbParameter rpId = cmd.CreateParameter();
                rpId.ParameterName = "@RefPeriodId";
                rpId.Value = refPeriodId;
                cmd.Parameters.Add(rpId);

                //output parameters
                DbParameter success = cmd.CreateParameter();
                success.ParameterName = "@SuccessCode";
                success.Direction = System.Data.ParameterDirection.Output;
                success.DbType = System.Data.DbType.Int32;
                cmd.Parameters.Add(success);

                DbParameter errMessage = cmd.CreateParameter();
                errMessage.ParameterName = "@ErrorExceptionMessage";
                errMessage.Direction = System.Data.ParameterDirection.Output;
                errMessage.DbType = System.Data.DbType.String;
                errMessage.Size = 50000;
                cmd.Parameters.Add(errMessage);

                cmd.Connection.Open();
                try
                {
                    cmd.ExecuteNonQuery();
                    retVal = (int)success.Value == 0 ? EnumReturnCode.Success : EnumReturnCode.DbException;
                }
                catch (Exception)
                {
                    retVal = EnumReturnCode.EfException;
                }
                finally
                {
                    cmd.Connection.Close();
                }
            }
            return retVal;
        }
    }
}