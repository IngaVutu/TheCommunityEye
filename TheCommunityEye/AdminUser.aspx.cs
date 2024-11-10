using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;

namespace TheCommunityEye
{
    public partial class AdminUser : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["CommunityEye"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUserData();
                lblUserEmail.Text = Session["Email"].ToString();
                ClearFields();
            }
        }

        private void LoadUserData()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM CommunityMember";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                GridViewUsers.DataSource = reader;
                GridViewUsers.DataBind();
            }
        }
        private void ClearFields()
        {
            txtMemberID.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtCellNum.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtMemberID.Focus();
        }

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            
            string memberId = txtMemberID.Text;
            string email = txtEmail.Text;
            string cellNum = txtCellNum.Text;
            string password = txtPassword.Text;
            string userType = ddlUserType.SelectedValue;
            string emailPattern = @"^[^@\s]+@[^@\s]+\.[^@\s]+$";

            try
            {
                if (!(memberId.All(char.IsDigit)))
                {
                    Response.Write("<script>alert('MemberID must be all digits.')</script>");
                    return;
                }

                // Validate email format
                if (!Regex.IsMatch(email, emailPattern))
                {
                    Response.Write("<script>alert('Please enter a valid email address (e.g., example@example.com).')</script>");
                    return;
                }

                // Validate contact number
                if (!int.TryParse(cellNum, out int contactNumber))
                {
                    Response.Write("<script>alert('Please enter a valid contact number.')</script>");
                    return;
                }
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO CommunityMember (MemberID, Email, CellNum, Password_, UserType) " +
                                   "VALUES (@MemberID, @Email, @CellNum, @Password_, @UserType)";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@MemberID", memberId);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@CellNum", cellNum);
                    cmd.Parameters.AddWithValue("@Password_", password);
                    cmd.Parameters.AddWithValue("@UserType", userType);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    ClearFields();

                }
                LoadUserData();
            }
            catch
            {
                Response.Redirect("AdminUser.aspx");
                Response.Write("<script>alert('An unexpected error occured.')</script>");
            }
        }

        protected void btnUpdateUser_Click(object sender, EventArgs e)
        {
            string memberId = txtMemberID.Text;
            string email = txtEmail.Text;
            string cellNum = txtCellNum.Text;
            string password = txtPassword.Text;
            string userType = ddlUserType.SelectedValue;
            string emailPattern = @"^[^@\s]+@[^@\s]+\.[^@\s]+$";
            try
            {
                if (!(memberId.All(char.IsDigit)))
                {
                    Response.Write("<script>alert('MemberID must be all digits.')</script>");
                    return;
                }

                // Validate email format
                if (!Regex.IsMatch(email, emailPattern))
                {
                    Response.Write("<script>alert('Please enter a valid email address (e.g., example@example.com).')</script>");
                    return;
                }

                // Validate contact number
                if (!int.TryParse(cellNum, out int contactNumber))
                {
                    Response.Write("<script>alert('Please enter a valid contact number.')</script>");
                    return;
                }

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "UPDATE CommunityMember SET Email = @Email, CellNum = @CellNum, Password_ = @Password_, UserType = @UserType " +
                                   "WHERE MemberID = @MemberID";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@MemberID", memberId);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@CellNum", cellNum);
                    cmd.Parameters.AddWithValue("@Password_", password);
                    cmd.Parameters.AddWithValue("@UserType", userType);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    ClearFields();
                }

                LoadUserData();
            }
            catch
            {
                Response.Redirect("AdminUser.aspx");
                Response.Write("<script>alert('An unexpected error occured.')</script>");
            }
        }

        protected void GridViewUsers_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridViewUsers.SelectedRow;
            txtMemberID.Text = row.Cells[0].Text;
            txtEmail.Text = row.Cells[1].Text;
            txtCellNum.Text = row.Cells[2].Text;
            txtPassword.Text = row.Cells[3].Text;
            ddlUserType.SelectedValue = row.Cells[4].Text;
        }
    }
}