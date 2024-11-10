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
    public partial class ReportCrimes : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["CommunityEye"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the user is logged in and their ID is available
                if (Session["ID_Number"] != null)
                {
                    lblID.Text = Session["ID_Number"].ToString();
                    Session["IDNumber"] = lblID.Text;
                }
                else
                {
                    // Redirect to login page if the user is not logged in
                    Response.Redirect("~/SignUp.aspx");
                }
            }
        }

        private void ClearFields()
        {
            txtDescription.Text = string.Empty;
            ddlArea.SelectedValue = "None";
            ddlCrimeType.SelectedValue = "None";
            ddlDating.SelectedValue = "None";
            ddlFile.SelectedValue = "None";
            ddlArea.Focus();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string CrimeType = ddlCrimeType.SelectedValue;
            string Description = txtDescription.Text;
            string Province = ddlArea.SelectedValue;
            string Dating = ddlDating.SelectedValue;
            string EvidenceFileType = ddlFile.SelectedValue;
            byte[] Evidence = FileUploadEvidence.FileBytes;
            string Plaintiff = Session["ID_Number"].ToString();
            string status = "Pending";
            DateTime ReportDate = DateTime.Today;
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {

                    if (ddlDating.SelectedValue == "None" || ddlArea.SelectedValue == "None" || ddlCrimeType.SelectedValue == "None")
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "selectOptions();", true);
                    }
                    if (FileUploadEvidence.HasFile && ddlFile.SelectedValue == "None")
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "submitEvidence();", true);
                    }
                    if (txtDescription.Text==string.Empty)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "submitDescription();", true);
                    }
                    string query = "Insert into CrimeCase" + "(CrimeType, Area, Recency, Detail, Evidence, PlaintiffID, EvidenceFileType, ReportDate, Status_)Values (@CrimeType, @Area, @Recency, @Detail, @Evidence, @PlaintiffID, @EvidenceFileType, @ReportDate, @Status_)";
                    SqlCommand store = new SqlCommand(query, connection);
                    store.Parameters.AddWithValue("@CrimeType", CrimeType);
                    store.Parameters.AddWithValue("@Area", Province);
                    store.Parameters.AddWithValue("@Recency", Dating);
                    store.Parameters.AddWithValue("@Detail", Description);
                    store.Parameters.AddWithValue("@Evidence", Evidence);
                    store.Parameters.AddWithValue("@PlaintiffID", Plaintiff);
                    store.Parameters.AddWithValue("@EvidenceFileType", EvidenceFileType);
                    store.Parameters.AddWithValue("@ReportDate", ReportDate);
                    store.Parameters.AddWithValue("@Status_", status);
                    connection.Open();
                    store.ExecuteNonQuery();
                    connection.Close();
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "submissionAcknowledgement();", true);
                    ClearFields();
                }

            }
            catch
            {
                Response.Write("<script>alert('Something went wrong')</script>");
                Response.Redirect("~/ReportCrimes.aspx");
            }
        }
        protected void btnClears_Click(object sender, EventArgs e)
        {
            ClearFields();
        }
    }
}