using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HTyoLippumestari
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            MysliCustomConnector connector = new MysliCustomConnector();
            connector.OpenConnection();
            txtB1.Text = "Yhteys avattu";
            if (connector.VerifyLogin(txtUser.Text, txtPasswd.Text))
            {
                txtB2.Text = "ONNISTUI";
                connector.CloseConnection();

                Response.Cookies["UserName"].Value = txtUser.Text;
                // Response.Cookies["userName"].Expires = DateTime.Now.AddDays(1); ÄLÄ ASETA, koska nyt se poistetaan käyttjän sulkiessa selain
                //Server.Transfer("default.aspx");
                Response.Redirect("~/default.aspx");
            }
            else
            {
                txtB2.Text = "FAILED";
                //Server.Transfer("loginfailed.aspx");
                connector.CloseConnection();
            }

        }
    }
}