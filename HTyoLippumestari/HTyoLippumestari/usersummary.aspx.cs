using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HTyoLippumestari
{
    public partial class usersummary : System.Web.UI.Page
    {
        MysliCustomConnector connector = new MysliCustomConnector();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.Cookies["UserName"] != null)
            {
                tblEdit.Visible = false;
                btnReady.Visible = false;
                btnCancel.Visible = false;
                txtUserid.Visible = false;

                connector.OpenConnection();
                FVUser.DataSource = connector.GetUserDetails(Request.Cookies["UserName"].Value);
                connector.CloseConnection();
                FVUser.DataBind();
            }
            else Response.Redirect("~/login.aspx");
        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            txtUserid.Text = ((TextBox)FVUser.FindControl("txtUserID")).Text;
            txtUsername.Text = ((TextBox)FVUser.FindControl("txtUsername")).Text;
            txtPassword1.Text = ((TextBox)FVUser.FindControl("txtPassword")).Text;
            txtFirstname.Text = ((TextBox)FVUser.FindControl("txtFirstname")).Text;
            txtLastname.Text = ((TextBox)FVUser.FindControl("txtLastname")).Text;
            txtAddress.Text = ((TextBox)FVUser.FindControl("txtAddress")).Text;
            txtPostal.Text = ((TextBox)FVUser.FindControl("txtPostal")).Text;
            txtCity.Text = ((TextBox)FVUser.FindControl("txtCity")).Text;
            txtPuhnro.Text = ((TextBox)FVUser.FindControl("txtPuhnro")).Text;
            txtEmail.Text = ((TextBox)FVUser.FindControl("txtEmail")).Text;

            FVUser.Visible = false;
            tblEdit.Visible = true;
            btnReady.Visible = true;
            btnCancel.Visible = true;
            btnUpdate.Visible = false;



            
        }

        protected void btnReady_Click(object sender, EventArgs e)
        {
            connector.OpenConnection();
            connector.UpdateUserDetails(txtUsername.Text, txtPassword1.Text, txtFirstname.Text,txtLastname.Text,txtAddress.Text,txtPostal.Text,txtCity.Text,txtPuhnro.Text, txtEmail.Text,txtUserid.Text);
            connector.CloseConnection();
            Response.Redirect("usersummary.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            FVUser.Visible = true;
            tblEdit.Visible = false;
            btnReady.Visible = false;
            btnCancel.Visible = false;
            btnUpdate.Visible = true;
        }
    }
}