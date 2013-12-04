using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace HTyoLippumestari
{
    public partial class register : System.Web.UI.Page
    {
        private string hashedpasswd;

        protected void Page_Load(object sender, EventArgs e)
        {
            lblRegister.Text = " * merkityt pakollisia";
        }

        protected void CheckBoxRequired_ServerValidate(object sender, ServerValidateEventArgs e)
        {
            e.IsValid = cbTos.Checked;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (txtPsswd.Text == txtPasswd2.Text && cbTos.Checked)
            {
                hashedpasswd = SimpleHash.ComputeHash(txtPsswd.Text, "SHA512", ConfigurationManager.AppSettings["salt"]);

                MysliCustomConnector mysliconnector = new MysliCustomConnector();
                mysliconnector.OpenConnection();
                if (mysliconnector.VerifyUserNotDuplicate(txtUser1.Text))
                {
                    if (mysliconnector.CreateUser(txtUser1.Text, hashedpasswd, txtFirstname.Text, txtLastname.Text, txtAddress.Text, txtPostal.Text, txtCity.Text, txtNro.Text, txtEmail.Text))
                    {
                        lblRegister.Text = "Rekisteröinti onnistui!";
                        mysliconnector.CloseConnection();
                    }
                    else lblRegister.Text = "Rekisteröinti epäonnistui";
                }
                else lblRegister.Text = "Käyttäjätunnus löytyy jo";


            }
            else
            {
                lblRegister.Text = "Tarkasta, että kaikki tiedot ovat oikein";
            }

        }

        protected static byte[] GetBytes(string str)
        {
            byte[] bytes = new byte[str.Length * sizeof(char)];
            System.Buffer.BlockCopy(str.ToCharArray(), 0, bytes, 0, bytes.Length);
            return bytes;
        }
    }
}