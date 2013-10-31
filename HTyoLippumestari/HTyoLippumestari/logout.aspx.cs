using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HTyoLippumestari
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["UserName"] != null)
            {
                HttpCookie myCookie = new HttpCookie("UserName");
                myCookie.Expires = DateTime.Now.AddDays(-1d);
                Response.Cookies.Add(myCookie);
                Response.Redirect("~/default.aspx");
            }
            else Response.Redirect("~/default.aspx");
        }
    }
}