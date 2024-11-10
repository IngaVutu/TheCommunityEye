<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Graphs.aspx.cs" Inherits="TheCommunityEye.Graphs" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Analytics</title>
    <link href="Styles/StyleSheet4.css" rel="stylesheet" />
    <style>
        .footer {
            margin-top: 30px;
            text-align: center;
            color: midnightblue;
        }
    </style>
    <link href="Styles/Content/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <aside class="sidebar">
                <div class="sidebar-profile">
                    <img src="/api/placeholder/100/100" alt="Admin Profile" class="profile-image">
                    <asp:Label ID="lblEmail" runat="server" Font-Size="Large" Text=" "></asp:Label>
                </div>
                <nav>
                    <ul class="sidebar-nav">
                        <li><a href="AdminDashBoard.aspx">Dashboard</a></li>
                        <li><a href="AdminProfile.aspx">Profile</a></li>
                        <li><a href="#" class="active">Graphs</a></li>
                        <li><a href="AdminUser.aspx">Users</a></li>
                        <li><a href="Default.aspx">Logout</a></li>
                    </ul>
                </nav>
            </aside>
            <main class="main-content">
                <div class="container">
                    <h1>Crime Statistics 2024</h1>

                    <div class="row graph-container" style="background-color:darkgrey">
                        <div class="col-1"></div>
                        <div class="col-10">
                            <h2>Crime Rate by Month</h2>
                            <asp:Chart ID="crimeChart1" runat="server" Width="974px" Height="400px">
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
                        <div class="col-1"></div>
                    </div>


                    <div class="row graph-container" style="background-color:darkgrey">
                        <h2>Crime by Type</h2>
                        <div class="col-2"></div>
                        <div class="col-9">
                            <asp:Chart ID="crimeChart" runat="server" CssClass="graph" Width="811px">
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

                    <div class="row graph-container">
                        <h2>Case Status Comparison</h2>
                        <div class="col-2"></div>
                        <div class="col-9">
                            <asp:Chart ID="caseStatusChart" runat="server" CssClass="graph" Width="811px">
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
            </main>
        </div>
    </form>
</body>
</html>
