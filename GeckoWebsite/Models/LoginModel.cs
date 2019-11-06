using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GeckoWebsite.Models
{
    public class LoginModel
    {
        public string EmailAddress { get; set; }
        public string Password { get; set; }
        public string Message { get; set; }
        public string ReturnURL { get; set; }
    }
}