<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyCases.aspx.cs" Inherits="TheCommunityEye.MyCases" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Cases</title>
    <link href="Styles/StyleSheet2.css" rel="stylesheet" />
    <link href="Styles/StyleSheet3.css" rel="stylesheet" />
    <link href="Styles/StyleSheet1.css" rel="stylesheet" />
    <link href="Styles/Content/bootstrap.css" rel="stylesheet" />
    <script src="Styles/JavaScript.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style>
        .case-list-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        .case-item {
            width: 90%;
            max-width: 600px;
            background-color: lightgrey;
            color: midnightblue;
            border-radius: 10px;
            margin: 10px 0;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
        }

            .case-item h4 {
                margin: 0 0 10px 0;
                border-bottom: 1px solid white;
                padding-bottom: 5px;
                font-size: 20px;
            }

            .case-item p {
                margin: 5px 0;
                font-size: 16px;
            }

        .footer-text {
            margin-top: 10px;
            color: grey;
            font-style: italic;
        }

        .footerr {
            margin-top: 30px;
            text-align: center;
            color: midnightblue;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="topnav">
                <a href="MyCases.aspx" class="active"><b>My Cases</b></a>
                <!-- Navigation links (hidden by default) -->
                <div id="myLinks">
                    <a href="ReportCrimes.aspx">Report Crime</a>
                    <a href="CrimeStats.aspx">Neighborhood Watch</a>
                    <a href="Default.aspx">Sign Out</a>
                </div>
                <!-- "Hamburger menu" / "Bar icon" to toggle the navigation links -->
                <a href="javascript:void(0);" class="icon" onclick="myFunction()">
                    <i class="fa fa-bars"></i>
                </a>
            </div>

            <div class="body" style="background-color: lightgray">
                <div class="container" style="text-align: center">
                    <h2>Your Reported Cases</h2>
                    <div class="case-list-container">
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <div class="case-item">
                                    <h4>Reported on: <%# Eval("ReportDate", "{0:yyyy-MM-dd}") %></h4>
                                    <p><strong>Area:</strong> <%# Eval("Area") %></p>
                                    <p><strong>Crime Type:</strong> <%# Eval("CrimeType") %></p>
                                    <p><strong>Details:</strong> <%# Eval("Detail") %></p>
                                    <p><strong>Status:</strong> <%# Eval("Status_") %></p>
                                </div>
                            </ItemTemplate>

                            <FooterTemplate>
                                <p class="footer-text">No more cases to display.</p>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CommunityEye %>" SelectCommand="SELECT [ReportDate], [Area], [CrimeType], [Detail], [Status_] FROM [CrimeCase] WHERE ([PlaintiffID] = @PlaintiffID)">
                        <SelectParameters>
                            <asp:SessionParameter Name="PlaintiffID" SessionField="IDNumber" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <div class="footerr">
                <p>&copy; 2024 The Community Eye</p>
            </div>
        </div>
    </form>
</body>
</html>
