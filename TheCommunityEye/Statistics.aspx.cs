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
    public partial class Statistics : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["CommunityEye"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadCrimeData();
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
        private string GetMonthName(int monthNumber)
        {
            return new DateTime(2024, monthNumber, 1).ToString("MMMM");
        }
    }
}