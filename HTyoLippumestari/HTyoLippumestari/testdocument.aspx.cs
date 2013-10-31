using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HTyoLippumestari
{
    public partial class testdocument : System.Web.UI.Page
    {
        MysliCustomConnector connector = new MysliCustomConnector();
        protected void Page_Load(object sender, EventArgs e)
        {
            connector.OpenConnection();
            GVUser.DataSource = connector.GetUserDetails(Request.Cookies["UserName"].Value);
            connector.CloseConnection();
            GVUser.DataMember = "users";
            GVUser.DataBind();
        }
    }
}