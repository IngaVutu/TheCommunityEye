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
    public partial class Payment : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["CommunityEye"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["SelectedPlan"] == null)
                {
                    Response.Redirect("PricePlan.aspx");
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string cardName = txtCardName.Text.Trim();
                    string cardNumber = txtCardNumber.Text.Trim();
                    DateTime expiry = Convert.ToDateTime(txtExpiryDate.Text);
                    string cvv = txtCVV.Text.Trim();
                    string plan = Session["SelectedPlan"].ToString();
                    string userID = "1";  // Example: Get current UserID from session or authentication
                    int watchID = 0;

                    // Retrieve price and cap based on the selected plan
                    (decimal price, int cap) = GetPlanDetails(plan);

                    if (ValidatePaymentDetails(cardName, cardNumber, expiry, cvv))
                    {
                        using (SqlConnection con = new SqlConnection(connectionString))
                        {
                            con.Open();
                            using (SqlTransaction transaction = con.BeginTransaction())
                            {
                                try
                                {
                                    // Step 1: Save payment details with price
                                    SavePaymentDetails(con, transaction, userID, cardName, cardNumber, expiry, cvv, plan, price);

                                    // Step 2: Create new watch with cap and get WatchID
                                    watchID = CreateWatch(con, transaction, cap);

                                    // Step 3: Add the user to the Members table
                                    JoinWatch(con, transaction, watchID, userID);

                                    transaction.Commit();
                                    Response.Redirect("WatchLogin.aspx");
                                }
                                catch (Exception ex)
                                {
                                    transaction.Rollback();
                                    Response.Write($"<script>alert('Error: {ex.Message}');</script>");
                                }
                            }
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid payment details.');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('Unexpected error: {ex.Message}');</script>");
                }
            }
        }

        private bool ValidatePaymentDetails(string name, string cardNumber, DateTime expiry, string cvv)
        {
            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(cardNumber) || string.IsNullOrEmpty(cvv))
                return false;

            if (!System.Text.RegularExpressions.Regex.IsMatch(cardNumber, @"^\d{16}$"))
                return false;

            if (!System.Text.RegularExpressions.Regex.IsMatch(cvv, @"^\d{3}$"))
                return false;

            return expiry > DateTime.Now;
        }

        private void SavePaymentDetails(SqlConnection con, SqlTransaction transaction, string userID, string cardName, string cardNumber, DateTime expiry, string cvv, string plan, decimal price)
        {
            string query = @"INSERT INTO PaymentInformation (UserID, CardName, CardNumber, CVV, ExpiryDate, PaymentDate, Plan_, Price) 
                             VALUES (@UserID, @CardName, @CardNumber, @CVV, @ExpiryDate, @PaymentDate, @Plan_, @Price)";

            using (SqlCommand cmd = new SqlCommand(query, con, transaction))
            {
                cmd.Parameters.AddWithValue("@UserID", userID);
                cmd.Parameters.AddWithValue("@CardName", cardName);
                cmd.Parameters.AddWithValue("@CardNumber", cardNumber);
                cmd.Parameters.AddWithValue("@CVV", cvv);
                cmd.Parameters.AddWithValue("@ExpiryDate", expiry);
                cmd.Parameters.AddWithValue("@PaymentDate", DateTime.Now);
                cmd.Parameters.AddWithValue("@Plan_", plan);
                cmd.Parameters.AddWithValue("@Price", price);

                cmd.ExecuteNonQuery();
            }
        }

        private int CreateWatch(SqlConnection con, SqlTransaction transaction, int cap)
        {
            string WatchName = Session["GroupName"].ToString();
            string AdminName = Session["AdminName"].ToString();
            string Area = Session["Area"].ToString();
            string Description = Session["Description"].ToString();

            string query = @"INSERT INTO Watch (WatchName, AdminName, CreatedDate, Members, Area, Description_, Cap) 
                             OUTPUT INSERTED.WatchID 
                             VALUES (@WatchName, @AdminName, @CreatedDate, @Members, @Area, @Description, @Cap)";

            using (SqlCommand cmd = new SqlCommand(query, con, transaction))
            {
                cmd.Parameters.AddWithValue("@WatchName", WatchName);
                cmd.Parameters.AddWithValue("@AdminName", AdminName);
                cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
                cmd.Parameters.AddWithValue("@Members", 1);  // Initial member count
                cmd.Parameters.AddWithValue("@Area", Area);
                cmd.Parameters.AddWithValue("@Description", Description);
                cmd.Parameters.AddWithValue("@Cap", cap);

                return (int)cmd.ExecuteScalar(); // Get the generated WatchID
            }
        }

        private void JoinWatch(SqlConnection con, SqlTransaction transaction, int watchID, string userID)
        {
            string role = "Admin";
            DateTime joinedDate = DateTime.Now;
            string email = Session["Email"].ToString();
            string password = Session["Password"].ToString();
            string AdminName = Session["AdminName"].ToString();

            string query = @"INSERT INTO Members (UserID, WatchID, JoinedDate, Role_, Email, Password_, MemberName) 
                             VALUES (@UserID, @WatchID, @JoinedDate, @Role_, @Email, @Password_, @MemberName)";

            using (SqlCommand cmd = new SqlCommand(query, con, transaction))
            {
                cmd.Parameters.AddWithValue("@UserID", userID);
                cmd.Parameters.AddWithValue("@WatchID", watchID);
                cmd.Parameters.AddWithValue("@JoinedDate", joinedDate);
                cmd.Parameters.AddWithValue("@Role_", role);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password_", password);
                cmd.Parameters.AddWithValue("@MemberName", AdminName);

                cmd.ExecuteNonQuery();
            }
        }

        private (decimal, int) GetPlanDetails(string plan)
        {
            switch (plan.ToLower())
            {
                case "standard":
                    return (599.88m, 30);
                case "premium":
                    return (1199.88m, 80);
                case "gold":
                    return (1811.88m, 150);
                default:
                    throw new Exception("Invalid plan selected.");
            }
        }
    }
}