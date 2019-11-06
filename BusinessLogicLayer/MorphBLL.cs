using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLogicLayer
{
    public class MorphBLL
    {
        public MorphBLL()
        { }
        public MorphBLL(MorphDAL dal)
        {
            this.MorphID = dal.MorphID;
            this.MorphName = dal.MorphName;
            this.Description = dal.Description;
            this.Het = dal.Het;
        }
        #region DirectMapping
        public int MorphID { get; set; }
        public string MorphName { get; set; }
        public string Description { get; set; }
        public bool Het { get; set; }
        #endregion
    }
}
