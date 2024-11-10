<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LawEnforcement.aspx.cs" Inherits="TheCommunityEye.LawEnforcement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reported Cases</title>
    <link href="Styles/StyleSheet2.css" rel="stylesheet" />
    <script src="Styles/Scripts/bootstrap.js"></script>
    <script src="Styles/JavaScript.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: lightgrey;
            color: midnightblue;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: midnightblue;
            margin-bottom: 30px;
        }

        .grid-header {
            font-weight: bold;
            background-color: midnightblue;
            color: white;
            text-align: left;
            padding: 10px;
        }

        .grid-row {
            padding: 10px;
            background-color: lightgrey;
            color: midnightblue;
        }

            .grid-row:nth-child(even) {
                background-color: white;
            }

        .status-dropdown {
            padding: 5px;
            width: 180px;
            border-radius: 5px;
            border: 1px solid midnightblue;
            color: midnightblue;
            background-color: lightgrey;
        }

            .status-dropdown option {
                color: midnightblue;
            }

        .button-update {
            background-color: midnightblue;
            color: white;
            border: none;
            padding: 5px 15px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 5px;
        }

            .button-update:hover {
                background-color: #2e3d63;
            }

        .grid-view {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

            .grid-view th, .grid-view td {
                padding: 15px;
                text-align: left;
            }

            .grid-view th {
                background-color: midnightblue;
                color: white;
            }

            .grid-view td {
                background-color: lightgrey;
            }

            .grid-view tr:nth-child(even) td {
                background-color: white;
            }

        .link-button {
            color: midnightblue;
            text-decoration: none;
            font-weight: bold;
            cursor: pointer;
        }

            .link-button:hover {
                text-decoration: underline;
            }

        .footer {
            margin-top: 30px;
            text-align: center;
            color: midnightblue;
        }
    </style>
</head>
<body>
    <script type="text/javascript">
        function Updated() {
            alert("Case status has been updated!");
        }
    </script>
    <form id="form1" runat="server">
        <div class="topnav">
            <a href="LawEnforcement.aspx" class="active"><b>Reported Crimes</b></a>
            <!-- Navigation links (hidden by default) -->
            <div id="myLinks">
                <a href="OfficerCases.aspx">My Cases</a>
                <a href="OfficerStats.aspx">Crime Stats</a>
                <a href="Default.aspx">Sign Out</a>
            </div>
            <!-- "Hamburger menu" / "Bar icon" to toggle the navigation links -->
            <a href="javascript:void(0);" class="icon" onclick="myFunction()">
                <i class="fa fa-bars"></i>
            </a>
        </div>
        <div class="container">
            <h2>Submitted Cases</h2>
            <asp:GridView ID="gvCases" runat="server" AutoGenerateColumns="False" CssClass="grid-view" OnRowCommand="gvCases_RowCommand"
                DataKeyNames="CaseID" AllowSorting="True" OnSorting="gvCases_Sorting">
                <Columns>
                    <asp:BoundField DataField="CrimeType" HeaderText="Crime Type" SortExpression="CrimeType" />
                    <asp:BoundField DataField="Area" HeaderText="Location" SortExpression="Area" />
                    <asp:BoundField DataField="Recency" HeaderText="When" SortExpression="Recency" />
                    <asp:BoundField DataField="ReportDate" HeaderText="Report Date" SortExpression="ReportDate" />
                    <asp:BoundField DataField="Status_" HeaderText="Case Status" />
                    <asp:TemplateField HeaderText="Evidence">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkDownload" runat="server" CommandName="DownloadEvidence" CommandArgument='<%# Eval("CaseID") %>' CssClass="link-button">Download</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="PlaintiffID" HeaderText="Plaintiff ID" />
                    <asp:BoundField DataField="OfficerID" HeaderText="Officer ID" />
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="status-dropdown">
                                <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                <asp:ListItem Text="Under Investigation" Value="Under Investigation"></asp:ListItem>
                                <asp:ListItem Text="Complete" Value="Complete"></asp:ListItem>
                                <asp:ListItem Text="Thrown Out" Value="Thrown Out"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Button ID="btnUpdateStatus" runat="server" Text="Update" CssClass="button-update" CommandName="UpdateStatus"
                                CommandArgument='<%# Container.DataItemIndex %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div style="text-align: center">
            </div>
        </div>
        <div class="footer">
            <p>&copy; 2024 The Community Eye</p>
        </div>
    </form>
</body>
</html>
