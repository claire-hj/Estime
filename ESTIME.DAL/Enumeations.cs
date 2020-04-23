using System;
using System.Collections.Generic;
using System.Text;

namespace ESTIME.DAL
{
    public enum EnumReturnCode : int
    {
        Success = 0,
        Failed = 1,
        NetworkError = 2,
        DbException = 3,
        EfException = 4,
        FileNotFound = 5,
        CannotOpenFile = 6,
        FileTypeNotMatched = 7,
        EmptyFile = 8
    }
}
