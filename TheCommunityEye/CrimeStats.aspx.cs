using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace TheCommunityEye
{
    public partial class CrimeStats : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["CommunityEye"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadWatches();
                if (Session["ID_Number"] != null)
                {
                    string userID = Session["ID_Number"].ToString();
                }
                else
                {
                    // Redirect to login page if the user is not logged in
                    Response.Redirect("~/SignUp.aspx");
                }
            }
        }

        // Load the watches into the GridView
        private void LoadWatches()
        {
            string query = "SELECT WatchID, WatchName, AdminName, Area FROM Watch";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                gvWatches.DataSource = cmd.ExecuteReader();
                gvWatches.DataBind();
            }
        }

        // Event handler for when a user clicks the Join button
        protected void gvWatches_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // Get WatchID from the CommandArgument and store it in the session
            int watchID = Convert.ToInt32(e.CommandArgument);
            Session["WatchID"] = watchID;
            string userID = Session["IDNumber"]?.ToString(); // Ensure userID is retrieved properly

            if (e.CommandName == "Join")
            {
                // Redirect to payment page for joining the watch
                Response.Redirect("Pay.aspx");
                return;
            }

            if (e.CommandName == "View")
            {
                try
                {
                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        con.Open();

                        // Retrieve the area of the watch and store it in the session
                        string areaQuery = "SELECT Area FROM Watch WHERE WatchID = @WatchID";
                        using (SqlCommand areaCmd = new SqlCommand(areaQuery, con))
                        {
                            areaCmd.Parameters.AddWithValue("@WatchID", watchID);
                            object area = areaCmd.ExecuteScalar();
                            if (area != null)
                            {
                                Session["Area"] = area.ToString();
                            }
                        }

                        // Check if the user is already a member of the selected watch
                        string memberQuery = @"SELECT MemberID FROM Members WHERE WatchID = @WatchID AND UserID = @UserID";

                        using (SqlCommand memberCmd = new SqlCommand(memberQuery, con))
                        {
                            memberCmd.Parameters.AddWithValue("@WatchID", watchID);
                            memberCmd.Parameters.AddWithValue("@UserID", userID);

                            object memberId = memberCmd.ExecuteScalar();
                            if (memberId != null)
                            {
                                // User is a member, store MemberID in session and redirect
                                Session["MemberID"] = memberId.ToString();
                                Response.Redirect("WatchDefault.aspx");
                            }
                            else
                            {
                                // User is not a member, redirect to payment page
                                Response.Redirect("Pay.aspx");
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Log the error and show an appropriate message to the user
                    // LogError(ex); // Optional: Implement a logging mechanism
                    Response.Write("<script>alert('An error occurred. Please try again later.');</script>");
                }
            }
        }
    }
}