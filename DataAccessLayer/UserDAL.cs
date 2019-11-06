using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class UserDAL //this all acts as a "container" for the information that is pulled from SQL
    {
        #region Direct Mapping
        public int UserID { get; set; }//the direct mapping is all of the information that comes from the user table 
        public string UserName { get; set; }
        public string EmailAddress { get; set; }
        public int RoleID { get; set; }
        public string Password { get; set; }
        public string Hash { get; set; }
        public string Salt { get; set; }
        #endregion
        #region Indirect Mapping 
        public string Role { get; set; } // the indirect mapping is all the information that comes from an outside table
        #endregion
    }
}
