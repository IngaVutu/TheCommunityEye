<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WatchLogin.aspx.cs" Inherits="TheCommunityEye.WatchLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Log In</title>
    <style>
        :root {
            --primary: #3B82F6;
            --primary-dark: #1D4ED8;
            --secondary: #10B981;
            --background: #F3F4F6;
            --card: #FFFFFF;
            --text: #1F2937;
            --border: #E5E7EB;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
        }

        body {
            background-color: var(--background);
            background-image: radial-gradient(circle at 10% 20%, rgb(239, 246, 255) 0%, rgb(219, 234, 254) 90.1%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
        }

        .registration-container {
            width: 100%;
            max-width: 1200px;
            display: grid;
            grid-template-columns: 1fr 1.5fr;
            background: var(--card);
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.15);
            animation: fadeIn 1s ease-out;
        }

        .info-section {
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            color: white;
            padding: 3rem;
            position: relative;
            overflow: hidden;
        }

            .info-section::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: none;
                opacity: 0.1;
                z-index: 0;
            }

        .info-content {
            position: relative;
            z-index: 1;
        }

        .info-section h1 {
            font-size: 2.5rem;
            margin-bottom: 1.5rem;
            font-weight: 700;
        }

        .info-section p {
            font-size: 1.1rem;
            margin-bottom: 2rem;
            opacity: 0.9;
            line-height: 1.6;
        }

        .benefits-list {
            list-style: none;
        }

            .benefits-list li {
                display: flex;
                align-items: center;
                gap: 1rem;
                margin-bottom: 1rem;
                font-size: 1.1rem;
            }

        .check-icon {
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            padding: 0.5rem;
        }

        .form-section {
            padding: 3rem;
            background: var(--card);
        }

            .form-section h2 {
                color: var(--text);
                margin-bottom: 2rem;
                font-size: 1.8rem;
            }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

            .form-group.full-width {
                grid-column: 1 / -1;
            }

        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            color: var(--text);
            font-weight: 500;
        }

        .form-control {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 2px solid var(--border);
            border-radius: 10px;
            font-size: 1rem;
            transition: all 0.3s;
        }

            .form-control:focus {
                outline: none;
                border-color: var(--primary);
                box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
            }

        .asp-button {
            background: var(--primary);
            color: white;
            padding: 1rem 2rem;
            border: none;
            border-radius: 10px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            width: 100%;
            transition: all 0.3s;
        }

            .asp-button:hover {
                background: var(--primary-dark);
                transform: translateY(-2px);
                box-shadow: 0 10px 20px -10px rgba(59, 130, 246, 0.5);
            }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @media (max-width: 1024px) {
            .registration-container {
                grid-template-columns: 1fr;
            }

            .info-section {
                padding: 2rem;
            }
        }

        .progress-indicator {
            display: flex;
            justify-content: space-between;
            margin-bottom: 2rem;
        }

        .step {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--text);
            opacity: 0.5;
        }

            .step.active {
                opacity: 1;
                color: var(--primary);
            }

        .step-number {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background: var(--background);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
        }

        .step.active .step-number {
            background: var(--primary);
            color: white;
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

        .footer {
            margin-top: 30px;
            text-align: center;
            color: midnightblue;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header style="border-radius: 10px">
            <h1>Neighborhood Watch Reporting System</h1>
        </header>
        <nav style="border-radius: 10px; margin-bottom: 5px">
            <ul>
                <li><a href="Default.aspx">Home</a></li>
                <li><a href="Report.aspx">Report Incident</a></li>
                <li><a href="WatchHome.aspx">Register Watch</a></li>
                <li><a href="WatchLogin.aspx">Log In</a></li>
            </ul>
        </nav>

        <div class="registration-container">
            <div class="info-section">
                <div class="info-content">
                    <h1>Join Our Community Watch Network</h1>
                    <p>Create a safer neighborhood by registering your watch group. Together, we can make a difference in our community's safety and well-being.</p>

                    <ul class="benefits-list">
                        <li>
                            <span class="check-icon">✓</span>
                            Access to real-time incident reporting
                        </li>
                        <li>
                            <span class="check-icon">✓</span>
                            Direct communication with law enforcement
                        </li>
                        <li>
                            <span class="check-icon">✓</span>
                            Community alert system
                        </li>
                        <li>
                            <span class="check-icon">✓</span>
                            Monthly safety reports and analytics
                        </li>
                    </ul>
                </div>
            </div>

            <div class="form-section">
                <h2 style="text-align: center">Log In to Watch</h2>

                <div class="form-grid">
                    <div class="form-group full-width">
                        <asp:Label ID="lblEmail" runat="server" Text="Email Address" CssClass="form-label" />
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" placeholder="Enter email address" required />
                    </div>

                    <div class="form-group full-width">
                        <asp:Label ID="lblPassError" runat="server" Text="" Font-Size="9" ForeColor="Red" Font-Bold="true" />
                        <asp:Label ID="lblPassword" runat="server" Text="Password" CssClass="form-label" />
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Create a password" required />
                    </div>
                    <div class="form-group full-width">
                        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="asp-button" OnClick="btnLogin_Click" />
                    </div>
                    <div class="form-group full-width" style="text-align: center">
                        <a href="WatchHome.aspx" style="color: blue">Register a Watch</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <p>&copy; 2024 The Community Eye</p>
        </div>
    </form>
</body>
</html>
