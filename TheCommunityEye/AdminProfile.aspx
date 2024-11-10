<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminProfile.aspx.cs" Inherits="TheCommunityEye.AdminProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Profile</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: lightgrey;
            font-family: Arial, sans-serif;
        }
        .wrapper {
            display: flex;
        }
        .sidebar {
            width: 250px;
            background-color: #2c3e50;
            color: white;
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
        }
        .sidebar-profile img {
            border-radius: 50%;
            margin-bottom: 10px;
        }
        .sidebar-profile {
            text-align: center;
        }
        .sidebar-nav {
            list-style: none;
            padding: 0;
        }
        .sidebar-nav li {
            margin: 20px 0;
        }
            .sidebar-nav a {
                color: white;
                text-decoration: none;
                display: block;
                padding: 10px;
                border-radius: 5px;
                transition: background-color 0.3s;
            }
        .sidebar-nav a:hover, .sidebar-nav a.active {
            background-color: #34495e;
        }
        .main-content {
            flex-grow: 1;
            padding: 40px;
        }
        .profile-card {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .profile-header {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        .profile-header img {
            border-radius: 50%;
            margin-right: 20px;
        }
        .profile-title h1 {
            color: midnightblue;
        }
        .profile-info {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
        }
        .info-label {
            font-weight: bold;
            color: midnightblue;
        }
        .update-button {
            background-color: midnightblue;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            margin-top: 20px;
        }
        .update-button:hover {
            background-color: #004080;
        }
        .footer {
            margin-top: 30px;
            text-align: center;
            color: midnightblue;
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <!-- Sidebar -->
        <aside class="sidebar">
            <div class="sidebar-profile">
                <img src="/api/placeholder/100/100" alt="Admin Profile" class="profile-image">
                <asp:Label ID="lblEmail" runat="server" Font-Size="Large" Text=" "></asp:Label>
            </div>
            <nav>
                <ul class="sidebar-nav">
                    <li><a href="AdminDashBoard.aspx">Dashboard</a></li>
                    <li><a href="#" class="active">Profile</a></li>
                    <li><a href="Graphs.aspx">Graphs</a></li>
                    <li><a href="AdminUser.aspx">Users</a></li>
                    <li><a href="Default.aspx">Logout</a></li>
                </ul>
            </nav>
        </aside>

        <!-- Main Content -->
        <main class="main-content">
            <div class="container">
                <div class="profile-card">
                    <div class="row align-items-center">
                        <div class="col-4"></div>
                        <div class="col-4" style="text-align:center">
                            <h1 style="color:midnightblue">Admin Profile</h1>
                        </div>
                        <div class="col-4"></div>
                    </div>
                    <!-- Profile Details -->
                    <div class="profile-details">
                        <div class="profile-info">
                            <span class="info-label">Admin ID</span>
                            <asp:Label ID="lblID" runat="server" Text=" " CssClass="info-value"></asp:Label>
                        </div>
                        <div class="profile-info">
                            <span class="info-label">Email</span>
                            <asp:Label ID="lblUserEmail" runat="server" Text=" " CssClass="info-value"></asp:Label>
                        </div>
                        <div class="profile-info">
                            <span class="info-label">Phone</span>
                            <asp:Label ID="lblCell" runat="server" Text=" " CssClass="info-value"></asp:Label>
                        </div>
                        <div class="profile-info">
                            <span class="info-label">Password</span>
                            <asp:Label ID="lblPassword" runat="server" Text=" " CssClass="info-value"></asp:Label>
                        </div>
                        <div class="profile-info">
                            <span class="info-label">Department</span>
                            <div class="info-value">Systems Development</div>
                        </div>
                        <div class="profile-info">
                            <span class="info-label">Location</span>
                            <div class="info-value">East London, EC</div>
                        </div>
                        <div class="profile-info">
                            <span class="info-label">Access Level</span>
                            <div class="info-value">Full Access</div>
                        </div>
                    </div>
                    <div class="row align-items-center">
                        <div class="col-5"></div>
                        <div class="col-2">
                            <button class="update-button" onclick="updateProfile()">Update Profile</button>
                        </div>
                        <div class="col-5"></div>
                    </div>
                </div>
            </div>
            <div class="footer">
                    <p>&copy; 2024 The Community Eye</p>
                </div>
        </main>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        function updateProfile() {
            alert('Update profile functionality would be implemented here.');
        }
    </script>
</body>
</html>
