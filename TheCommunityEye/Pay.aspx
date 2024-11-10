<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pay.aspx.cs" Inherits="TheCommunityEye.Pay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Page</title>
    <link href="Styles/StyleSheet.css" rel="stylesheet" />
    <style>
        .footer {
            margin-top: 30px;
            text-align: center;
            color: midnightblue;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Payment Portal</h1>
        <form id="paymentForm" runat="server">
            <div class="form-group">
                <label for="CardName">Cardholder Name:</label>
                <asp:TextBox ID="txtCardName" runat="server" CssClass="form-control" required="required" />
            </div>

            <div class="form-group">
                <label for="CardNumber">Card Number:</label>
                <asp:TextBox ID="txtCardNumber" runat="server" CssClass="form-control" MaxLength="16" TextMode="Password" required="required" />
            </div>

            <div class="form-group">
                <label for="CVV">CVV:</label>
                <asp:TextBox ID="txtCVV" runat="server" CssClass="form-control" MaxLength="3" TextMode="Password" required="required" />
            </div>

            <div class="form-group">
                <label for="ExpiryDate">Expiry Date:</label>
                <asp:TextBox ID="txtExpiryDate" runat="server" TextMode="Date" CssClass="form-control" required="required" />
            </div>

            <asp:Button ID="btnSubmit" runat="server" Text="Submit Payment" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
        </form>
    </div>
    <div class="footer">
        <p>&copy; 2024 The Community Eye</p>
    </div>
</body>
</html>
