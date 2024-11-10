<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Statistics.aspx.cs" Inherits="TheCommunityEye.Statistics" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Analytics</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }

        header {
            background-color: midnightblue;
            color: white;
            text-align: center;
            padding: 1rem;
        }

        nav {
            background-color: slateblue;
            padding: 0.5rem;
        }

            nav ul {
                list-style-type: none;
                padding: 0;
                margin: 0;
                display: flex;
                justify-content: center;
            }

                nav ul li {
                    margin: 0 1rem;
                }

                    nav ul li a {
                        color: white;
                        text-decoration: none;
                    }

        main {
            padding: 2rem;
            max-width: 1000px;
            margin: 0 auto;
        }

        .cta-button {
            display: inline-block;
            background-color: #e74c3c;
            color: white;
            padding: 0.7rem 1.5rem;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 1rem;
            transition: background-color 0.3s ease;
        }

            .cta-button:hover {
                background-color: #c0392b;
            }

        .stats {
            display: flex;
            justify-content: space-around;
            margin: 2rem 0;
            text-align: center;
        }

        .stat-item {
            background-color: #3498db;
            color: white;
            padding: 1rem;
            border-radius: 10px;
            width: 30%;
        }

            .stat-item h3 {
                font-size: 2rem;
                margin: 0;
            }

        form {
            background-color: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        input, textarea {
            width: 100%;
            padding: 0.5rem;
            margin-bottom: 1rem;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .chart-container {
            width: 100%;
            max-width: 1000px;
            margin: 2rem auto;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 1rem;
        }

        .chart-title {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 1rem;
            ;
            color: midnightblue;
        }
        .footer {
            margin-top: 30px;
            text-align: center;
            color: midnightblue;
        }
    </style>
</head>
<body>
    <header>
        <h1>Neighborhood Watch Reporting System</h1>
    </header>

    <nav>
        <ul>
            <li><a href="WatchDefault.aspx">Home</a></li>
            <li><a href="WatchProfile.aspx">Members</a></li>
            <li><a href="Statistics.aspx">Statistics</a></li>
            <li><a href="ReportedCases.aspx">Reported Cases</a></li>
            <li><a href="WatchDashboard.aspx">Log Out</a></li>
        </ul>
    </nav>
    <div class="container">
        <main>
            <!-- Welcome Section -->
            <section id="home">
                <h2 style="text-align: center">Crime Analytics</h2>
            </section>
            <section id="graphs">
                <div class="chart-container">
                    <h3 class="chart-title" style="text-align: center">Crime Rate</h3>
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
                <div class="chart-container" style="width: 800px">
                    <h3 class="chart-title" style="text-align: center">Rate By Crime Type</h3>
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
            </section>
            <div class="footer">
                <p>&copy; 2024 The Community Eye</p>
            </div>
        </main>
    </div>

    <script>
        // Placeholder for fetching and updating statistics
        fetch('/api/stats')
            .then(response => response.json())
            .then(data => {
                document.getElementById('total-incidents').textContent = data.totalIncidents;
                document.getElementById('active-watches').textContent = data.activeWatches;
                document.getElementById('community-members').textContent = data.communityMembers;
            });

        // Report submission logic
        document.getElementById('incident-form').addEventListener('submit', function (e) {
            e.preventDefault();
            const location = document.getElementById('incident-location').value;
            const description = document.getElementById('incident-description').value;
            const anonymous = document.getElementById('incident-anonymous').checked;

            // Placeholder for submitting the report (replace with server-side logic)
            console.log({
                location,
                description,
                anonymous
            });
            alert('Report submitted successfully!');
        });
    </script>
</body>
</html>
