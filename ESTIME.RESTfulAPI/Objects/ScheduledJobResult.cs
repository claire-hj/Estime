using Microsoft.ApplicationInsights.AspNetCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace ESTIME.RESTfulAPI.Objects
{
    public class ScheduledJobResult
    {
        public int ResultID { get; set; }
        public string ResultCode { get; set; }
        public string MessageEnglish { get; set; }
        public string MessageFrench { get; set; }
        public ScheduledJobResult(bool isSuccessful)
        {
            if (isSuccessful)
            {
                ResultID = 1;
                ResultCode = "Sucess";
                MessageEnglish = "";
                MessageFrench = "";
            }
            else
            {
                ResultID = 2;
                ResultCode = "Fail";
                MessageEnglish = "";
                MessageFrench = "";
            }
        }
    }
}

