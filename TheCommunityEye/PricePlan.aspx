<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PricePlan.aspx.cs" Inherits="TheCommunityEye.PricePlan" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Neighborhood Watch|Price Plan</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        h1 {
            color: #2c3e50;
            text-align: center;
        }

        .pricing-card {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-top: 20px;
        }

        .plan-option {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            padding: 15px;
            border: 2px solid #e0e0e0;
            border-radius: 6px;
            transition: all 0.3s ease;
        }

            .plan-option:hover {
                border-color: #3498db;
            }

            .plan-option input[type="radio"] {
                margin-right: 15px;
            }

        .plan-details {
            flex-grow: 1;
        }

        .plan-name {
            font-weight: bold;
            font-size: 18px;
            color: #2c3e50;
        }

        .plan-price {
            color: #3498db;
            font-size: 16px;
        }

        .plan-members {
            color: #7f8c8d;
            font-size: 14px;
        }

        .submit-btn {
            background-color: #2ecc71;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

            .submit-btn:hover {
                background-color: #27ae60;
            }

        .button-container {
            text-align: center;
            margin-top: 20px;
        }
        .footer {
            margin-top: 30px;
            text-align: center;
            color: midnightblue;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Neighborhood Watch Registration</h1>
        <div class="pricing-card">
            <h2 style="text-align: center">Choose Your Plan</h2>
            <form id="planForm" runat="server" method="post">
                <div class="plan-option">
                    <input type="radio" id="standard" name="plan" value="standard" runat="server" />
                    <div class="plan-details">
                        <label for="standard" class="plan-name">Standard</label>
                        <p class="plan-price">R599.88/year</p>
                        <p class="plan-members">Up to 10 members</p>
                    </div>
                </div>

                <div class="plan-option">
                    <input type="radio" id="premium" name="plan" value="premium" runat="server" />
                    <div class="plan-details">
                        <label for="premium" class="plan-name">Premium</label>
                        <p class="plan-price">R1199.88/year</p>
                        <p class="plan-members">Up to 20 members</p>
                    </div>
                </div>

                <div class="plan-option">
                    <input type="radio" id="gold" name="plan" value="gold" runat="server" />
                    <div class="plan-details">
                        <label for="gold" class="plan-name">Gold</label>
                        <p class="plan-price">R1811.88/year</p>
                        <p class="plan-members">Unlimited members</p>
                    </div>
                </div>

                <div class="button-container">
                    <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="submit-btn" OnClick="btnRegister_Click" />
                </div>
            </form>
        </div>
    </div>
    <div class="footer">
        <p>&copy; 2024 The Community Eye</p>
    </div>
</body>
</html>
