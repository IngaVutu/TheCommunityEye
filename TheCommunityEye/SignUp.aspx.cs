using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using TheCommunityEye.Images;
using System.Text.RegularExpressions;

namespace TheCommunityEye
{
    public partial class Sign_Up : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["CommunityEye"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear session variables on page load
            Session["ID_Number"] = null;
            Session["Email"] = null;
        }

        private void ClearFields()
        {
            txtID.Text = "";
            txtConfirm.Text = "";
            txtPassword.Text = "";
            txtCell.Text = "";
            txtEmail.Text = "";
            txtID.Focus();
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            string IDNumber = txtID.Text.Trim();
            string Email = txtEmail.Text.Trim();
            string ContactNum = txtCell.Text.Trim();
            string Password = txtPassword.Text.Trim();
            string Confirm = txtConfirm.Text.Trim();
            string UserType = "Citizen";

            // Regular expression to validate email format
            string emailPattern = @"^[^@\s]+@[^@\s]+\.[^@\s]+$";

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // Validate ID number
                    if (IDNumber.Length != 13 || !IDNumber.All(char.IsDigit))
                    {
                        ShowError(lblIDError, "Invalid ID number. Must be 13 digits.");
                        return;
                    }

                    // Validate password confirmation
                    if (Password != Confirm)
                    {
                        ShowError(lblPasswordError, "Passwords do not match.");
                        return;
                    }

                    // Check if ID or Email already exists
                    if (IsUserExists(IDNumber, Email, connection))
                    {
                        Response.Write("<script>alert('ID number or Email already registered. Try logging in.')</script>");
                        ClearFields();
                        return;
                    }

                    // Insert new user if validations pass and user doesn't exist
                    string query = @"
                        INSERT INTO CommunityMember (MemberID, UserType, Email, CellNum, Password_) 
                        VALUES (@MemberID, @UserType, @Email, @CellNum, @Password_)";

                    SqlCommand store = new SqlCommand(query, connection);
                    store.Parameters.AddWithValue("@MemberID", IDNumber);
                    store.Parameters.AddWithValue("@UserType", UserType);
                    store.Parameters.AddWithValue("@Email", Email);
                    store.Parameters.AddWithValue("@CellNum", ContactNum);
                    store.Parameters.AddWithValue("@Password_", Password);

                    connection.Open();
                    store.ExecuteNonQuery();
                    connection.Close();

                    // Set session values and redirect
                    Session["ID_Number"] = IDNumber;
                    Session["Email"] = Email;

                    Response.Write("<script>alert('Sign Up Successful, Now Sign In!')</script>");
                    Response.Redirect("~/SignIn.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('An unexpected error occurred: " + ex.Message + "')</script>");
                ClearFields();
            }
        }

        private bool IsUserExists(string idNumber, string email, SqlConnection connection)
        {
            string query = @"
                SELECT 1 
                FROM CommunityMember 
                WHERE MemberID = @MemberID OR Email = @Email";

            using (SqlCommand cmd = new SqlCommand(query, connection))
            {
                cmd.Parameters.AddWithValue("@MemberID", idNumber);
                cmd.Parameters.AddWithValue("@Email", email);

                connection.Open();
                object result = cmd.ExecuteScalar();
                connection.Close();

                return result != null; // Returns true if a match is found
            }
        }

        private void ShowError(Label label, string message)
        {
            // Hide all error labels and show only the relevant one
            lblIDError.Visible = lblEmailError.Visible = lblCellError.Visible = lblPasswordError.Visible = false;
            label.Text = message;
            label.Visible = true;
        }

        protected void btnClears_Click(object sender, EventArgs e)
        {
            ClearFields();
        }
    }
}