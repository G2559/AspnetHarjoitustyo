﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HTyoLippumestari
{
    public partial class theater : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MysliCustomConnector connector = new MysliCustomConnector();
            connector.OpenConnection();
            repEvent.DataSource = connector.GetdDatasetOfEventsByCategory("teatteri");
            connector.CloseConnection();
            repEvent.DataMember = "Events";
            repEvent.DataBind();
        }
    }
}