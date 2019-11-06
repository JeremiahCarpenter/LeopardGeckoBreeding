using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BusinessLogicLayer;

namespace GeckoWebsite.Controllers
{
    public class MorphsController : Controller
    {
        // GET: Morph
        public ActionResult Index()
        {
            try
            {
                using (BusinessLogicLayer.ContextBLL ctx = new BusinessLogicLayer.ContextBLL())
                {
                    var m = ctx.GetMorphs(0, 100);
                    return View(m);
                }
            }
            catch (Exception ex)
            {
                return View("Error", ex);
            }
        }

        // GET: Morph/Details/5
        public ActionResult Details(int id)
        {
            try
            {
                using (ContextBLL ctx = new ContextBLL())
                {
                    MorphBLL m = ctx.FindMorphByID(id);
                    {
                        if (m == null)
                        {
                            return View("ItemNotFound");
                        }
                        else
                        {
                            return View(m);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                return View("Error", ex);
            }

        }

        // GET: Morph/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Morph/Create
        [HttpPost]
        public ActionResult Create(MorphBLL collection)
        {
            try
            {
                using (ContextBLL ctx = new ContextBLL())
                {
                    
                    ctx.CreateMorph(collection.MorphName,collection.Description,collection.Het);
                }
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                return View("Error",ex );
            }
        }

        // GET: Morph/Edit/5
        public ActionResult Edit(int id)
        {
            try
            {
                using (ContextBLL ctx = new ContextBLL())
                {
                    MorphBLL m = ctx.FindMorphByID(id);
                    if (m == null)
                    {
                        return View("ItemNotFound");
                    }
                    else
                    {
                        return View(m);
                    }

                }
            }
            catch (Exception ex)
            {
                return View("Error", ex);
            }
        }

        // POST: Morph/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, MorphBLL collection)
        {
            try
            {
                using (ContextBLL ctx = new ContextBLL())
                {
                    ctx.JustUpdateMorph(id, collection.MorphName, collection.Description, collection.Het);

                    return RedirectToAction("Index");
                }
            }
            catch(Exception ex)
            {
                return View("Error",ex);
            }
        }

        // GET: Morph/Delete/5
        public ActionResult Delete(int id)
        {
            using (ContextBLL ctx = new ContextBLL())
            {
                MorphBLL m = ctx.FindMorphByID(id);
                if (m == null)
                {
                    return View("ItemNotFound");
                }
                else
                {
                    return View(m);
                }

            }
        }

        // POST: Morph/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, MorphBLL collection)
        {
            try
            {
                using (ContextBLL ctx = new ContextBLL())
                {
                    ctx.DeleteMorph(id);
                }
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                return View("Error", ex);
            }
        }
    }
}
