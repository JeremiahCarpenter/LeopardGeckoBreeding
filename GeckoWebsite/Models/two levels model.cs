using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GeckoWebsite.Models
{
    public class TwoLevelsModel  
    {

        public int UserID { get; set; }
        public string UserName { get; set; }
        public string EmailAddress { get; set; }
        public int RoleID { get; set; }
        public string Password { get; set; }
        public string Hash { get; set; }
        public string Salt { get; set; }
        public int GeckoID { get; set; }
        public string Sex { get; set; }
        public decimal Weight { get; set; }
        public bool BreedEligability { get; set; }
        public int Age { get; set; }
        public int OwnerID { get; set; }
    }
}