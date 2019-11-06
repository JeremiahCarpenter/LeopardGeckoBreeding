using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Security.Principal;

namespace GeckoWebsite
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
        protected void Application_AcquireRequestState(object sender, EventArgs e)//method called APP_Acquirerequeststate that takes parameters object and event args
        {
            string EmailAddress = Session["AUTHEmailAddress"] as string;
            string SessRoles = Session["AUTHRole"] as string;
            if (string.IsNullOrEmpty(EmailAddress))
            {
                return;
            }
            GenericIdentity i = new GenericIdentity(EmailAddress, "MyCustomType");
            if (SessRoles == null) { SessRoles = ""; }
            string[] roles = SessRoles.Split(',');
            GenericPrincipal p = new GenericPrincipal(i, roles);
            HttpContext.Current.User = p;
        }
    }
}
