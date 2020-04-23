using Microsoft.ApplicationInsights.AspNetCore;
using System;
using System.Collections.Generic;
using System.Text;
using ESTIME.DAL;

namespace ESTIME.RESTfulAPI.Objects
{
    public class ScheduledJobResult
    {
        public int ResultID { get; set; }
        public string ResultCode { get; set; }
        public string MessageEnglish { get; set; }
        public string MessageFrench { get; set; }
        public ScheduledJobResult(EnumReturnCode retVal)
        {
            ResultID = (int)retVal;
            ResultCode = retVal.ToString();
            if (retVal == EnumReturnCode.Success)
            {
                MessageEnglish = Resources.EstimeResource.GetString("ScheduledJobFinishedSuccessfully");
                MessageFrench = Resources.EstimeResource.GetString("ScheduledJobFinishedSuccessfully", true);
            }
            else
            {
                MessageEnglish = Resources.EstimeResource.GetString("CriticalError");
                MessageFrench = Resources.EstimeResource.GetString("CriticalError", true);
            }
        }
    }
}

