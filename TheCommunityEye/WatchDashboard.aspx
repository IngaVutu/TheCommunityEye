<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WatchDashboard.aspx.cs" Inherits="TheCommunityEye.WatchDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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

        .home-section {
            background-image: url(Images/WatchBackground.jpg);
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            padding: 50px;
            color: #fff;
            position: relative;
            min-height: 30vh;
        }

            .home-section::before {
                content: '';
                position: absolute;
                top: 0;
                right: 0;
                bottom: 0;
                left: 0;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 1;
            }

            .home-section h2,
            .home-section p {
                position: relative;
                z-index: 2;
                text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
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
            <li><a href="Default.aspx">Home</a></li>
            <li><a href="Report.aspx">Report Incident</a></li>
            <li><a href="WatchHome.aspx">Register Watch</a></li>
            <li><a href="WatchLogin.aspx">Log In</a></li>
        </ul>
    </nav>
    <main>
        <section id="home" class="home-section">
            <h2>Welcome to Our Community Safety Initiative</h2>
            <p>Our Neighborhood Watch Reporting System empowers residents to contribute to the safety and security of our community. By working together, we can create a safer environment for everyone.</p>
        </section>

        <section id="stats" class="stats">
            <div class="stat-item">
                <asp:Label ID="lblIncidents" runat="server" Text="" Font-Size="XX-Large" Font-Bold="true"></asp:Label>
                <p>Total Incidents Reported</p>
            </div>
            <div class="stat-item">
                <asp:Label ID="lblTotalWatches" runat="server" Text="" Font-Size="XX-Large" Font-Bold="true"></asp:Label>
                <p>Active Neighborhood Watches</p>
            </div>
            <div class="stat-item">
                <asp:Label ID="lblUsers" runat="server" Text="" Font-Size="XX-Large" Font-Bold="true"></asp:Label>
                <p>Members</p>
            </div>
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

        // Placeholder for incident reporting
        document.getElementById('incident-form').addEventListener('submit', function (e) {
            e.preventDefault();
            // Add code to submit the incident report
        });

        // Placeholder for watch registration
        document.getElementById('register-form').addEventListener('submit', function (e) {
            e.preventDefault();
            // Add code to submit the watch registration
        });
    </script>
</body>
</html>
