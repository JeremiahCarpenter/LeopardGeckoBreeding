using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GeckoWebsite.Models
{
    public class RegistrationModel
    {
        public string UserName { get; set; }
        public string Password { get; set; }
        //public string ConfirmPassword { get; set; }
        public string EmailAddress { get; set; }
        //public string Name { get; set; }
        public string ReturnURL { get; set; }
    }
}