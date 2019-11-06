using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLogicLayer
{
    public class InterTableBLL
    {

        public InterTableBLL()
        {

        }
        public InterTableBLL(InterTableDAL dal)
        {
            this.GeckoID = dal.GeckoID;
            this.MorphID = dal.MorphID;
        }
        #region Direct Mapping
        public int GeckoID { get; set; }
        public int MorphID { get; set; }
        #endregion

    }
}
