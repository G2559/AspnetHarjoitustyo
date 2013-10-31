using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HTyoLippumestari
{
    public partial class register : System.Web.UI.Page
    {
        private string hashedpasswd;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (txtPsswd.Text == txtPasswd2.Text)
            {
                hashedpasswd = SimpleHash.ComputeHash(txtPsswd.Text, "SHA512", ConfigurationManager.AppSettings["salt"]);

                MysliCustomConnector mysliconnector = new MysliCustomConnector();
                mysliconnector.OpenConnection();
                if (mysliconnector.VerifyUserNotDuplicate(txtUser1.Text))
                {
                    if(mysliconnector.CreateUser(txtUser1.Text, hashedpasswd, txtFirstname.Text, txtLastname.Text, txtAddress.Text, txtPostal.Text, txtCity.Text, txtNro.Text, txtEmail.Text)){
                    txtDebug.Text = "Onnistui!";
                    mysliconnector.CloseConnection();
                    }
                    else txtDebug.Text = "FAILED TO CREATE";
                }
                else txtDebug.Text = "USER EXIST";

                
            }
            else txtDebug.Text = "PASSWORD DOESENT MATCH VERIFIED PASSWORD";
        }

        protected static byte[] GetBytes(string str)
        {
            byte[] bytes = new byte[str.Length * sizeof(char)];
            System.Buffer.BlockCopy(str.ToCharArray(), 0, bytes, 0, bytes.Length);
            return bytes;
        }
    }
}