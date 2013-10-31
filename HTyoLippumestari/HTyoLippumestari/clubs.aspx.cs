using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HTyoLippumestari
{
    public partial class clubs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MysliCustomConnector connector = new MysliCustomConnector();
            connector.OpenConnection();
            repEvent.DataSource = connector.GetdDatasetOfEventsByCategory("klubit");
            connector.CloseConnection();
            repEvent.DataMember = "Events";
            repEvent.DataBind();
        }
    }
}