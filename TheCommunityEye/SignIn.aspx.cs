using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using TheCommunityEye.Images;

namespace TheCommunityEye
{
    public partial class SignIn : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["CommunityEye"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear sessions on page load
            Session["ID_Number"] = null;
            Session["Email"] = null;
        }

        private void ClearFields()
        {
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtEmail.Focus();
        }

        protected void SignIn_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    string query = @"
                        SELECT MemberID, UserType 
                        FROM CommunityMember 
                        WHERE Email = @Email AND Password_ = @Password_";

                    using (SqlCommand cmd = new SqlCommand(query, connection))
                    {
                        // Add parameters to prevent SQL Injection
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Password_", password);

                        connection.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.Read())
                        {
                            string memberID = reader["MemberID"].ToString();
                            string userType = reader["UserType"].ToString();

                            // Store MemberID and Email in session
                            Session["ID_Number"] = memberID;
                            Session["Email"] = email;

                            reader.Close();

                            // Redirect based on UserType
                            switch (userType)
                            {
                                case "Citizen":
                                    Response.Redirect("~/ReportCrimes.aspx");
                                    break;

                                case "Officer":
                                    Response.Redirect("~/LawEnforcement.aspx");
                                    break;

                                case "Admin":
                                    Response.Redirect("~/AdminDashBoard.aspx");
                                    break;

                                default:
                                    throw new Exception("Invalid user type.");
                            }
                        }
                        else
                        {
                            // Handle login failure
                            lblError.Visible = true;
                            ClearFields();
                        }
                    }
                }
                catch (TimeoutException)
                {
                    Response.Write("<script>alert('Something went wrong. Please try again later.')</script>");
                }
                finally
                {
                    connection.Close();
                }
            }
        }
    }
}