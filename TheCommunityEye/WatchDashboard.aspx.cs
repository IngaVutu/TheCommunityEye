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
    public partial class WatchDashboard : Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["CommunityEye"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            DisplayTotalItems();
            DisplayReportsForCurrentMonth();
        }
        private void DisplayTotalItems()
        {
            // SQL query to get the total count of items
            string query = "SELECT COUNT(*) FROM Watch";
            string query2 = "SELECT COUNT(*) FROM Members";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlCommand cmd2 = new SqlCommand(query2, con);

                    // Execute the query and get the count
                    int totalWatches = (int)cmd.ExecuteScalar();
                    int totalUsers = (int)cmd2.ExecuteScalar();

                    // Set the count to the label
                    lblTotalWatches.Text = totalWatches.ToString();
                    lblUsers.Text = totalUsers.ToString();
                }
                catch (Exception ex)
                {
                    lblTotalWatches.Text = " ";
                    lblUsers.Text = " ";
                }
            }
        }
        private void DisplayReportsForCurrentMonth()
        {
            // Get the current year and month
            int currentYear = DateTime.Now.Year;
            int currentMonth = DateTime.Now.Month;

            string query = "SELECT COUNT(*) FROM Incidents WHERE YEAR(ReportDate) = @Year AND MONTH(ReportDate) = @Month";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@Year", currentYear);
                    cmd.Parameters.AddWithValue("@Month", currentMonth);

                    int reportCount = (int)cmd.ExecuteScalar();

                    lblIncidents.Text = reportCount.ToString();
                }
                catch (Exception ex)
                {
                    lblIncidents.Text = " ";
                }
            }
        }
    }
}