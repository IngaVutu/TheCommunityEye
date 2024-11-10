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
    public partial class WatchDefault : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["CommunityEye"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStatistics();
            }
        }

        private void LoadStatistics()
        {
            int watchId = Convert.ToInt32(Session["WatchID"]);

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Get number of incidents
                string incidentQuery = "SELECT COUNT(*) FROM Incidents WHERE WatchID = @WatchID";
                using (SqlCommand command = new SqlCommand(incidentQuery, connection))
                {
                    command.Parameters.AddWithValue("@WatchID", watchId);
                    int incidentCount = (int)command.ExecuteScalar();
                    lblIncidents.Text = incidentCount.ToString();
                }

                // Get number of watch members
                string memberQuery = "SELECT COUNT(*) FROM Members WHERE WatchID = @WatchID";
                using (SqlCommand command = new SqlCommand(memberQuery, connection))
                {
                    command.Parameters.AddWithValue("@WatchID", watchId);
                    int memberCount = (int)command.ExecuteScalar();
                    lblWatchMembers.Text = memberCount.ToString();
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int watchId = Convert.ToInt32(Session["WatchID"]);
            int memberId = Convert.ToInt32(Session["MemberID"]);

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string insertQuery = "INSERT INTO Incidents (WatchID, Area, Description_, ReportDate, MemberID) VALUES (@WatchID, @Area, @Description, @ReportDate, @MemberID)";
                using (SqlCommand command = new SqlCommand(insertQuery, connection))
                {
                    command.Parameters.AddWithValue("@WatchID", watchId);
                    command.Parameters.AddWithValue("@MemberID", memberId);
                    command.Parameters.AddWithValue("@Area", txtLocation.Text);
                    command.Parameters.AddWithValue("@Description", txtDescription.Text);
                    command.Parameters.AddWithValue("@ReportDate", DateTime.Now);

                    command.ExecuteNonQuery();

                    Response.Write("<script>alert('Report successful.');</script>");
                }
            }

            // Clear the form and reload statistics
            txtLocation.Text = string.Empty;
            txtDescription.Text = string.Empty;
            LoadStatistics();
        }
    }
}