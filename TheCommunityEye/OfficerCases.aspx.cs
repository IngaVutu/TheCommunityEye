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
    public partial class OfficerCases : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["CommunityEye"].ConnectionString;
        private DataTable caseTable;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCases();
            }
        }

        private void BindCases(string sortExpression = null)
        {
            // Retrieve the Officer ID from the session
            string officerID = Session["ID_Number"].ToString();
            if (string.IsNullOrEmpty(officerID))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error: Officer ID not found.');", true);
                return;
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"
            SELECT CaseID, CrimeType, Area, Detail, Evidence, Recency, PlaintiffID, Status_ 
            FROM CrimeCase 
            WHERE OfficerID = @OfficerID";

                using (SqlDataAdapter adapter = new SqlDataAdapter(query, connection))
                {
                    // Add the parameter to the adapter's SelectCommand
                    adapter.SelectCommand.Parameters.AddWithValue("@OfficerID", officerID);

                    caseTable = new DataTable();
                    adapter.Fill(caseTable);
                }
            }

            // Apply sorting if a sort expression is provided
            if (!string.IsNullOrEmpty(sortExpression))
            {
                DataView dv = caseTable.DefaultView;
                dv.Sort = sortExpression;
                caseTable = dv.ToTable();
            }

            // Bind the GridView
            gvCases.DataSource = caseTable;
            gvCases.DataBind();
        }

        protected void gvCases_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "UpdateStatus")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvCases.Rows[index];
                int caseID = Convert.ToInt32(gvCases.DataKeys[index].Value);

                DropDownList ddlStatus = (DropDownList)row.FindControl("ddlStatus");
                string newStatus = ddlStatus.SelectedValue;

                UpdateCaseStatus(caseID, newStatus);
            }
            else if (e.CommandName == "DownloadEvidence")
            {
                int caseID = Convert.ToInt32(e.CommandArgument);
                DownloadEvidence(caseID);
            }
        }

        private void UpdateCaseStatus(int caseID, string newStatus)
        {
            // Retrieve the Officer ID from the session
            string officerID = Session["ID_Number"]?.ToString();
            if (string.IsNullOrEmpty(officerID))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error: Officer ID not found.');", true);
                return;
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"
                    UPDATE CrimeCase 
                    SET Status_ = @Status_, OfficerID = @OfficerID 
                    WHERE CaseID = @CaseID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Status_", newStatus);
                    command.Parameters.AddWithValue("@OfficerID", officerID);
                    command.Parameters.AddWithValue("@CaseID", caseID);

                    connection.Open();
                    command.ExecuteNonQuery();

                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "Updated();", true);
                }
            }

            // Refresh the data after updating
            BindCases();
        }

        private void DownloadEvidence(int caseID)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT Evidence, EvidenceFileType FROM CrimeCase WHERE CaseID = @CaseID";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@CaseID", caseID);

                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            byte[] fileData = (byte[])reader["Evidence"];
                            string fileType = reader["EvidenceFileType"].ToString();

                            string fileExtension = fileType.Contains("/")
                                ? "." + fileType.Split('/')[1]
                                : fileType;

                            string fileName = "Evidence_" + caseID + fileExtension;

                            Response.Clear();
                            Response.ContentType = fileType;
                            Response.AddHeader("Content-Disposition", "attachment; filename=" + fileName);
                            Response.BinaryWrite(fileData);
                            Response.End();
                        }
                    }
                }
            }
        }

        protected void gvCases_Sorting(object sender, GridViewSortEventArgs e)
        {
            BindCases(e.SortExpression);
        }
    }
}