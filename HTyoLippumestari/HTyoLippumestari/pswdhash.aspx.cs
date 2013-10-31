using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HTyoLippumestari
{
    public partial class pswdhash : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConvert_Click(object sender, EventArgs e)
        {
            txtHash.Text = SimpleHash.ComputeHash(txtPwd.Text, "SHA512", ConfigurationManager.AppSettings["salt"]);
        }
    }
}