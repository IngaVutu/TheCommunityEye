<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="TheCommunityEye.About" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="Styles/About.css" rel="stylesheet" />
    <link href="Styles/Content/bootstrap.css" rel="stylesheet" />
    <link href="Styles/StyleSheet1.css" rel="stylesheet" />
    <title>About Us - The Community Eye</title>

</head>
<body>

    <form id="form1" runat="server">
        <header>
                <div class="row">
                    <div class="col-3" style="display: flex; align-items: center;">
                        <a href="Default.aspx" style="font-size: 20px; align-content: start;">
                            <img src="../Images/Logo.jpg" alt="Company Logo" style="height: 50px; width: 50px; margin-right: 10px;" />
                            The Community Eye
                        </a>
                    </div>
                    <div class="col-7"></div>
                    <div class="col-1">
                        <a href="SignUp.aspx" style="text-align: center; margin-top: 10px">Sign Up</a>
                    </div>
                    <div class="col-1">
                        <a href="SignIn.aspx" style="text-align: center; margin-top: 10px">Sign In</a>
                    </div>
                </div>
            </header>
        <div class="container">
            <header1>
                <h1>About Us</h1>
            </header1>

            <section class="mission">
                <h3 >Our Mission</h3>
                <p style="margin:20px">
                    At <strong>The Community Eye</strong>, we believe that strong communities are built on trust, proactive engagement, and shared responsibility. 
        Our goal is to empower neighborhood watch groups and residents by providing real-time crime updates, seamless communication, and actionable insights.
                </p>
            </section>

            <section class="offerings">
                <h3>What We Offer</h3>
                <ul>
                    <li>Real-Time Crime Information: Stay informed with live updates.</li>
                    <li>Neighborhood Watch Memberships: Join or create watch groups.</li>
                    <li>Payment & Membership Management: Manage memberships and payments securely.</li>
                    <li>Interactive Reporting: View crime trends and safety reports.</li>
                    <li>Community Collaboration: Engage with other members and share updates.</li>
                </ul>
            </section>

            <section class="values">
                <h3>Our Values</h3>
                <ul>
                    <li><strong>Transparency:</strong> Information accessible to everyone.</li>
                    <li><strong>Community-Driven Solutions:</strong> Empowering local efforts.</li>
                    <li><strong>Innovation for Impact:</strong> Adapting to new tools and technologies.</li>
                    <li><strong>Privacy & Security:</strong> Safeguarding user data.</li>
                </ul>
            </section>

            <section class="cta">
                <h3>Join Us Today</h3>
                <p style="margin:20px">
                    Become part of the movement to make neighborhoods safer and more connected. Whether you're a concerned resident or a member of law enforcement, 
        <strong>The Community Eye</strong> is your partner in building a more secure tomorrow.
                </p>
            </section>

            <footer>
                <p>&copy; 2024 The Community Eye. All Rights Reserved.</p>
            </footer>
        </div>
    </form>
</body>
</html>
