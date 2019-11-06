using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BusinessLogicLayer;

namespace GeckoWebsite.Controllers
{
    public class InterTableController : Controller
    {
        // GET: InterTable
        public ActionResult Index()
        {
            try
            {
                using (ContextBLL ctx = new ContextBLL())
                {
                    var m = ctx.GetInterTables(0, 100);
                    return View(m);
                }
            }
            catch (Exception ex)
            {
                return View("Error", ex);
            }
        }

        // GET: InterTable/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: InterTable/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: InterTable/Create
        [HttpPost]
        public ActionResult Create(InterTableBLL i)
        {
            using (ContextBLL ctx = new ContextBLL())
                try
                {
                    ctx.CreateInterTable(i.GeckoID, i.MorphID);

                    return RedirectToAction("Index");
                }
                catch(Exception ex)
                {
                    return View("Error",ex);
                }
        }

        // GET: InterTable/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: InterTable/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: InterTable/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: InterTable/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
