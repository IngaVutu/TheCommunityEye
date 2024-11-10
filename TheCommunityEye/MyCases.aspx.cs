using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace TheCommunityEye
{
    public partial class MyCases : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["CommunityEye"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the user is logged in and their ID is available
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
    }
}