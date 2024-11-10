using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;


namespace TheCommunityEye
{
    public partial class WatchProfile : System.Web.UI.Page
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["CommunityEye"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Write("<script>alert('Member must be an admin to access this page')</script>");
                Response.Redirect("~/WatchDefault.aspx");
            }

            if (!IsPostBack)
            {
                LoadUserData();
            }
        }

        private void LoadUserData()
        {
            int watchID = Convert.ToInt32(Session["WatchID"]);
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT MemberID, MemberName, Role_, Password_, Email FROM Members WHERE WatchID=@WatchID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@WatchID", watchID);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                GridViewUsers.DataSource = reader;
                GridViewUsers.DataBind();
            }
        }

        private void ClearFields()
        {
            txtEmail.Text = string.Empty;
            txtMemberName.Text = string.Empty;
            txtPassword.Text = string.Empty;
            ddlUserType.SelectedIndex = 0;
            btnAddUser.Visible = true;
            btnUpdateUser.Visible = false;
        }

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string memberName = txtMemberName.Text;
            string password = txtPassword.Text;
            string userType = ddlUserType.SelectedValue;

            if (userType == "None")
            {
                lblMessage.Text = "Please select a valid user type.";
                lblMessage.Visible = true;
                lblMessage.CssClass = "alert alert-warning";
                return;
            }

            int watchID = Convert.ToInt32(Session["WatchID"]);

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Members (WatchID, Email, MemberName, Password_, Role_) " +
                                   "VALUES (@WatchID, @Email, @MemberName, @Password_, @Role_)";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@WatchID", watchID);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@MemberName", memberName);
                    cmd.Parameters.AddWithValue("@Password_", password);
                    cmd.Parameters.AddWithValue("@Role_", userType);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    ClearFields();
                }
                LoadUserData();
                lblMessage.Text = "User added successfully.";
                lblMessage.Visible = true;
                lblMessage.CssClass = "alert alert-success";
            }
            catch (Exception ex)
            {
                lblMessage.Text = "An error occurred: " + ex.Message;
                lblMessage.Visible = true;
                lblMessage.CssClass = "alert alert-danger";
            }
        }

        protected void btnUpdateUser_Click(object sender, EventArgs e)
        {
            if (ViewState["SelectedMemberID"] == null)
            {
                lblMessage.Text = "Please select a user to update.";
                lblMessage.Visible = true;
                lblMessage.CssClass = "alert alert-warning";
                return;
            }

            string userType = ddlUserType.SelectedValue;
            if (userType == "None")
            {
                lblMessage.Text = "Please select a valid user type.";
                lblMessage.Visible = true;
                lblMessage.CssClass = "alert alert-warning";
                return;
            }

            int memberId = Convert.ToInt32(ViewState["SelectedMemberID"]);
            string email = txtEmail.Text;
            string memberName = txtMemberName.Text;
            string password = txtPassword.Text;

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "UPDATE Members SET Email = @Email, MemberName = @MemberName, Password_ = @Password_, Role_ = @Role_ " +
                                   "WHERE MemberID = @MemberID";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@MemberID", memberId);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@MemberName", memberName);
                    cmd.Parameters.AddWithValue("@Password_", password);
                    cmd.Parameters.AddWithValue("@Role_", userType);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    ClearFields();
                }

                LoadUserData();
                lblMessage.Text = "User updated successfully.";
                lblMessage.Visible = true;
                lblMessage.CssClass = "alert alert-success";
            }
            catch (Exception ex)
            {
                lblMessage.Text = "An error occurred: " + ex.Message;
                lblMessage.Visible = true;
                lblMessage.CssClass = "alert alert-danger";
            }
        }

        protected void GridViewUsers_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridViewUsers.SelectedRow;
            ViewState["SelectedMemberID"] = GridViewUsers.DataKeys[row.RowIndex].Value;
            txtEmail.Text = row.Cells[0].Text;
            txtMemberName.Text = row.Cells[1].Text;
            txtPassword.Text = row.Cells[2].Text;
            ddlUserType.SelectedValue = row.Cells[3].Text;
            btnAddUser.Visible = false;
            btnUpdateUser.Visible = true;
        }

        protected void btnRemoveUser_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            int memberId = Convert.ToInt32(GridViewUsers.DataKeys[row.RowIndex].Value);

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "DELETE FROM Members WHERE MemberID = @MemberID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@MemberID", memberId);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                LoadUserData();
                lblMessage.Text = "User removed successfully.";
                lblMessage.Visible = true;
                lblMessage.CssClass = "alert alert-success";
            }
            catch (Exception ex)
            {
                lblMessage.Text = "An error occurred: " + ex.Message;
                lblMessage.Visible = true;
                lblMessage.CssClass = "alert alert-danger";
            }
        }
    }
}