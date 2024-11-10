using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheCommunityEye
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["ID_Number"] = null;
        }

        protected void btnAnonymous_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Report.aspx");
        }
        protected void btnEmergency_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EmergencyContact.aspx");
        }
        protected void btnWanted_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WatchDashBoard.aspx");
        }

    }
}