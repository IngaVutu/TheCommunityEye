using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.DataVisualization.Charting;


namespace TheCommunityEye
{
    public partial class OfficerStats : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["CommunityEye"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCrimeData();
                LoadCaseStatusData();
            }
        }

        private void LoadCrimeData()
        {
            string query1 = @"SELECT MONTH(ReportDate) AS Month, COUNT(*) AS CrimeCount FROM CrimeCase GROUP BY MONTH(ReportDate) ORDER BY Month;";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query1, con);
                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                // Clear any existing points
                crimeChart1.Series["Crimes"].Points.Clear();

                while (reader.Read())
                {
                    int month = reader.GetInt32(0); // Month
                    int crimeCount = reader.GetInt32(1); // Crime count

                    // Add data points to the chart
                    crimeChart1.Series["Crimes"].Points.AddXY(GetMonthName(month), crimeCount);
                    crimeChart1.ChartAreas[0].AxisY.Interval = 1;
                    crimeChart1.ChartAreas[0].AxisY.Minimum = 0;
                }
            }
            string query = "SELECT CrimeType, COUNT(*) AS CaseCount FROM CrimeCase GROUP BY CrimeType";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                // Clear previous chart data
                crimeChart.Series["Cases"].Points.Clear();

                while (reader.Read())
                {
                    // Add each crime type and case count to the chart
                    crimeChart.Series["Cases"].Points.AddXY(reader["CrimeType"].ToString(), Convert.ToInt32(reader["CaseCount"]));
                    crimeChart.ChartAreas[0].AxisY.Interval = 1;
                    crimeChart.ChartAreas[0].AxisY.Minimum = 0;
                }

                reader.Close();
            }
        }

        private void LoadCaseStatusData()
        {
            string query = @"SELECT 
                                SUM(CASE WHEN Status_ = 'Complete' THEN 1 ELSE 0 END) AS CompletedCases,
                                SUM(CASE WHEN Status_ = 'Under Investigation' THEN 1 ELSE 0 END) AS UnderInvestigationCases,
                                SUM(CASE WHEN Status_ = 'Pending' THEN 1 ELSE 0 END) AS PendingCases
                             FROM CrimeCase";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    int completedCases = reader.GetInt32(0);
                    int underInvestigationCases = reader.GetInt32(1);
                    int pendingCases = reader.GetInt32(2);

                    // Clear previous chart data
                    caseStatusChart.Series["CaseStatus"].Points.Clear();

                    // Add data points to the chart
                    caseStatusChart.Series["CaseStatus"].Points.AddXY("Completed", completedCases);
                    caseStatusChart.Series["CaseStatus"].Points.AddXY("Under Investigation", underInvestigationCases);
                    caseStatusChart.Series["CaseStatus"].Points.AddXY("Pending", pendingCases);

                    // Customize the chart
                    caseStatusChart.Series["CaseStatus"].ChartType = SeriesChartType.Pie;
                    caseStatusChart.Series["CaseStatus"]["PieLabelStyle"] = "Outside";
                    caseStatusChart.Series["CaseStatus"].Label = "#PERCENT{P0}";
                    caseStatusChart.Series["CaseStatus"].LegendText = "#VALX";
                    caseStatusChart.Legends.Add(new Legend("CaseStatusLegend"));
                }

                reader.Close();
            }
        }

        private string GetMonthName(int monthNumber)
        {
            return new DateTime(2024, monthNumber, 1).ToString("MMMM");
        }
    }
}