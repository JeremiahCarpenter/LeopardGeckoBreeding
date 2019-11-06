using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace DataAccessLayer
{
    #region Mappers
    public class Mapper
    {
        public void assert(bool test, string message)//method that we created to ensure that whatever statement it is applied to is true
        {
            if (!test)
            {
                throw new Exception(message);
            }
        }
        public string GetStringOrNull(System.Data.SqlClient.SqlDataReader r, int i)
        {
            string rv = null;
            if (!r.IsDBNull(i))
            {
                rv = r.GetString(i);
            }
            return rv;
        }
        public int GetInt32OrZero(System.Data.SqlClient.SqlDataReader r, int i)
        {
            int rv = 0;
            if (!r.IsDBNull(i))
            {
                rv = r.GetInt32(i);
            }
            return rv;
        }
        public bool GetBoolean(System.Data.SqlClient.SqlDataReader r, int i)
        {
            bool rv = true;
            if (!r.IsDBNull(i))
            {
                rv = r.GetBoolean(i);
            }
            return rv;
        }
    }
    public class GeckoMapper : Mapper
    {
        int GeckoIDOrdinal;
        int SexOrdinal;
        int WeightOrdinal;
        int BreedEligabilityOrdinal;
        int AgeOrdinal;
        int OwnerIdOrdinal;
        public GeckoMapper(SqlDataReader r)
        {
            GeckoIDOrdinal = r.GetOrdinal("GeckoID");
            assert(0 == GeckoIDOrdinal, "GeckoID is not column 0 as expected");//
            SexOrdinal = r.GetOrdinal("Sex");
            assert(1 == SexOrdinal, "Sex is not column 1 as expected");//
            WeightOrdinal = r.GetOrdinal("Weight");
            assert(2 == WeightOrdinal, "Weight is not column 2 as expected");//
            BreedEligabilityOrdinal = r.GetOrdinal("BreedEligability");
            assert(3 == BreedEligabilityOrdinal, "BreedEligability is not column 3 as expected");//
            AgeOrdinal = r.GetOrdinal("Age");
            assert(4 == AgeOrdinal, "Age is not column 4 as expected");//
            OwnerIdOrdinal = r.GetOrdinal("OwnerID");
            assert(5 == OwnerIdOrdinal, "OwnerID is not column 5 as expected");//
        }
        public GeckoDAL ToGecko(SqlDataReader r)
        {
            GeckoDAL rv = new GeckoDAL();
            rv.GeckoID = GetInt32OrZero(r, GeckoIDOrdinal);
            rv.Sex = r.GetString(SexOrdinal);
            rv.Weight = r.GetDecimal(WeightOrdinal);
            rv.BreedEligability = GetBoolean(r, BreedEligabilityOrdinal);
            rv.Age = GetInt32OrZero(r, AgeOrdinal);
            rv.OwnerID = GetInt32OrZero(r, OwnerIdOrdinal);
            return rv;
        }
    }
    public class InterTableMapper : Mapper
    {
        int GeckoIDOrdinal;
        int MorphIDOrdinal;
        public InterTableMapper(SqlDataReader r)
        {
            GeckoIDOrdinal = r.GetOrdinal("GeckoID");
            assert(0 == GeckoIDOrdinal, "GeckoID is not column 0 as expected");
            MorphIDOrdinal = r.GetOrdinal("MorphID");
            assert(1 == MorphIDOrdinal, "MorphID is not column 1 as expected");
        }
        public InterTableDAL ToInterTable(SqlDataReader r)
        {
            InterTableDAL rv = new InterTableDAL();
            rv.GeckoID = GetInt32OrZero(r, GeckoIDOrdinal);
            rv.MorphID = GetInt32OrZero(r, MorphIDOrdinal);
            return rv;
        }
    }
    public class MorphMapper : Mapper
    {
        int MorphIDOrdinal;
        int MorphNameOrdinal;
        int DescriptionOrdinal;
        int HetOrdinal;
        public MorphMapper(SqlDataReader r)
        {
            MorphIDOrdinal = r.GetOrdinal("MorphID");
            assert(0 == MorphIDOrdinal, "MorphID is not column 0 as expected");
            MorphNameOrdinal = r.GetOrdinal("MorphName");
            assert(1 == MorphNameOrdinal, "MorphName is not column 1 as expected");
            DescriptionOrdinal = r.GetOrdinal("Description");
            assert(2 == DescriptionOrdinal, "Description is not column 2 as expected");
            HetOrdinal = r.GetOrdinal("Het");
            assert(3 == HetOrdinal, "Het is not column 3 as expected");
        }
        public MorphDAL ToMorph(SqlDataReader r)
        {
            MorphDAL rv = new MorphDAL();
            rv.MorphID = GetInt32OrZero(r, MorphIDOrdinal);
            rv.MorphName = GetStringOrNull(r, MorphNameOrdinal);
            rv.Description = GetStringOrNull(r, DescriptionOrdinal);
            rv.Het = GetBoolean(r, HetOrdinal);
            return rv;
        }
    }
    public class RoleMapper : Mapper
    {
        int RoleIDOrdinal;
        int RoleOrdinal;
        public RoleMapper(SqlDataReader r)
        {
            RoleIDOrdinal = r.GetOrdinal("RoleID");
            assert(0 == RoleIDOrdinal, "RoleID is not column 0 as expected");
            RoleOrdinal = r.GetOrdinal("Role");
            assert(1 == RoleOrdinal, "Role is not column 1 as expected");
        }
        public RoleDAL ToRole(SqlDataReader r)
        {
            RoleDAL rv = new RoleDAL();
            rv.RoleID = GetInt32OrZero(r, RoleIDOrdinal);
            rv.Role = GetStringOrNull(r, RoleOrdinal);
            return rv;
        }
    }
    public class UserMapper : Mapper//Mapper is the parent and all subsequent children inherit the functionality of it
    {
        int UserIDOrdinal;//this establishes the fields the hold the offsets of the columns
        int UserNameOrdinal;
        int EmailAddressOrdinal;
        int RoleIDOrdinal;
        int PasswordOrdinal;
        int HashOrdinal;
        int SaltOrdinal;
        int RoleOrdinal;
        public UserMapper(SqlDataReader r)//this constructor establishes the contents of the above fields,and this is only run one time
        {
            UserIDOrdinal = r.GetOrdinal("UserID");//this line gets the offset for the userid
            assert(0 == UserIDOrdinal, "UserID is not column 0 as expected");//verifies that userid is actually in column 0
            UserNameOrdinal = r.GetOrdinal("UserName");
            assert(1 == UserNameOrdinal, "UserName is not column 1 as expected");
            EmailAddressOrdinal = r.GetOrdinal("EmailAddress");
            assert(2 == EmailAddressOrdinal, "EmailAddress is not column 2 as expected");
            RoleIDOrdinal = r.GetOrdinal("RoleID");
            assert(3 == RoleIDOrdinal, "RoleID is not column 3 as expected");
            PasswordOrdinal = r.GetOrdinal("Password");
            assert(4 == PasswordOrdinal, "Password is not column 4 as expected");
            HashOrdinal = r.GetOrdinal("Hash");
            assert(5 == HashOrdinal, "Hash is not column 5 as expected");
            SaltOrdinal = r.GetOrdinal("Salt");
            assert(6 == SaltOrdinal, "Salt is not column 6 as expected");
            RoleOrdinal = r.GetOrdinal("Role");
            assert(7 == RoleOrdinal, "Role is not column 7 as expected");
        }
        public UserDAL ToUser(SqlDataReader r) //this block takes the reader and breaks it into its parts and places them into the appropriate placs,will run as many times as needed
        {
            UserDAL rv = new UserDAL();//this line generates the empty return value and the subsequent lines get the values from "r" and puts them into the correct places 
            rv.UserID = GetInt32OrZero(r, UserIDOrdinal);
            rv.UserName = GetStringOrNull(r, UserNameOrdinal);
            rv.EmailAddress = GetStringOrNull(r, EmailAddressOrdinal);
            rv.RoleID = GetInt32OrZero(r, RoleIDOrdinal);
            rv.Password = GetStringOrNull(r, PasswordOrdinal);
            rv.Hash = GetStringOrNull(r, HashOrdinal);
            rv.Salt = GetStringOrNull(r, SaltOrdinal);
            rv.Role = GetStringOrNull(r, RoleOrdinal);

            return rv;
        }
    }
    #endregion

    public class ContextDAL : IDisposable //activtes the ability of the using statement which creates a block that once exited is disposed
    {
        #region IDisposable
        public void Dispose()
        {
            Con.Dispose();//this is what is actually disposed
        }

        private System.Data.SqlClient.SqlConnection Con;//this represents the connection to the data base

        private void Log(Exception ex)
        {
            Logger.Logger.Log(ex);//this is the logger that sends the exception to the database
        }

        public ContextDAL()
        {
            Con = new System.Data.SqlClient.SqlConnection();
        }
        public string ConnectionString
        {
            get
            {
                return Con.ConnectionString;
            }
            set
            {
                Con.ConnectionString = value;
            }
        }

        private void EnsureConnected()
        {
            if (Con.State != System.Data.ConnectionState.Open)
            {
                if (Con.State == System.Data.ConnectionState.Broken)
                {
                    Con.Close();
                    Con.Open();
                }
                else if (Con.State == System.Data.ConnectionState.Closed)
                {
                    Con.Open();
                }
            }
        }

        public SqlDataReader ExecuteCommand(SqlCommand cmd)
        {
            if (Con != cmd.Connection)
            {
                cmd.Connection = Con;
            }
            EnsureConnected();
            return cmd.ExecuteReader();
        }
        #endregion
        #region Geckos
        public int CreateGecko(string Sex,decimal Weight,bool BreedEligability,int Age,int OwnerID)
        {
            int rv = 0;
            try
            {
                EnsureConnected();
                using (SqlCommand cmnd = new SqlCommand("CreateGecko", Con))
                {
                    cmnd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmnd.Parameters.AddWithValue("@GeckoID", 0);
                    cmnd.Parameters["@GeckoID"].Direction = System.Data.ParameterDirection.InputOutput;
                    cmnd.Parameters.AddWithValue("@Sex", Sex);
                    cmnd.Parameters.AddWithValue("@Weight", Weight);
                    cmnd.Parameters.AddWithValue("@BreedEligability", BreedEligability);
                    cmnd.Parameters.AddWithValue("@Age", Age);
                    cmnd.Parameters.AddWithValue("@OwnerID", OwnerID);
                    cmnd.ExecuteNonQuery();
                    rv = Convert.ToInt32(cmnd.Parameters["@GeckoID"].Value);
                }
            }
            catch (Exception ex)
            {
                Log(ex);
                throw;
            }
            return rv;
        }//
        public void DeleteGecko(int GeckoID)
        {
            try
            {
                EnsureConnected();
                using (SqlCommand cmnd = new SqlCommand("DeleteGecko", Con))
                {
                    cmnd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmnd.Parameters.AddWithValue("GeckoID", GeckoID);
                    cmnd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                Log(ex);
                throw;
            }
        }//
        public void JustUpdateGecko(int GeckoID,string NewSex,decimal NewWeight,bool NewBreedEligability,int NewAge,int NewOwnerID)
        {
            try
            {
                EnsureConnected();
                using (SqlCommand cmnd = new SqlCommand("JustUpdateGecko", Con))
                {
                    cmnd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmnd.Parameters.AddWithValue("@GeckoID", GeckoID);
                    cmnd.Parameters.AddWithValue("@Sex", NewSex);
                    cmnd.Parameters.AddWithValue("@Weight", NewWeight);
                    cmnd.Parameters.AddWithValue("@BreedEligability", NewBreedEligability);
                    cmnd.Parameters.AddWithValue("@Age", NewAge);
                    cmnd.Parameters.AddWithValue("@OwnerID", NewOwnerID);
                    cmnd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                Log(ex);
                throw;
            }
        }//
        public int SafeUpdateGecko(int GeckoID,string OldSex,decimal OldWeight,bool OldBreedEligability,int OldAge,int OldOwnerID, string NewSex, decimal NewWeight, bool NewBreedEligability, int NewAge, int NewOwnerID)
        {
            int rv = 0;
            try
            {
                EnsureConnected();
                using (SqlCommand command = new SqlCommand("SafeUpdateGecko", Con))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@GeckoID", 0);

                    command.Parameters.AddWithValue("@NewSex", NewSex);
                    command.Parameters.AddWithValue("@NewWeight", NewWeight);
                    command.Parameters.AddWithValue("@NewBreedEligability", NewBreedEligability);
                    command.Parameters.AddWithValue("@NewAge", NewAge);
                    command.Parameters.AddWithValue("@NewOwnerID", NewOwnerID);
                    command.Parameters.AddWithValue("@OldSex", OldSex);
                    command.Parameters.AddWithValue("@OldWeight", OldWeight);
                    command.Parameters.AddWithValue("@OldBreedEligability", OldBreedEligability);
                    command.Parameters.AddWithValue("@OldAge", OldAge);
                    command.Parameters.AddWithValue("@OldOwnerID", OldOwnerID);

                    rv = command.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                Log(ex);
                throw;
            }
            return rv;
        }
        public GeckoDAL FindGeckoByID(int GeckoID)
        {
            GeckoDAL rv = null;
            try
            {
                EnsureConnected();
                using (SqlCommand command = new SqlCommand("FindGeckoByID", Con))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@GeckoID", GeckoID);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        GeckoMapper mapper = new GeckoMapper(reader);
                        if (reader.Read())
                        {
                            rv = mapper.ToGecko(reader);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Log(ex);
                throw;
            }
            return rv;
        }
        public List<GeckoDAL> GetGeckos(int skip,int take)
        {
            List<GeckoDAL> rv = new List<GeckoDAL>();
            try
            {
                EnsureConnected();
                using (SqlCommand command = new SqlCommand("GetGeckos", Con))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@skip", skip);
                    command.Parameters.AddWithValue("@take", take);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        GeckoMapper mapper = new GeckoMapper(reader);
                        while (reader.Read())
                        {
                            GeckoDAL c = mapper.ToGecko(reader);
                            rv.Add(c);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Log(ex);
                throw;
            }
            return rv;
        }
        public List<GeckoDAL> GetGeckosRelatedToMorph(int skip, int take, int MorphID)
        {
            List<GeckoDAL> rv = new List<GeckoDAL>();
            try
            {
                EnsureConnected();
                using (SqlCommand command = new SqlCommand("GetGeckosRelatedToMorph", Con))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@skip", skip);
                    command.Parameters.AddWithValue("@take", take);
                    command.Parameters.AddWithValue("@MorphID", MorphID);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        GeckoMapper mapper = new GeckoMapper(reader);
                        while (reader.Read())
                        {
                            GeckoDAL c = mapper.ToGecko(reader);
                            rv.Add(c);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Log(ex);
                throw;
            }
            return rv;
        }
        public List<GeckoDAL> GetGeckosRelatedToUser(int skip, int take, int UserID)

        {
            List<GeckoDAL> rv = new List<GeckoDAL>();
            try
            {
                EnsureConnected();
                using (SqlCommand command = new SqlCommand("GetGeckosRelatedToUser", Con))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@skip", skip);
                    command.Parameters.AddWithValue("@take", take);
                    command.Parameters.AddWithValue("@UserID", UserID);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        GeckoMapper mapper = new GeckoMapper(reader);
                        while (reader.Read())
                        {
                            GeckoDAL c = mapper.ToGecko(reader);
                            rv.Add(c);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Log(ex);
                throw;
            }
            return rv;
        }
        #endregion
        #region InterTables
        public void CreateInterTable(int GeckoID, int MorphID)
        {
            try
            {
                EnsureConnected();
                using (SqlCommand cmnd = new SqlCommand("CreateInterTable", Con))
                {
                    cmnd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmnd.Parameters.AddWithValue("@GeckoID", GeckoID);
                    cmnd.Parameters.AddWithValue("@MorphID", MorphID);
                    cmnd.ExecuteNonQuery();

                }
            }
            catch (Exception ex)
            {
                Log(ex);
                throw;
            }
        }
        public void DeleteInterTable(int GeckoID,int MorphID)
        {
            try
            {
                EnsureConnected();
                using (SqlCommand cmnd = new SqlCommand("DeleteInterTable", Con))
                {
                    cmnd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmnd.Parameters.AddWithValue("GeckoID", GeckoID);
                    cmnd.Parameters.AddWithValue("MorphID", MorphID);
                    cmnd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                Log(ex);
                throw;
            }
        }
        public List<InterTableDAL> GetIntertables(int skip, int take)
        {
            List<InterTableDAL> rv = new List<InterTableDAL>();
            try
            {
                EnsureConnected();
                using (SqlCommand command = new SqlCommand("GetInterTable", Con))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@skip", skip);
                    command.Parameters.AddWithValue("@take", take);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        InterTableMapper mapper = new InterTableMapper(reader);
                        while (reader.Read())
                        {
                            InterTableDAL c = mapper.ToInterTable(reader);
                            rv.Add(c);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Log(ex);
                throw;
            }
            return rv;
        }

        #endregion
        #region Morphs
        public int CreateMorph(string MorphName,string Description,bool Het)
        {
            int rv = 0;
            try
            {

                EnsureConnected();
                using (SqlCommand command = new SqlCommand("CreateMorph", Con))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@MorphID", 0);
                    command.Parameters["@MorphID"].Direction = System.Data.ParameterDirection.InputOutput;
                    command.Parameters.AddWithValue("@MorphName", MorphName);
                    command.Parameters.AddWithValue("@Description", Description);
                    command.Parameters.AddWithValue("@Het", Het);
                    command.ExecuteNonQuery();

                    rv = Convert.ToInt32(command.Parameters["@MorphID"].Value);
                }
            }
            catch (Exception ex)
            {
                Log(ex);
                throw;
            }
            return rv;
        }//

        public void DeleteMorph(int MorphID)
        {
            try
            {
                EnsureConnected();
                using (SqlCommand command = new SqlCommand("DeleteMorph", Con))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@MorphID", MorphID);

                    command.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                Log(ex);
                throw;
            }
        }//

        public void JustUpdateMorph(int MorphID,string NewMorphName,string NewDescription, bool NewHet)
        {
            try
            {
                EnsureConnected();
                using (SqlCommand command = new SqlCommand("JustUpdateMorph", Con))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@MorphID", MorphID);

                    command.Parameters.AddWithValue("@MorphName", NewMorphName);
                    command.Parameters.AddWithValue("@Description", NewDescription);
                    command.Parameters.AddWithValue("@Het", NewHet);

                    command.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                Log(ex);
                throw;
            }
        }//

        public int SafeUpdateMorph(int MorphID,string OldMorphName,string OldDescription,bool OldHet, string NewMorphName,string NewDescription,bool NewHet)
        {
            int rv = 0;
            try
            {
                EnsureConnected();
                using (SqlCommand command = new SqlCommand("SafeUpdateMorph", Con))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@MorphID", 0);

                    command.Parameters.AddWithValue("@NewMorphName", NewMorphName);
                    command.Parameters.AddWithValue("@NewDescription", NewDescription);
                    command.Parameters.AddWithValue("@NewHet", NewHet);
                    command.Parameters.AddWithValue("@OldMorphName", OldMorphName);
                    command.Parameters.AddWithValue("@OldDescription", OldDescription);
                    command.Parameters.AddWithValue("@OldHet", OldHet);

                    command.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                Log(ex);
                throw;
            }
            return rv;
        }

        public MorphDAL FindMorphByID(int MorphID)
        {
            MorphDAL rv = null;
            try
            {
                EnsureConnected();
                using (SqlCommand command = new SqlCommand("FindMorphByID", Con))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@MorphID", MorphID);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        MorphMapper mapper = new MorphMapper(reader);
                        if (reader.Read())
                        {
                            rv = mapper.ToMorph(reader);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Log(ex);
                throw;
            }
            return rv;
        }
        public List<MorphDAL> GetMorphs(int skip, int take)
        {
            List<MorphDAL> rv = new List<MorphDAL>();
            try
            {
                EnsureConnected();
                using (SqlCommand command = new SqlCommand("GetMorphs", Con))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@skip", skip);
                    command.Parameters.AddWithValue("@take", take);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        MorphMapper mapper = new MorphMapper(reader);
                        while (reader.Read())
                        {
                            MorphDAL c = mapper.ToMorph(reader);
                            rv.Add(c);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Log(ex);
                throw;
            }
            return rv;
        }
        public List<MorphDAL> GetMorphsRelatedToGecko(int skip, int take, int GeckoID)
        {
            List<MorphDAL> rv = new List<MorphDAL>();
            try
            {
                EnsureConnected();
                using (SqlCommand command = new SqlCommand("GetMorphsRelatedToGecko", Con))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@skip", skip);
                    command.Parameters.AddWithValue("@take", take);
                    command.Parameters.AddWithValue("@GeckoID", GeckoID);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        MorphMapper mapper = new MorphMapper(reader);
                        while (reader.Read())
                        {
                            MorphDAL c = mapper.ToMorph(reader);
                            rv.Add(c);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Log(ex);
                throw;
            }
            return rv;
        }
        #endregion
        #region Roles
        public int CreateRole(string Role)
        {
            int rv = 0;
            try
            {

                EnsureConnected();
                using (SqlCommand command = new SqlCommand("CreateRole", Con))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@RoleID", 0);
                    command.Parameters["@RoleID"].Direction = System.Data.ParameterDirection.InputOutput;
                    command.Parameters.AddWithValue("@Role", Role);

                    command.ExecuteNonQuery();

                    rv = Convert.ToInt32(command.Parameters["@RoleID"].Value);
                }
            }
            catch (Exception ex)
            {
                Log(ex);
                throw;
            }
            return rv;
        }

        public void DeleteRole(int RoleID)
        {
            try
            {
                EnsureConnected();
                using (SqlCommand command = new SqlCommand("DeleteRole", Con))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@RoleID", RoleID);

                    command.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                Log(ex);
                throw;
            }
        }

        public void JustUpdateRole(int RoleID, string NewRole)
        {
            try
            {
                EnsureConnected();
                using (SqlCommand command = new SqlCommand("JustUpdateRole", Con))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@RoleID", RoleID);
                    command.Parameters.AddWithValue("@Role", NewRole);

                    command.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                Log(ex);
                throw;
            }
        }

        public int SafeUpdateRole(int RoleID, string OldRole, string NewRole)
        {
            int rv = 0;
            try
            {
                EnsureConnected();
                using (SqlCommand command = new SqlCommand("SafeUpdateRole", Con))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@CRoleID", RoleID);
                    command.Parameters.AddWithValue("@NewRole", NewRole);
                    command.Parameters.AddWithValue("@OldRole", OldRole);

                    rv = command.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                Log(ex);
                throw;
            }
            return rv;
        }

        public RoleDAL FindRoleByID(int RoleID)
        {
            RoleDAL rv = null;
            try
            {
                EnsureConnected();
                using (SqlCommand command = new SqlCommand("FindRoleByID", Con))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@RoleID", RoleID);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        RoleMapper mapper = new RoleMapper(reader);
                        if (reader.Read())
                        {
                            rv = mapper.ToRole(reader);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Log(ex);
                throw;
            }
            return rv;
        }
        public List<RoleDAL> GetRoles(int skip, int take)
        {
            List<RoleDAL> rv = new List<RoleDAL>();
            try
            {
                EnsureConnected();
                using (SqlCommand command = new SqlCommand("GetRoles", Con))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@skip", skip);
                    command.Parameters.AddWithValue("@take", take);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        RoleMapper mapper = new RoleMapper(reader);
                        while (reader.Read())
                        {
                            RoleDAL c = mapper.ToRole(reader);
                            rv.Add(c);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Log(ex);
                throw;
            }
            return rv;
        }
        #endregion
        #region Users
        public int CreateUser(string UserName, string EmailAddress, int RoleID, string Password, string Hash,string Salt)
            //this creates the method create user that takes the parameters in the () 
        {
            int rv = 0;//establishes a default return value
            try//this block is protected if an exception occures 
            {

                EnsureConnected();
                using (SqlCommand command = new SqlCommand("CreateUser", Con))//because this is in a using it will be cleaned after block is left
                    //uses the logic from the sql stored procedure "CreateUser"
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@UserID", 0);
                    command.Parameters["@UserID"].Direction = System.Data.ParameterDirection.InputOutput;
                    command.Parameters.AddWithValue("@UserName", UserName);
                    command.Parameters.AddWithValue("@EmailAddress", EmailAddress);
                    command.Parameters.AddWithValue("@RoleID", RoleID);
                    command.Parameters.AddWithValue("@Password", Password);
                    command.Parameters.AddWithValue("@Hash", Hash);
                    command.Parameters.AddWithValue("@Salt", Salt);
                    command.ExecuteNonQuery();

                    rv = Convert.ToInt32(command.Parameters["@UserID"].Value);//this is the output where the identity is retrieved
                }
            }
            catch (Exception ex)//this happens when an exception occures and will not be touched if there are no problems
            {
                Log(ex);
                throw;
            }
            return rv;
        }

        public void DeleteUser(int UserID)
        {
            try
            {
                EnsureConnected();
                using (SqlCommand command = new SqlCommand("DeleteUser", Con))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@UserID", UserID);

                    command.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                Log(ex);
                throw;
            }
        }

        public void JustUpdateUser(int UserID, string UserName, string EmailAddress, int RoleID, string Password, string Hash,string Salt)
        {//just will always run without checking the existing record for conflicts
            try
            {
                EnsureConnected();
                using (SqlCommand command = new SqlCommand("JustUpdateUser", Con))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@UserID", UserID);

                    command.Parameters.AddWithValue("@UserName", UserName);
                    command.Parameters.AddWithValue("@EmailAddress", EmailAddress);
                    command.Parameters.AddWithValue("@RoleID", RoleID);
                    command.Parameters.AddWithValue("@Password", Password);
                    command.Parameters.AddWithValue("@Hash", Hash);
                    command.Parameters.AddWithValue("@Salt", Salt);

                    command.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                Log(ex);
                throw;
            }
        }

        public int SafeUpdateUser(int UserID, string OldUserName, string OldEmailAddress, int OldRoleID, string OldPassword, string OldHash,string OldSalt, string NewUserName, string NewEmailAddress, int NewRoleID, string NewPassword, string NewHash, string NewSalt)
        {//will check the existing record for conflicts if other usres are editing the record simultaniously
            int rv = 0;
            try
            {
                EnsureConnected();
                using (SqlCommand command = new SqlCommand("SafeUpdateUser", Con))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@UserID", 0);

                    command.Parameters.AddWithValue("@NewUserName", NewUserName);
                    command.Parameters.AddWithValue("@NewEmailAddress", NewEmailAddress);
                    command.Parameters.AddWithValue("@NewRoleID", NewRoleID);
                    command.Parameters.AddWithValue("@NewPassword", NewPassword);
                    command.Parameters.AddWithValue("@NewHash", NewHash);
                    command.Parameters.AddWithValue("@NewSalt", NewSalt);
                    command.Parameters.AddWithValue("@OldUserName", OldUserName);
                    command.Parameters.AddWithValue("@OldEmailAddress", OldEmailAddress);
                    command.Parameters.AddWithValue("@OldRoleID", OldRoleID);
                    command.Parameters.AddWithValue("@OldPassword", OldPassword);
                    command.Parameters.AddWithValue("@OldHash", OldHash);
                    command.Parameters.AddWithValue("@OLdSalt", OldSalt);

                    rv = command.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                Log(ex);
                throw;
            }
            return rv;
        }

        public UserDAL FindUserByID(int UserID)
        {//find returns one record
            UserDAL rv = null;
            try
            {
                EnsureConnected();
                using (SqlCommand command = new SqlCommand("FindUserByID", Con))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@UserID", UserID);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        UserMapper mapper = new UserMapper(reader);
                        if (reader.Read())
                        {
                            rv = mapper.ToUser(reader);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Log(ex);
                throw;
            }
            return rv;
        }
        public UserDAL FindUserByEmail(string EmailAddress)
        {
            UserDAL rv = null;
            try
            {
                EnsureConnected();
                using (SqlCommand command = new SqlCommand("FindUserByEmailAddress", Con))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@EmailAddress", EmailAddress);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        UserMapper mapper = new UserMapper(reader);
                        if (reader.Read())
                        {
                            rv = mapper.ToUser(reader);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Log(ex);
                throw;
            }
            return rv;
        }

        public List<UserDAL> GetUsers(int skip, int take)
        {//get will return multiple records
            List<UserDAL> rv = new List<UserDAL>();
            try
            {
                EnsureConnected();
                using (SqlCommand command = new SqlCommand("GetUsers", Con))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@skip", skip);
                    command.Parameters.AddWithValue("@take", take);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        UserMapper mapper = new UserMapper(reader);
                        while (reader.Read())
                        {
                            UserDAL c = mapper.ToUser(reader);
                            rv.Add(c);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Log(ex);
                throw;
            }
            return rv;
        }//skip and take helps support paging

        public List<UserDAL> GetUsersRelatedToRole(int skip, int take, int RoleID)
        {
            List<UserDAL> rv = new List<UserDAL>();
            try
            {
                EnsureConnected();
                using (SqlCommand command = new SqlCommand("GetUsersRelatedToRole", Con))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@skip", skip);
                    command.Parameters.AddWithValue("@take", take);
                    command.Parameters.AddWithValue("@RoleID", RoleID);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        UserMapper mapper = new UserMapper(reader);
                        while (reader.Read())
                        {
                            UserDAL c = mapper.ToUser(reader);
                            rv.Add(c);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Log(ex);
                throw;
            }
            return rv;
        }
        #endregion
    }
}