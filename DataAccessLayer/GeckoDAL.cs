using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class GeckoDAL//
    {
        #region DirectMapping
        public int GeckoID { get; set; }
        public string Sex { get; set; }
        public decimal Weight { get; set; }
        public bool BreedEligability { get; set; }
        public int Age { get; set; }
        public int OwnerID { get; set; }
        #endregion
    }
}
