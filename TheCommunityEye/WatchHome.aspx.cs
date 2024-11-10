using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace TheCommunityEye
{
    public partial class WatchHome : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["CommunityEye"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (ValidateForm())
            {
                SaveWatchDetails();
                Response.Redirect("PricePlan.aspx");
            }
        }

        // Validate that required fields are not empty
        private bool ValidateForm()
        {
            if (string.IsNullOrWhiteSpace(txtGroupName.Text) ||
                string.IsNullOrWhiteSpace(txtCoordinatorName.Text) ||
                ddlArea.SelectedValue == "None" ||
                string.IsNullOrWhiteSpace(txtDescription.Text))
            {
                // Handle validation failure (display error message or alert)
                Response.Write("<script>alert('Please fill in all required fields.');</script>");
                return false;
            }
            return true;
        }

        // Add the new watch group to the Watch database table
        private void SaveWatchDetails()
        {
            if (txtConfirm.Text == txtPassword.Text)
            {
                Session["GroupName"] = txtGroupName.Text;
                Session["AdminName"] = txtCoordinatorName.Text;
                Session["Area"] = ddlArea.SelectedValue;
                Session["Description"] = txtDescription.Text;
                Session["Email"] = txtEmail.Text;
                Session["CellNumber"] = txtPhone.Text;
                Session["Password"] = txtPassword.Text;
            }
            else
            {
                lblPassError.Text = "Passwords do not match";
            }
        }

        // Clear form inputs after successful registration
        private void ClearForm()
        {
            txtGroupName.Text = "";
            txtCoordinatorName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            ddlArea.SelectedValue = "None";
            txtDescription.Text = "";
        }
    }
}