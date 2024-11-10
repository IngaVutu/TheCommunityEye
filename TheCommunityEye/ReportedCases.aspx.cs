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
    public partial class ReportedCases : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["CommunityEye"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStatistics();
                LoadRecentIncidents();
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

        private void LoadRecentIncidents()
        {
            int watchId = Convert.ToInt32(Session["WatchID"]);
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = @"SELECT Area, Description_, ReportDate 
                                 FROM Incidents 
                                 WHERE WatchID = @WatchID 
                                 ORDER BY ReportDate DESC";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@WatchID", watchId);
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable incidentsTable = new DataTable();
                    adapter.Fill(incidentsTable);

                    incidentRepeater.DataSource = incidentsTable;
                    incidentRepeater.DataBind();
                }
            }
        }
    }
}