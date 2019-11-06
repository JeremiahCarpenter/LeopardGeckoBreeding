using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GeckoWebsite.Models;
using BusinessLogicLayer;

namespace GeckoWebsite.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        [HttpGet]
        public ActionResult Login()
        {
            LoginModel m = new LoginModel();
            m.Message = TempData["Message"]?.ToString() ?? "";
            m.ReturnURL = TempData["ReturnURL"]?.ToString() ?? @"~/Geckos";
            m.EmailAddress = "genericemail";
            m.Password = "genericpassword";

            return View(m);
        }
        [HttpPost]
        public ActionResult Login(LoginModel info) 
        {
            try
            {


                using (BusinessLogicLayer.ContextBLL ctx = new BusinessLogicLayer.ContextBLL())
                {
                    BusinessLogicLayer.UserBLL user = ctx.FindUserByEmail(info.EmailAddress);
                    if (user == null)
                    {
                        info.Message = $"The EmailAddress '{info.EmailAddress}' does not exist in the database";
                        return View(info);
                    }
                    string actual = user.Password;
                    //string potential = user.Salt + info.Password;
                    //bool validateduser = Sybool Valstem.Web.Helpers.Crypto.VerifyHashedPassword(actual, potential);
                    bool validateduser = user.Password == info.Password;
                    if (validateduser)
                    {
                        Session["AUTHEmailAddress"] = user.EmailAddress;
                        Session["AUTHRole"] = user.Role;
                        return Redirect(info.ReturnURL);

                    }
                    info.Message = "The password was incorrect";
                    return View(info);
                }
            }
            catch(Exception ex)
            {
                return View("Error", ex);
            }
        }
        [HttpGet]
        public ActionResult Register()
        {
            RegistrationModel r = new RegistrationModel();
            r.EmailAddress = TempData["EmailAddress"]?.ToString() ?? "";
            r.UserName = TempData["UserName"]?.ToString() ?? "";
            r.Password = TempData["Password"]?.ToString() ?? "";
            r.ReturnURL = TempData["ReturnURL"]?.ToString() ?? @"~/Login";
            return View(r);
        }
        [HttpGet]
        public ActionResult RegisterAsBreeder()
        {

            return View();
        }
        [HttpPost]
        public ActionResult RegisterAsBreeder(RegistrationModel newuser)
        {
            try
            {
                using (ContextBLL ctx = new ContextBLL())
                {
                    UserBLL u = ctx.FindUserByEmail(newuser.EmailAddress);
                    if (u != null)
                    {
                        return View("An account using this Emailaddress already exists");
                    }
                    else
                    {
                        ctx.CreateUser(newuser.UserName, newuser.EmailAddress, 2, newuser.Password, "1234", "1234");
                        return Redirect("/Home/Login");
                    }
                }
            }
            catch (Exception ex)
            {
                return View("Error", ex);
            }
        }
        [HttpGet]
        public ActionResult RegisterAsGuest()
        { return View(); } 
        [HttpPost]
        public ActionResult RegisterAsGuest(RegistrationModel newuser)
        {
            try
            {
                using (ContextBLL ctx = new ContextBLL())
                {
                    UserBLL u = ctx.FindUserByEmail(newuser.EmailAddress);
                    if (u != null)
                    {
                        return View("Error",new Exception("an account using this email already exists"));
                    }
                    else
                    {
                        ctx.CreateUser(newuser.UserName, newuser.EmailAddress, 3, newuser.Password, "1234", "1234");
                        return Redirect("/Home/Login");
                    }
                }
            }
            catch (Exception ex)
            {
                return View("Error", ex);
            }
        }
        [HttpGet]
        public ActionResult RegisterAsGuestWithGecko()
        {
            return View();
        }
        [HttpPost]
        public ActionResult RegisterAsGuestWithGecko(TwoLevelsModel newuser)
        {
            try
            {
                using (ContextBLL ctx = new ContextBLL())
                {
                    UserBLL u = ctx.FindUserByEmail(newuser.EmailAddress);
                    if (u != null)
                    {
                        return View("An account using this Emailaddress already exists");
                    }
                    else
                    {
                       int uid =  ctx.CreateUser(newuser.UserName, newuser.EmailAddress, 3, newuser.Password, "1234", "1234");

                        ctx.CreateGecko(newuser.Sex, newuser.Weight, newuser.BreedEligability, newuser.Age, newuser.OwnerID);

                        return Redirect("/Home/Login");
                        
                    }
                }
            }
            catch (Exception ex)
            {
                return View("Error", ex);
            }
        }
        [HttpGet]
        public ActionResult RegisterAsBreederWithGecko()
        {
            return View();
        }
        [HttpPost]
        public ActionResult RegisterAsBreederWithGecko(TwoLevelsModel newuser)
        {
            try
            {
                using (ContextBLL ctx = new ContextBLL())
                {
                    UserBLL u = ctx.FindUserByEmail(newuser.EmailAddress);
                    if (u != null)
                    {
                        return View("Error",new Exception ("a user with this email already exists"));
                    }
                    else
                    {
                        int uid = ctx.CreateUser(newuser.UserName, newuser.EmailAddress, 2, newuser.Password, "1234", "1234");

                        ctx.CreateGecko(newuser.Sex, newuser.Weight, newuser.BreedEligability, newuser.Age, uid);

                        return Redirect("/Home/Login");

                    }
                }
            }
            catch (Exception ex)
            {
                return View("Error", ex);
            }
        }
        public ActionResult Logout()
        {
            Session.Remove("AUTHEmailAddress");
            Session.Remove("AUTHRole");
            return Redirect("/Home");
        }
    }
}