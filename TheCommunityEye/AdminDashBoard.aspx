<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashBoard.aspx.cs" Inherits="TheCommunityEye.AdminDashBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Neighborhood Watch|Admin Dashboard</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
    <link href="Styles/StyleSheet4.css" rel="stylesheet" />
    <style>
        .footer {
            margin-top: 30px;
            text-align: center;
            color: midnightblue;
        }
    </style>
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
                    <li><a href="#" class="active">Dashboard</a></li>
                    <li><a href="AdminProfile.aspx">Profile</a></li>
                    <li><a href="Graphs.aspx">Graphs</a></li>
                    <li><a href="AdminUser.aspx">Users</a></li>
                    <li><a href="Default.aspx">Logout</a></li>
                </ul>
            </nav>
        </aside>
        
        <main class="main-content">
            <div class="container">
                <h1>Admin Dashboard</h1>
                
                <div class="stats">
                    <div class="stat-card">
                        <h3 style="margin-bottom:10px; font-weight:bold">Total Watches</h3>
                        <asp:Label ID="lblTotalWatches" runat="server" Font-Size="X-Large" Text=" " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="stat-card">
                        <h3 style="margin-bottom:10px; font-weight:bold">Total Users</h3>
                        <asp:Label ID="lblUsers" runat="server" Font-Size="X-Large" Text=" " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="stat-card">
                        <h3 style="margin-bottom:10px; font-weight:bold">Monthly Reports</h3>
                        <asp:Label ID="lblMonthlyReports" runat="server" Font-Size="X-Large" Text=" " Font-Bold="true" ></asp:Label>
                    </div>
                </div>

                <div class="graph-container1">
                    <div class="graph1">
                        <canvas id="weeklyHistogram"></canvas>
                    </div>
                    <div class="graph1">
                        <canvas id="monthlyLineGraph"></canvas>
                    </div>
                </div>

                <div class="tabs">
                    <asp:Button ID="btnWatches" runat="server" Text="Neighborhood Watches" class="tab" Enabled="false" OnClick="btnWatches_Clicked"/>
                    <asp:Button ID="btnCrimes" runat="server" Text="Reported Crimes" class="tab" OnClick="btnCrimes_Clicked"/>
                </div>
                
                <div id="watches" class="tab-content active">
                    <h2>Neighborhood Watch Records</h2>
                    
                    <asp:GridView ID="gvWatches" runat="server" CssClass="gridview" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" >
                            <Columns>
                                <asp:BoundField DataField="WatchName" HeaderText="WatchName" SortExpression="WatchName" />
                                <asp:BoundField DataField="AdminName" HeaderText="AdminName" SortExpression="AdminName" />
                                <asp:BoundField DataField="CreatedDate" HeaderText="CreatedDate" SortExpression="CreatedDate" />
                                <asp:BoundField DataField="Members" HeaderText="Members" SortExpression="Members" />
                            </Columns>
                    </asp:GridView>

                    <asp:GridView ID="gvCrimes" runat="server" CssClass="gridview" AutoGenerateColumns="False" DataKeyNames="CaseID" DataSourceID="SqlDataSource2">
                        <Columns>
                            <asp:BoundField DataField="CaseID" HeaderText="CaseID" InsertVisible="False" ReadOnly="True" SortExpression="CaseID" />
                            <asp:BoundField DataField="PlaintiffID" HeaderText="PlaintiffID" SortExpression="PlaintiffID" />
                            <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" />
                            <asp:BoundField DataField="Status_" HeaderText="Status_" SortExpression="Status_" />
                            <asp:BoundField DataField="ReportDate" HeaderText="ReportDate" SortExpression="ReportDate" />
                            <asp:BoundField DataField="CrimeType" HeaderText="CrimeType" SortExpression="CrimeType" />
                        </Columns>

                    </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CommunityEye %>" SelectCommand="SELECT [CaseID], [PlaintiffID], [Area], [Status_], [ReportDate], [CrimeType] FROM [CrimeCase]"></asp:SqlDataSource>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CommunityEye %>" SelectCommand="SELECT [WatchName], [AdminName], [CreatedDate], [Members] FROM [Watch]"></asp:SqlDataSource>

                </div>
                
                <div id="crimes" class="tab-content">
                    <h2>Reported Crimes</h2>
                    <div class="search-bar">
                        <input type="text" placeholder="Search crimes...">
                        <button>Search</button>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Type</th>
                                <th>Location</th>
                                <th>Date</th>
                                <th>Reported By</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Theft</td>
                                <td>123 Main St</td>
                                <td>2024-09-05</td>
                                <td>Anonymous</td>
                                <td>Under Investigation</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Vandalism</td>
                                <td>456 Oak Ave</td>
                                <td>2024-09-07</td>
                                <td>Alice Brown</td>
                                <td>Resolved</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Suspicious Activity</td>
                                <td>789 Pine Rd</td>
                                <td>2024-09-09</td>
                                <td>Anonymous</td>
                                <td>Pending Review</td>
                            </tr>
                        </tbody>
                    </table>
                    <a href="#" class="add-button">Report New Crime</a>
                </div>
            </div>
            <div class="footer">
                <p>&copy; 2024 The Community Eye</p>
            </div>
        </main>
    </div>

    <script>
        function openTab(evt, tabName) {
            var i, tabContent, tabLinks;
            tabContent = document.getElementsByClassName("tab-content");
            for (i = 0; i < tabContent.length; i++) {
                tabContent[i].style.display = "none";
            }
            tabLinks = document.getElementsByClassName("tab");
            for (i = 0; i < tabLinks.length; i++) {
                tabLinks[i].className = tabLinks[i].className.replace(" active", "");
            }
            document.getElementById(tabName).style.display = "block";
            evt.currentTarget.className += " active";
        }

        // Weekly Histogram
        var weeklyCtx = document.getElementById('weeklyHistogram').getContext('2d');
        var weeklyChart = new Chart(weeklyCtx, {
            type: 'bar',
            data: {
                labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
                datasets: [{
                    label: 'Theft',
                    data: [12, 19, 3, 5, 2, 3, 7],
                    backgroundColor: 'rgba(255, 99, 132, 0.5)'
                }, {
                    label: 'Vandalism',
                    data: [2, 3, 20, 5, 1, 4, 2],
                    backgroundColor: 'rgba(54, 162, 235, 0.5)'
                }, {
                    label: 'Suspicious Activity',
                    data: [3, 10, 13, 15, 22, 30, 23],
                    backgroundColor: 'rgba(255, 206, 86, 0.5)'
                }]
            },
            options: {
                responsive: true,
                scales: {
                    x: {
                        stacked: true,
                    },
                    y: {
                        stacked: true
                    }
                },
                plugins: {
                    title: {
                        display: true,
                        text: 'Weekly Crime Report by Type'
                    }
                }
            }
        });

        // Monthly Line Graph
        var monthlyCtx = document.getElementById('monthlyLineGraph').getContext('2d');
        var monthlyChart = new Chart(monthlyCtx, {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                datasets: [{
                    label: 'Reported Crimes',
                    data: [65, 59, 80, 81, 56, 55, 40, 30, 45, 60, 70, 75],
                    borderColor: 'rgb(255, 99, 132)',
                    tension: 0.1
                }, {
                    label: 'Pending',
                    data: [28, 48, 40, 19, 86, 27, 90, 60, 30, 40, 50, 45],
                    borderColor: 'rgb(54, 162, 235)',
                    tension: 0.1
                }, {
                    label: 'Under Investigation',
                    data: [80, 50, 55, 60, 70, 65, 75, 80, 90, 100, 110, 120],
                    borderColor: 'rgb(255, 206, 86)',
                    tension: 0.1
                }, {
                    label: 'Solved',
                    data: [20, 30, 25, 35, 40, 45, 50, 55,],
                    borderColor: 'rgb(255, 206, 86)',
                    tension: 0.1
                }
            }
        });
    </script>
    </form>
