using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace Logger
{ 
    static public class Logger
    {
        static string connectionstring;
        static Logger()
        {
            try
            {
                connectionstring = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnectionString"].ConnectionString;
            }
            catch (Exception ex)
            {
                throw new Exception("An Error happened getting the connectionstring for logger");
            }
        }
        public static void Log(Exception ex)
        {
            try//if nothing goes wrong 
            {
                using (SqlConnection con = new SqlConnection(connectionstring))//this is the connection to the database 
                {
                    con.Open();
                    using (var com = con.CreateCommand())//creates the comand to be executed 
                    {
                        com.CommandText = "InsertLogItem";
                        com.CommandType = System.Data.CommandType.StoredProcedure;
                        com.Parameters.AddWithValue("@message", ex.Message);
                        com.Parameters.AddWithValue("@stacktrace", ex.StackTrace.ToString());
                        com.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception exc)//if anything within the try bubble fails then you will end up here meaning the exception was not succesfully logged
            {
                var p = HttpContext.Current.Server.MapPath("~");//returns root path to the website 
                p += @"ErrorLog.Log";//adds the filename 
                System.IO.File.AppendAllText(p,
                "while attempting to record the original exception to the database, this exception occurred\r\n");
                System.IO.File.AppendAllText(p, exc.ToString());
                System.IO.File.AppendAllText(p,
                "This is the Original Exception that was attempting to be written to the database\r\n");
                System.IO.File.AppendAllText(p, ex.ToString());
            }
        }
    }
}
