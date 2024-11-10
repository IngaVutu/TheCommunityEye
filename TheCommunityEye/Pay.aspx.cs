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
    public partial class Pay : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["CommunityEye"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["WatchID"] == null || Session["ID_Number"] == null)
                {
                    Response.Redirect("Default.aspx");
                    return;
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
                    string expiry = txtExpiryDate.Text.Trim();
                    string cvv = txtCVV.Text.Trim();

                    if (ValidatePaymentDetails(cardName, cardNumber, expiry, cvv))
                    {
                        int watchID = Convert.ToInt32(Session["WatchID"]);
                        SavePaymentDetails(cardName, cardNumber, expiry, cvv);
                        JoinWatch(watchID);
                        Response.Redirect("CrimeStats.aspx");
                    }
                    else
                    {
                        // Error message for invalid payment
                    }
                }
                catch (Exception ex)
                {
                    // Log and display error
                }
            }
        }

        private bool ValidatePaymentDetails(string name, string cardNumber, string expiry, string cvv)
        {
            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(cardNumber) ||
                string.IsNullOrEmpty(expiry) || string.IsNullOrEmpty(cvv))
                return false;

            // Validate card number (should be 16 digits)
            if (!System.Text.RegularExpressions.Regex.IsMatch(cardNumber, @"^\d{16}$"))
                return false;

            // Validate expiry date format (MM/YY)
            if (!System.Text.RegularExpressions.Regex.IsMatch(expiry, @"^(0[1-9]|1[0-2])\/([0-9]{2})$"))
                return false;

            // Validate CVV (should be 3 digits)
            if (!System.Text.RegularExpressions.Regex.IsMatch(cvv, @"^\d{3}$"))
                return false;

            return true;
        }

        private void SavePaymentDetails(string cardName, string cardNumber, string expiry, string cvv)
        {
            string userID = Convert.ToString(Session["ID_Number"]);
            DateTime paymentDate = DateTime.Now;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandText = @"INSERT INTO PaymentInformation 
                        (UserID, CardName, CardNumber, CVV, ExpiryDate, PaymentDate) 
                        VALUES (@UserID, @CardName, @CardNumber, @CVV, @ExpiryDate, @PaymentDate)";

                    cmd.Parameters.AddWithValue("@UserID", userID);
                    cmd.Parameters.AddWithValue("@CardName", cardName);
                    cmd.Parameters.AddWithValue("@CardNumber", cardNumber);
                    cmd.Parameters.AddWithValue("@CVV", cvv);
                    cmd.Parameters.AddWithValue("@ExpiryDate", expiry);
                    cmd.Parameters.AddWithValue("@PaymentDate", paymentDate);

                    cmd.ExecuteNonQuery();
                }
            }
        }

        private void JoinWatch(int watchID)
        {
            string userID = Convert.ToString(Session["ID_Number"]);
            DateTime joinedDate = DateTime.Now;
            string role = "Member";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlTransaction transaction = con.BeginTransaction())
                {
                    try
                    {
                        using (SqlCommand cmd = new SqlCommand())
                        {
                            cmd.Connection = con;
                            cmd.Transaction = transaction;
                            cmd.CommandText = "SELECT Email, Password_ FROM CommunityMember WHERE MemberID = @UserID";
                            cmd.Parameters.AddWithValue("@UserID", userID);

                            using (SqlDataReader reader = cmd.ExecuteReader())
                            {
                                if (reader.Read())
                                {
                                    string email = reader["Email"].ToString();
                                    string password = reader["Password_"].ToString();
                                    reader.Close();

                                    cmd.Parameters.Clear();
                                    cmd.CommandText = @"INSERT INTO Members 
                                        (UserID, WatchID, JoinedDate, Role_, Email, Password_) 
                                        VALUES (@UserID, @WatchID, @JoinedDate, @Role_, @Email, @Password_)";

                                    cmd.Parameters.AddWithValue("@UserID", userID);
                                    cmd.Parameters.AddWithValue("@WatchID", watchID);
                                    cmd.Parameters.AddWithValue("@JoinedDate", joinedDate);
                                    cmd.Parameters.AddWithValue("@Role_", role);
                                    cmd.Parameters.AddWithValue("@Email", email);
                                    cmd.Parameters.AddWithValue("@Password_", password);
                                    cmd.ExecuteNonQuery();

                                    cmd.Parameters.Clear();
                                    cmd.CommandText = "UPDATE Watch SET Members = Members + 1 WHERE WatchID = @WatchID";
                                    cmd.Parameters.AddWithValue("@WatchID", watchID);
                                    cmd.ExecuteNonQuery();
                                }
                                else
                                {
                                    throw new Exception("User not found in CommunityMember table.");
                                }
                            }
                        }
                        transaction.Commit();
                    }
                    catch (Exception)
                    {
                        transaction.Rollback();
                        throw;
                    }
                }
            }
        }
    }
}