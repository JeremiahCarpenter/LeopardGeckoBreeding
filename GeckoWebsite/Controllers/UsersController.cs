using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BusinessLogicLayer;
using GeckoWebsite.Filters;
using GeckoWebsite.Models;

namespace GeckoWebsite.Controllers
{
    
   [MustBeLoggedIn] public class UsersController : Controller
    {
        // GET: User
        public ActionResult Index()//no params
        {
            try
            {
                using (ContextBLL ctx = new ContextBLL())
                {
                    return View(ctx.GetUsers(0, 100));//get the users from the contextbll
                }
            }
            catch (Exception ex)
            {
                return View("Error", ex);
            }
        }

        // GET: User/Details/5
        public ActionResult Details(int id)//id as a param
        {
            try
            {
                using (ContextBLL ctx = new ContextBLL())
                {
                    UserBLL u = ctx.FindUserByID(id);
                    if (u == null)
                    {
                        return View("ItemNotFound");
                    }
                    else
                    {
                        return View(u);
                    }

                }
            }
            catch (Exception ex)
            {
                return View("Error", ex);
            }
        }

        // GET: User/Create
        public ActionResult Create()//creates the blank form for the user to fill out
        {
            return View();
        }

        // POST: User/Create
        [HttpPost]
        public ActionResult Create(UserBLL u)//recieves the data that the user put into the form
        {
            try
            {
                using (ContextBLL ctx = new ContextBLL())
                {
                    ctx.CreateUser(u.UserName, u.EmailAddress, u.RoleID, u.Password, "12345","12345");

                    return RedirectToAction("Index");
                }
            }
            catch (Exception ex)
            {
                return View("Error", ex);
            }
        }

        // GET: User/Edit/5
        public ActionResult Edit(int id)//displays the original data to the user 
        {
            try
            {
                using (ContextBLL ctx = new ContextBLL())
                {
                    UserBLL u = ctx.FindUserByID(id);
                    {
                        if (u == null)
                        {
                            return View("UserNotFound");
                        }
                        else
                        {
                            return View(u);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                return View("Error", ex);
            }
        }

        // POST: User/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, UserBLL collection)//saves the new data that the user changed 
        {
            try
            {
                using (ContextBLL ctx = new ContextBLL())
                {

                    ctx.JustUpdateUser(id, collection.UserName?? " ", collection.EmailAddress?? " ", collection.RoleID, collection.Password?? " ", collection.Hash??" ", collection.Salt?? " ");

                    return RedirectToAction("Index");
                }
            }
            catch (Exception ex)
            {
                return View("Eror", ex);
            }
        }

        // GET: User/Delete/5
        public ActionResult Delete(int id)//displays th erecord to be deleted 
        {
            using (ContextBLL ctx = new ContextBLL())
            {
                UserBLL u = ctx.FindUserByID(id);
                {
                    if (u == null)
                    {
                        return View("ItemNotFound");
                    }
                    else
                    {
                        return View(u);
                    }
                }
            }
        }

        // POST: User/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, UserBLL collection)//deletes the record
        {
            try
            {
                using (ContextBLL ctx = new ContextBLL())
                {
                    ctx.DeleteUser(id);
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

