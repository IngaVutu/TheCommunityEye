using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheCommunityEye
{
    public partial class PricePlan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                if (Request.Form["plan"] == null)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Please select a plan.');", true);
                }
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string selectedPlan = Request.Form["plan"];
            if (!string.IsNullOrEmpty(selectedPlan))
            {
                // Store the selected plan in session
                Session["SelectedPlan"] = selectedPlan;

                // Store the price in session based on the selected plan
                switch (selectedPlan)
                {
                    case "standard":
                        Session["PlanPrice"] = "R599,88";
                        break;
                    case "premium":
                        Session["PlanPrice"] = "R1199,88";
                        break;
                    case "gold":
                        Session["PlanPrice"] = "R1811,88";
                        break;
                }

                // Redirect to the Payment page
                Response.Redirect("Payment.aspx");
            }
            else
            {
                // Show alert if no plan is selected
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    "alert('Please select a plan before proceeding.');", true);
            }
        }
    }
}