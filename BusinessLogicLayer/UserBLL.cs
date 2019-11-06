using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLogicLayer
{
    public class UserBLL
    {
        public UserBLL()
        { }
        public UserBLL(UserDAL dal)//serves the same role of the mapper from the dal 
        {
            this.UserID = dal.UserID;
            this.UserName = dal.UserName;
            this.EmailAddress = dal.EmailAddress;
            this.RoleID = dal.RoleID;
            this.Password = dal.Password;
            this.Hash = dal.Hash;
            this.Salt = dal.Salt;
            this.Role = dal.Role;
        }
        #region DirectMapping
        public int UserID { get; set; }
        public string UserName { get; set; }
        public string EmailAddress { get; set; }
        public int RoleID { get; set; }
        public string Password { get; set; }
        public string Hash { get; set; }
        public string Salt { get; set; }
        #endregion
        #region IndirectMapping 
        public string Role { get; set; }
        #endregion
    }
}
