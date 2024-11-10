using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace TheCommunityEye
{
    public partial class AdminProfile : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["CommunityEye"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // Ensure this only runs once when the page is first loaded
            {
                lblEmail.Text = Session["Email"].ToString();
                lblID.Text = Session["ID_Number"].ToString();
                lblUserEmail.Text = Session["Email"].ToString();
                LoadInfo();
            }
        }

        private void LoadInfo()
        {
            string IDNumber = Convert.ToString(Session["ID_Number"]);

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                try
                {
                    string selectQuery = "SELECT CellNum, Password_ FROM CommunityMember WHERE MemberID = @MemberID";
                    SqlCommand selectCmd = new SqlCommand(selectQuery, connection);
                    selectCmd.Parameters.AddWithValue("@MemberID", IDNumber);

                    SqlDataReader reader = selectCmd.ExecuteReader();
                    if (reader.Read())
                    {
                        lblCell.Text = reader["CellNum"].ToString();
                        lblPassword.Text = reader["Password_"].ToString();
                        reader.Close();
                    }
                }
                catch
                {
                    Response.Write("<script>alert('An unexpected error occured!')</script>");
                }
            }
        }
    }
}