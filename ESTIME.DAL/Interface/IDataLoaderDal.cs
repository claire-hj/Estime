using System;
using System.Collections.Generic;
using System.Text;
using ESTIME.DAL.EstimeEntity;

namespace ESTIME.DAL.Interface
{
    public interface IDataLoaderDal
    {
        int GetEstimeFileTypeId(string estimeFileTypeCode);
        TlEstimeFileType GetEstimeFileTypeByCode(string estimeFileTypeCode);
        int GetLoadStatusId(string loadStatusCode);
        TlLoadStatus GetLoadStatusByCode(string loadStatusCode);
        int GetRefPeriodId(string refPeriodCode);
        TcRefPeriod GetRefPeriodByCode(string refPeriodCode);
        EnumReturnCode AddTdLoad(ref TdLoad newLoad);
        EnumReturnCode UpdateTdLoad(TdLoad curLoad);
        IEnumerable<TlInputCoordinate> GetInputCoordinateListByEstimeFileType(int estimeFileTypeId);
        EnumReturnCode LoadTextDataFileByBulk(int loadId, int refPeriodId);
        EnumReturnCode AddTdLoadStaging(int loadId, int refPeriodId, List<TdLoadStaging> newLoadStaging);
        EnumReturnCode AddTdLoadData(int loadId, int refPeriodId, List<TdLoadData>myData);

    }
}
