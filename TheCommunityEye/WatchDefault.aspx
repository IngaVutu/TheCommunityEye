<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WatchDefault.aspx.cs" Inherits="TheCommunityEye.WatchDefault" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Neighborhood Watch</title>
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

    <main>
        <!-- Welcome Section -->
        <section id="home">
            <h2 style="text-align: center">Welcome to Your Neighborhood Watch</h2>
            <p style="text-align: center">Help us keep our community safe by reporting incidents and staying updated with the latest statistics.</p>
        </section>

        <!-- Statistics Section -->
        <section id="stats" class="stats">
            <div class="stat-item">
                <h3>
                    <asp:Label ID="lblIncidents" runat="server" Text=""></asp:Label>
                </h3>
                <p>Total Incidents Reported</p>
            </div>
            <div class="stat-item">
                <h3 id="active-watches">
                    <asp:Label ID="lblWatchMembers" runat="server" Text=""></asp:Label>
                </h3>
                <p>Neighborhood Watch Members</p>
            </div>
        </section>

        <!-- Report Submission Form -->
        <section id="report">
            <h2 style="text-align: center">Submit a Report</h2>
            <form id="Form1" runat="server">
                <asp:TextBox ID="txtLocation" runat="server" placeholder="Location" required></asp:TextBox>
                <asp:TextBox ID="txtDescription" runat="server" placeholder="Describe the incident" TextMode="MultiLine" required></asp:TextBox>

                <asp:Button ID="btnSubmit" CssClass="cta-button" runat="server" Text="Submit Report" OnClick="btnSubmit_Click" />
            </form>
        </section>
        <div class="footer">
            <p>&copy; 2024 The Community Eye</p>
        </div>
    </main>

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
