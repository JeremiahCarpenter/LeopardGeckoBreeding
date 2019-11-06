using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BusinessLogicLayer;

namespace GeckoWebsite.Controllers
{
    public class RolesController : Controller
    {
        // GET: Role
        public ActionResult Index()
        {
            try
            {
                using (ContextBLL ctx = new ContextBLL())
                {
                    return View(ctx.GetRoles(0, 100));
                }
            }
            catch (Exception ex)
            {
                return View("Error", ex);
            }
        }//done

        // GET: Role/Details/5
        public ActionResult Details(int id)
        {
            try
            {
                using (ContextBLL ctx = new ContextBLL())
                {
                    RoleBLL r = ctx.FindRoleByID(id);
                    if (r == null)
                    {
                        return View("ItemNotFound");
                    }
                    else
                    {
                        return View(r);
                    }

                }
            }
            catch (Exception ex)
            {
                return View("Error", ex);
            }
        }//done

        // GET: Role/Create
        public ActionResult Create()
        {
            return View();
        }//done

        // POST: Role/Create
        [HttpPost]
        public ActionResult Create(RoleBLL collection)
        {
            try
            {
                using (ContextBLL ctx = new ContextBLL())
                {
                    ctx.CreateRole(collection.Role);
                }
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                return View("Error", ex);
            }
        }//done

        // GET: Role/Edit/5
        public ActionResult Edit(int id)
        {
            try
            {
                using (ContextBLL ctx = new ContextBLL())
                {
                    RoleBLL r = ctx.FindRoleByID(id);
                    if (r == null)
                    {
                        return View("ItemsNotFound");
                    }
                    else
                    {
                        return View(r);
                    }
                }
            }
            catch (Exception ex)
            {
                return View("Error", ex);
            }
        }//done

        // POST: Role/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, RoleBLL collection)
        {
            try
            {
                using (ContextBLL ctx = new ContextBLL())
                {
                    ctx.JustUpdateRole(id, collection.Role);

                    return RedirectToAction("Index");
                }
            }
            catch (Exception ex)
            {
                return View("Error", ex);
            }
        }//done

        // GET: Role/Delete/5
        public ActionResult Delete(int id)
        {
            using (ContextBLL ctx = new ContextBLL())
            {
                RoleBLL r = ctx.FindRoleByID(id);
                if (r == null)
                {
                    return View("ItemsNotFound");
                }
                else
                {
                    return View(r);
                }
            }
        }//done

        // POST: Role/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, RoleBLL collection)
        {
            try
            {
                using (ContextBLL ctx = new ContextBLL())
                {
                    ctx.DeleteRole(id);

                    return RedirectToAction("Index");
                }
            }
            catch (Exception ex)
            {
                return View("Error", ex);
            }
        }//done
    }
}
