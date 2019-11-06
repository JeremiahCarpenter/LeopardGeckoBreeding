using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BusinessLogicLayer;
using GeckoWebsite.Filters;

namespace GeckoWebsite.Controllers
{
    /*[MustBeLoggedIn] */public class GeckosController : Controller
    {
        // GET: Gecko
        public ActionResult Index()
        {
            try
            {
                using (BusinessLogicLayer.ContextBLL ctx = new BusinessLogicLayer.ContextBLL())
                {
                    string id = HttpContext.User.Identity.Name;
                    UserBLL u = ctx.FindUserByEmail(id);
                    var m = ctx.GetGcekosRelatedToUser(0, 100,u.UserID);
                    return View(m);   
                }
            }
            catch (Exception ex)
            {
                return View("Error", ex);
            }

        }

        // GET: Gecko/Details/5
        public ActionResult Details(int id)
        {
            try
            {
                using (ContextBLL ctx = new ContextBLL())
                {
                    GeckoBLL g = ctx.FindGeckoByID(id);
                    if (g == null)
                    {
                        return View("ItemNotFound");
                    }
                    else
                    {
                        return View(g);
                    }
                }
            }
            catch (Exception ex)
            {
                return View("Error", ex);
            }
        }

        // GET: Gecko/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Gecko/Create
        [HttpPost]
        public ActionResult Create(GeckoBLL g)
        {
            try
            {
                using (ContextBLL ctx = new ContextBLL())
                {
                    string id = HttpContext.User.Identity.Name;
                    UserBLL G = ctx.FindUserByEmail(id);
                    ctx.CreateGecko(g.Sex, g.Weight, g.BreedEligability, g.Age, G.UserID);

                    return RedirectToAction("Index");
                }
            }
            catch(Exception ex)
            {
                return View("Error",ex);
            }
        }

        // GET: Gecko/Edit/5
        public ActionResult Edit(int id)
        {
            try
            {
                using (BusinessLogicLayer.ContextBLL ctx = new BusinessLogicLayer.ContextBLL())
                {
                    GeckoBLL g = ctx.FindGeckoByID(id);
                    {
                        if (g == null)
                        {
                            return View("ItemNotFound");
                        }
                        else
                        {
                            return View(g);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                return View("Error", ex);
            }
        }

        // POST: Gecko/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, GeckoBLL collection)
        {
            try
            {
                using (ContextBLL ctx = new ContextBLL())
                {
                    ctx.JustUpdateGecko(id, collection.Sex, collection.Weight, collection.BreedEligability, collection.Age, collection.OwnerID);

                    return RedirectToAction("Index");
                }
            }
            catch(Exception ex)
            {
                return View("Error",ex);
            }
        }

        // GET: Gecko/Delete/5
        public ActionResult Delete(int id)
        {
            try
            {
                using (BusinessLogicLayer.ContextBLL ctx = new BusinessLogicLayer.ContextBLL())
                {
                    GeckoBLL g = ctx.FindGeckoByID(id);
                    {
                        if (g == null)
                        {
                            return View("ItemNotFound");
                        }
                        else
                        {
                            return View(g);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                return View("Error", ex);
            }
        }

        // POST: Gecko/Delete/5
        [HttpPost]
        public ActionResult Delete(int id,GeckoBLL collection)
        {
            try
            {
                using (ContextBLL ctx = new ContextBLL())
                {
                    ctx.DeleteGecko(id);

                    return RedirectToAction("Index");
                }
            }
            catch(Exception ex)
            {
                return View("Error",ex);
            }
        }
    }
}
