using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLogicLayer
{
    public class RoleBLL
    {
        public RoleBLL()
        { }
        public RoleBLL(RoleDAL dal)
        {
            this.RoleID = dal.RoleID;
            this.Role = dal.Role;
        }
        #region DirectMapping
        public int RoleID { get; set; }
        public string Role { get; set; }
        #endregion
    }
}
