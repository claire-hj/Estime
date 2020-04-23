using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ESTIME.RESTfulAPI.Resources
{
    public static class EstimeResource
    {
        private static List<RecourceElement> Resources = new List<RecourceElement> 
        {
            new RecourceElement{ Key = "CriticalError", StringEnglish = "Critical ERROR.", StringFrench = "Critical ERROR. fr"},
            new RecourceElement{ Key = "ScheduledJobFinishedSuccessfully", StringEnglish = "Scheduled job finished successfully.", StringFrench = "Scheduled job finished successfully. fr"}
        };

        public static string GetString(string key, bool isFre = false)
        {
            var str = "";
            var e = Resources.Find(x => x.Key == key);
            if (e != null) { str = isFre ? e.StringFrench : e.StringEnglish; }
            return str;
        }
    }

    public class RecourceElement
    {
        public string Key { get; set; }
        public string StringEnglish { get; set; }
        public string StringFrench { get; set; }
    }
}
