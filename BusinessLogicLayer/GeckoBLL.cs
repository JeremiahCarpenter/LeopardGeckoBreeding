using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLogicLayer
{
    public class GeckoBLL
    {
        public GeckoBLL()
        {

        }
        public GeckoBLL(GeckoDAL dal)
        {
            this.GeckoID = dal.GeckoID;
            this.Sex = dal.Sex;
            this.Weight = dal.Weight;
            this.BreedEligability = dal.BreedEligability;
            this.Age = dal.Age;
            this.OwnerID = dal.OwnerID;
        }
        #region Direct Mapping
        public int GeckoID { get; set; }
        public string Sex { get; set; }
        public decimal Weight { get; set; }
        public bool BreedEligability { get; set; }
        public int Age { get; set; }
        public int OwnerID { get; set; }
        #endregion
    }
}
