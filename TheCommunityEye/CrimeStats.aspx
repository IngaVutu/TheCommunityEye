<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CrimeStats.aspx.cs" Inherits="TheCommunityEye.CrimeStats" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Neighbourhood Watches</title>
    <link href="Styles/StyleSheet2.css" rel="stylesheet" />
    <link href="Styles/StyleSheet3.css" rel="stylesheet" />
    <link href="Styles/StyleSheet1.css" rel="stylesheet" />
    <link href="Styles/Content/bootstrap.css" rel="stylesheet" />
    <script src="Styles/JavaScript.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style>
        .centered-grid {
            margin: 0 auto;
            border-collapse: collapse;
            width: 80%; /* Adjust this value as needed */
        }

        .centered-cell {
            text-align: center;
            vertical-align: middle;
        }

        .centered-grid th, .centered-grid td {
            padding: 8px;
            border: 1px solid #ddd;
        }

        .centered-grid th {
            background-color: midnightblue;
            font-weight: bold;
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
                <a href="CrimeStats.aspx" class="active"><b>Neighborhood Watch</b></a>
                <!-- Navigation links (hidden by default) -->
                <div id="myLinks">
                    <a href="ReportCrimes.aspx">Report Crime</a>
                    <a href="MyCases.aspx">My Cases</a>
                    <a href="Default.aspx">Sign Out</a>
                </div>
                <!-- "Hamburger menu" / "Bar icon" to toggle the navigation links -->
                <a href="javascript:void(0);" class="icon" onclick="myFunction()">
                    <i class="fa fa-bars"></i>
                </a>
            </div>

            <div class="body" style="background-color: lightgray">
                <div class="container" style="text-align: center">
                    <h2>Neighborhood Watches</h2>
                    <asp:GridView ID="gvWatches" runat="server" AutoGenerateColumns="False" OnRowCommand="gvWatches_RowCommand" CssClass="centered-grid">
                        <Columns>
                            <asp:BoundField DataField="WatchID" HeaderText="Watch ID" SortExpression="WatchID" ItemStyle-CssClass="centered-cell" HeaderStyle-CssClass="centered-cell" />
                            <asp:BoundField DataField="WatchName" HeaderText="WatchName" SortExpression="WatchName" ItemStyle-CssClass="centered-cell" HeaderStyle-CssClass="centered-cell" />
                            <asp:BoundField DataField="AdminName" HeaderText="AdminName" SortExpression="AdminName" ItemStyle-CssClass="centered-cell" HeaderStyle-CssClass="centered-cell" />
                            <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" ItemStyle-CssClass="centered-cell" HeaderStyle-CssClass="centered-cell" />
                            <asp:TemplateField ItemStyle-CssClass="centered-cell" HeaderStyle-CssClass="centered-cell">
                                <ItemTemplate>
                                    <asp:Button ID="btnJoin" runat="server" Text="Join" CommandName="Join" CommandArgument='<%# Eval("WatchID") %>' />
                                    <asp:Button ID="btnView" runat="server" Text="View" CommandName="View" CommandArgument='<%# Eval("WatchID") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div class="footerr">
                <p>&copy; 2024 The Community Eye</p>
            </div>
        </div>
    </form>
</body>
</html>
