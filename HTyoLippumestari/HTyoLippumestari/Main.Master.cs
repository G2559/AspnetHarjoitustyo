using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HTyoLippumestari
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["UserName"] != null)
            {
                sessionsquest.Visible = false;
                sessionslogin.Visible = true;
                lblUsername.Text = Request.Cookies["UserName"].Value;
            }
            else
            {
                sessionsquest.Visible = true;
                sessionslogin.Visible = false;
            }
        }
    }
}