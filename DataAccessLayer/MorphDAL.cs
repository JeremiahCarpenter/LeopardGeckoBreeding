using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class MorphDAL//
    {
        #region Direct Mapping
        public int MorphID { get; set; }
        public string MorphName { get; set; }
        public string Description { get; set; }
        public bool Het { get; set; }
        #endregion
    }
}
