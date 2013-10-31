using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace HTyoLippumestari
{
    public partial class _default : System.Web.UI.Page
    {

        private string username;

        protected void Page_Load(object sender, EventArgs e)
        {
            admincontent.Visible = false;

            if (Request.Cookies["UserName"] != null)
            {
                username = Request.Cookies["UserName"].Value;
            }

            if (username == "admin")
            {
                admincontent.Visible = true;
            }

            MysliCustomConnector connector = new MysliCustomConnector();
            connector.OpenConnection();
            repEvent.DataSource = connector.GetAllEvents();
            connector.CloseConnection();
            repEvent.DataMember = "Events";
            repEvent.DataBind();
        }
    }
}