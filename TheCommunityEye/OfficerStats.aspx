<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OfficerStats.aspx.cs" Inherits="TheCommunityEye.OfficerStats" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Analytics</title>
    <link href="Styles/StyleSheet2.css" rel="stylesheet" />
    <link href="Styles/StyleSheet4.css" rel="stylesheet" />
    <link href="Styles/Content/bootstrap.css" rel="stylesheet" />
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

        /*.container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }*/

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
            <a href="#" class="active"><b>Crime Stats</b></a>

            <div id="myLinks">
                <a href="LawEnforcement.aspx">Reported Cases</a>
                <a href="OfficerCases.aspx">My Cases</a>
                <a href="Default.aspx">Sign Out</a>
            </div>
            <!-- "Hamburger menu" / "Bar icon" to toggle the navigation links -->
            <a href="javascript:void(0);" class="icon" onclick="myFunction()">
                <i class="fa fa-bars"></i>
            </a>
        </div>
        <div class="container">
            <h1>Crime Statistics</h1>

            <div class="row graph-container" style="background-color: darkgrey">
                <div class="col-2"></div>
                <div class="col-8">
                    <h2>Crime Rate by Month</h2>
                    <asp:Chart ID="crimeChart1" runat="server" Width="850" Height="400px">
                        <Series>
                            <asp:Series Name="Crimes" ChartType="Line" Color="Red"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="MainChartArea">
                                <AxisX>
                                    <MajorGrid Enabled="False" />
                                    <MinorGrid Enabled="False" />
                                </AxisX>
                                <AxisY>
                                    <MajorGrid Enabled="False" />
                                    <MinorGrid Enabled="False" />
                                </AxisY>
                            </asp:ChartArea>
                        </ChartAreas>
                        <Legends>
                            <asp:Legend Name="Legend1" Title="Crime Rate"></asp:Legend>
                        </Legends>
                    </asp:Chart>
                </div>
                <div class="col-2"></div>
            </div>


            <div class="row graph-container" style="background-color: darkgrey">
                <h2>Crime by Type</h2>
                <div class="col-2"></div>
                <div class="col-9">
                    <asp:Chart ID="crimeChart" runat="server" CssClass="graph" Width="850px">
                        <Series>
                            <asp:Series Name="Cases"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="MainChartArea">
                                <AxisX>
                                    <MajorGrid Enabled="False" />
                                    <MinorGrid Enabled="False" />
                                </AxisX>
                                <AxisY>
                                    <MajorGrid Enabled="False" />
                                    <MinorGrid Enabled="False" />
                                </AxisY>
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                </div>
                <div class="col-1"></div>
            </div>

            <div class="row graph-container" style="background-color: darkgrey">
                <h2>Case Status Comparison</h2>
                <div class="col-2"></div>
                <div class="col-9">
                    <asp:Chart ID="caseStatusChart" runat="server" CssClass="graph" Width="850px">
                        <Series>
                            <asp:Series Name="CaseStatus" ChartType="Pie"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="MainChartArea">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                </div>
                <div class="col-1"></div>
            </div>
        </div>
        <div class="footer">
            <p>&copy; 2024 The Community Eye</p>
        </div>
    </form>
</body>
