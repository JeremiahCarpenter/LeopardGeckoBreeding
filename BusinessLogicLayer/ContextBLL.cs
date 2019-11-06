using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLogicLayer
{
    public class ContextBLL : IDisposable
    {
        #region Connection
        private ContextDAL ctx = new ContextDAL();
        public void Dispose()
        {
            ctx.Dispose();
        }
        public ContextBLL()
        {
            ctx.ConnectionString = @"Data Source=.\sqlexpress;Initial Catalog=LeopardGeckoBreeding;Integrated Security=True";
        }
        #endregion
        #region Geckos
        public int CreateGecko(string Sex,decimal Weight,bool BreedEligability,int Age, int OwnerID)
        {
            return ctx.CreateGecko(Sex,Weight,BreedEligability,Age,OwnerID);
        }
        public void DeleteGecko(int GeckoID)
        {
            ctx.DeleteGecko(GeckoID);
        }
        public void JustUpdateGecko(int GeckoID, string Sex, decimal Weight, bool BreedEligability, int Age, int OwnerID)
        {
            ctx.JustUpdateGecko(GeckoID, Sex, Weight, BreedEligability, Age, OwnerID);
        }
        public int SafeUpdateGecko(int GeckoID, string OldSex, decimal OldWeight, bool OldBreedEligability, int OldAge, int OldOwnerID, string NewSex, decimal NewWeight, bool NewBreedEligability, int NewAge, int NewOwnerID)
        {
            return ctx.SafeUpdateGecko(GeckoID, OldSex, OldWeight, OldBreedEligability, OldAge, OldOwnerID, NewSex, NewWeight, NewBreedEligability, NewAge, NewOwnerID);
        }
        public GeckoBLL FindGeckoByID(int GeckoID)
        {
            GeckoBLL rv = null;
            GeckoDAL dal = ctx.FindGeckoByID(GeckoID);
            if (dal != null)
            {
                rv = new GeckoBLL(dal);
            }
            return rv;
        }
        public List<GeckoBLL> GetGeckos(int skip, int take)
        {
            List<GeckoBLL> rv = new List<GeckoBLL>();
            List<GeckoDAL> dalitems = ctx.GetGeckos(skip, take);
            foreach (GeckoDAL dal in dalitems)
            {
                rv.Add(new GeckoBLL(dal));
            }
            return rv;
        }
        public List<GeckoBLL> GetGcekosRelatedToMorph(int skip, int take, int MorphID)
        {
            List<GeckoBLL> rv = new List<GeckoBLL>();
            List<GeckoDAL> dalitems = ctx.GetGeckosRelatedToMorph(skip, take, MorphID);
            foreach (GeckoDAL dal in dalitems)
            {
                rv.Add(new GeckoBLL(dal));
            }
            return rv;
        }
        public List<GeckoBLL> GetGcekosRelatedToUser(int skip, int take, int UserID)
        {
            List<GeckoBLL> rv = new List<GeckoBLL>();
            List<GeckoDAL> dalitems = ctx.GetGeckosRelatedToUser(skip, take, UserID);
            foreach (GeckoDAL dal in dalitems)
            {
                rv.Add(new GeckoBLL(dal));
            }
            return rv;
        }
        #endregion
        #region InterTable
        public void CreateInterTable(int GeckoID, int MorphID)
        {
            ctx.CreateInterTable(GeckoID, MorphID);
        }
        public void DeleteInterTable(int GeckoID, int MorphID)
        {
            ctx.DeleteInterTable(GeckoID, MorphID);
        }
        public List<InterTableBLL> GetInterTables(int skip, int take)
        {
            List<InterTableBLL> rv = new List<InterTableBLL>();
            List<InterTableDAL> dalitems = ctx.GetIntertables(skip, take);
            foreach (InterTableDAL dal in dalitems)
            {
                rv.Add(new InterTableBLL(dal));
            }
            return rv;
        }
        #endregion
        #region Morphs
        public int CreateMorph(string MorphName,string Description,bool Het)
        {
            return ctx.CreateMorph(MorphName, Description, Het);
        }
        public void DeleteMorph(int MorphID)
        {
            ctx.DeleteMorph(MorphID);
        }
        public void JustUpdateMorph(int MorphID, string MorphName, string Description,bool Het)
        {
            ctx.JustUpdateMorph(MorphID, MorphName,Description,Het);
        }
        public int SafeupdateMorph(int MorphID, string OldMorphName, string NewMorphName,string OldDescription,string NewDescription, bool OldHet, bool NewHet)
        {
            return ctx.SafeUpdateMorph(MorphID, OldMorphName, OldDescription, OldHet, NewMorphName, NewDescription, NewHet);
        }
        public MorphBLL FindMorphByID(int MorphID)
        {
            MorphBLL rv = null;
            MorphDAL dal = ctx.FindMorphByID(MorphID);
            if (dal != null)
            {
                rv = new MorphBLL(dal);
            }
            return rv;
        }
        public List<MorphBLL> GetMorphs(int skip, int take)
        {
            List<MorphBLL> rv = new List<MorphBLL>();
            List<MorphDAL> dalitems = ctx.GetMorphs(skip, take);
            foreach (MorphDAL dal in dalitems)
            {
                rv.Add(new MorphBLL(dal));
            }
            return rv;
        }
        public List<MorphBLL> GetMorphsRelatedToGecko(int skip, int take,int GeckoID)
        {
            List<MorphBLL> rv = new List<MorphBLL>();
            List<MorphDAL> dalitems = ctx.GetMorphsRelatedToGecko(skip, take,GeckoID);
            foreach (MorphDAL dal in dalitems)
            {
                rv.Add(new MorphBLL(dal));
            }
            return rv;
        }
        #endregion
        #region Roles
        public int CreateRole(string Role)
        {
            return ctx.CreateRole(Role);
        }
        public void DeleteRole(int RoleID)
        {
            ctx.DeleteRole(RoleID);
        }
        public void JustUpdateRole(int RoleID, string Role)
        {
            ctx.JustUpdateRole(RoleID, Role);
        }
        public int SafeupdateRole(int RoleID, string OldRole, string NewRole)
        {
            return ctx.SafeUpdateRole(RoleID,OldRole,NewRole);
        }
        public RoleBLL FindRoleByID(int RoleID)
        {
            RoleBLL rv = null;
            RoleDAL dal = ctx.FindRoleByID(RoleID);
            if (dal != null)
            {
                rv = new RoleBLL(dal);
            }
            return rv;
        }
        public List<RoleBLL> GetRoles(int skip, int take)
        {
            List<RoleBLL> rv = new List<RoleBLL>();
            List<RoleDAL> dalitems = ctx.GetRoles(skip, take);
            foreach (RoleDAL dal in dalitems)
            {
                rv.Add(new RoleBLL(dal));
            }
            return rv;
        }
        #endregion
        #region Users
        //these methods call into the methods form the previous layer
        public int CreateUser(string UserName, string EmailAddress, int RoleID, string Password, string Hash, string Salt)
        {
            return ctx.CreateUser(UserName,EmailAddress,RoleID,Password,Hash,Salt);
        }
        public void DeleteUser(int UserID)
        {
            ctx.DeleteUser(UserID);
        }
        public void JustUpdateUser(int UserID, string UserName, string EmailAddress, int RoleID, string Password, string Hash, string Salt)
        {
            ctx.JustUpdateUser(UserID, UserName, EmailAddress, RoleID, Password, Hash, Salt);
        }
        public int SafeUpdatUser(int UserID, string OldUserName, string OldEmailAddress, int OldRoleID, string OldPassword, string OldHash, string OldSalt, string NewUserName, string NewEmailAddress, int NewRoleID, string NewPassword, string NewHash, string NewSalt)
        {
            return ctx.SafeUpdateUser(UserID, OldUserName, OldEmailAddress, OldRoleID, OldPassword, OldHash, OldSalt, NewUserName, NewEmailAddress, NewRoleID, NewPassword, NewHash, NewSalt);
        }
        public UserBLL FindUserByID(int UserID)
        {
            UserBLL rv = null;
            UserDAL dal = ctx.FindUserByID(UserID);
            if (dal != null)
            {
                rv = new UserBLL(dal);
            }
            return rv;
        }
        public UserBLL FindUserByEmail(string EmailAddress)
        {
            UserBLL rv = null;
            UserDAL dal = ctx.FindUserByEmail(EmailAddress);
            if (dal != null)
            {
                rv = new UserBLL(dal);
            }
            return rv;
        }
        public List<UserBLL> GetUsers(int skip, int take)
        {
            List<UserBLL> rv = new List<UserBLL>();
            List<UserDAL> dalitems = ctx.GetUsers(skip, take);
            foreach (UserDAL dal in dalitems)
            {
                rv.Add(new UserBLL(dal));
            }
            return rv;
        }
        public List<UserBLL> GetUsersRelatedToRole(int skip, int take, int RoleID)
        {
            List<UserBLL> rv = new List<UserBLL>();
            List<UserDAL> dalitems = ctx.GetUsersRelatedToRole(skip, take, RoleID);
            foreach (UserDAL dal in dalitems)
            {
                rv.Add(new UserBLL(dal));
            }
            return rv;
        }
        #endregion
        public List<MorphPlusBLL> BreedGekcos(List<MorphBLL> One, List<MorphBLL> Two)
        {//this method creates a "fullouter join" between the lists which is not supported by linq
            //a full outer join compares every record from the first param to every record of the second 
            var leftouter =
                (from m1 in One
                 join m2 in Two on m1.MorphName equals
                  m2.MorphName
              //select new MorphPlus(m1, m2);
              into loj
                 from mempty in loj.DefaultIfEmpty()
                 select new MorphPlusBLL(m1, loj.FirstOrDefault())).ToList();
            var rightouter =
                (from m1 in Two
                 join m2 in One on m1.MorphName equals m2.MorphName

                into loj
                 from mempty in loj.DefaultIfEmpty()
                 select new MorphPlusBLL(m1, loj.FirstOrDefault())).ToList();

            return (leftouter.Union(rightouter)).ToList();


        }
    }
}

