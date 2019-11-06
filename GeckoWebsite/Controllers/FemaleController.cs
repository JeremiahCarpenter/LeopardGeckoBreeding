using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BusinessLogicLayer;

namespace GeckoWebsite.Controllers
{
    public class FemaleController : Controller//This is the breeder controller
    {
        // GET: Female
        public ActionResult FemaleIndex()  
        {
            try
            {
                using (ContextBLL ctx = new ContextBLL())
                {
                    var u = ctx.FindUserByEmail(HttpContext.User.Identity.Name);
                    if (u == null)
                    {
                        return View("UserNotFound");
                    }
                    var g = ctx.GetGcekosRelatedToUser(0, 100,u.UserID);
                    var female = from f in g where f.Sex == "f" select f;
                    
                    return View(female); 
                }
            }
            catch(Exception ex)
            {
                return View("Error", ex);
            }
        }
        public ActionResult MaleIndex(int id) 
        {
            try
            {
                using (ContextBLL ctx = new ContextBLL())
                {
                    //var fg = ctx.FindGeckoByID(id);
                    var u = ctx.FindUserByEmail(HttpContext.User.Identity.Name);
                    if (u == null)
                    {
                        return View("UserNotFound");
                    }
                    var g = ctx.GetGcekosRelatedToUser(0, 100, u.UserID);
                    var male = from f in g where f.Sex == "m" select f;
                    ViewData["fgecko"] = id;
                    return View(male);
                }
            }
            catch (Exception ex)
            {
                return View("Error", ex);
            }
        }
        public ActionResult BreedIndex(int mid,int fid)
        {
            try
            {
                using (ContextBLL ctx = new ContextBLL())
                {
                    var m = ctx.GetMorphsRelatedToGecko(0,100,mid);
                    var f = ctx.GetMorphsRelatedToGecko(0,100,fid);
                    var x = ctx.BreedGekcos(m, f);
                    return View(x);
                }
            }
            catch (Exception ex)
            {
                return View("Error", ex);
            }
        }
    }
}