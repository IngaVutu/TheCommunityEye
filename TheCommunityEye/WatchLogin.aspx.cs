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
    public partial class WatchLogin : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["CommunityEye"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Get the user input from the textboxes
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Validate the user and get WatchID and Role
            if (ValidateUser(email, password, out int memberID, out int watchID, out string role))
            {
                Session["MemberID"] = memberID;
                Session["WatchID"] = watchID;
                Session["Role"] = role;

                // Redirect to the WatchDefault.aspx page
                Response.Redirect("WatchDefault.aspx");
            }
            else
            {
                // Display error message if login fails
                lblPassError.Text = "Invalid email or password. Please try again.";
            }
        }

        private bool ValidateUser(string email, string password, out int memberID, out int watchID, out string role)
        {
            bool isValid = false;
            memberID = 0;
            watchID = 0; 
            role = string.Empty;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                try
                {
                    conn.Open();

                    string query = "SELECT MemberID, WatchID, Role_ FROM Members WHERE Email = @Email AND Password_ = @Password";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Password", password);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                memberID = reader.GetInt32(0); // MemberID
                                watchID = reader.GetInt32(1);  // WatchID
                                role = reader.GetString(2);
                                isValid = true;
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblPassError.Text = "An error occurred: " + ex.Message;
                }
            }

            return isValid;
        }
    }
}