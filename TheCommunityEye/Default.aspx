<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TheCommunityEye.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device=width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>
        Home|Community Eye
    </title>
    <link href="Styles/Content/bootstrap.css" rel="stylesheet" />
    <link href="Styles/StyleSheet1.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header>
                <div class="row">
                    <div class="col-3" style="display: flex; align-items: center;">
                        <a href="Default.aspx" style="font-size: 20px; align-content:start;">
                            <img src="../Images/Logo.jpg" alt="Company Logo" style="height: 50px; width:50px; margin-right: 10px;"/>
                            The Community Eye
                        </a>
                    </div>
                    <div class="col-7"></div>
                    <div class="col-1">
                        <a href="SignUp.aspx" style="text-align: center; margin-top:10px">Sign Up</a>
                    </div>
                    <div class="col-1">
                        <a href="SignIn.aspx" style="text-align: center; margin-top:10px">Sign In</a>
                    </div>
                </div>
            </header>

            <div class="main">
                <div class="bg-img">
                    <div class="row">
                        <div class="col-2"></div>
                        <div class="col-8">
                            <div class="container m-4 border-0 bg-secondary-subtle rounded-2 opacity-75" style="padding-top:20px">
                                <div class="row mt-4 mb-2" style="margin-top:70px">
                                    <div class="col-1"></div>
                                    <div class="col-10">
                                        <p style="font-size: 34px; font-family: 'Lucida Sans'; font-weight:bold ; text-align: center; color: midnightblue">Welcome to the Community Eye</p>
                                    </div>
                                    <div class="col-1"></div>
                                </div>
                                <div class="row" style="margin-bottom:100px">
                                    <div class="col-1"></div>
                                    <div class="col-10">
                                        <p style="font-size: 22px; font-family: 'Lucida Sans'; text-align: center; color: midnightblue; font-style: italic; font-weight:bold">Modern Tools for Modern Safety!</p>
                                    </div>
                                    <div class="col-1"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-2"></div>
                    </div>
                    <div class="row mt-5 m-lg-2">
                        <p style="font-size: 40px; font-family: 'Lucida Sans'; text-align: left; color: ghostwhite; font-style: italic">Innovation in Safety, Help Us, Help YOU!</p>
                    </div>
                </div>

                <div class="row mt-3 mb-3" style="margin-left:50px">
                    <div class="col-1"></div>
                    <div class="col-3 m-2">
                        <div class="card align-items-center" style="width:340px; text-align:center">
                            <asp:Button ID="btnAnonymous" runat="server" OnClick="btnAnonymous_Click" Text="Report Anonymously" Height="100" Width="300" Font-Size="18" ForeColor="White" BackColor="MidnightBlue" style="border-radius: 16px"/>
                            <div class="container">
                                <p>Did you witness a crime and fear for your safety? Report the crime here anonymously</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-3 m-2">
                        <div class="card align-items-center" style="width:340px; text-align:center">
                            <asp:Button ID="btnWanted" OnClick="btnWanted_Click" runat="server" Text="Neighbourhood Watch" Height="100" Width="300" Font-Size="18" ForeColor="White" BackColor="MidnightBlue" style="border-radius: 16px"/>
                            <div class="container">
                                <p>Want to create a Neighbouhood Watch for your area? We've got you covered</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-3 m-2">
                        <div class="card align-items-center" style="width:340px; text-align:center">
                            <asp:Button ID="btnEmergency" runat="server" OnClick="btnEmergency_Click" Text="Emergency Contacts" Height="100" Width="300" Font-Size="18" ForeColor="White" BackColor="MidnightBlue" style="border-radius: 16px"/>
                            <div class="container">
                                <p>Did you witness a crime and fear for your safety? Report the crime here anonymously</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-2"></div>
                </div>

                <div class="footer text-white">
                    <div class="row">
                        <div class="col-2 m-4" style="text-align:center">
                            <p style="color:white ;margin-left:30px; margin-top:20px"><a href="About.aspx" style="color:white;">About Us</a></p>
                            <p style="margin-left:30px; margin-top:20px">Terms and Conditions Apply</p>
                            <p style="margin-left:30px">&copy The Community Eye 2024</p>
                        </div>
                        <div class="col-2"></div>
                        <div class="col-3" style="text-align:center">
                            <h4 style="margin-top:20px">Our Socials</h4>
                            <p>Facebook: The Community Eye SA</p>
                            <p>Instagram: @communityeye_sa</p>
                            <p>X: @thecommunityeye_sa</p>
                            <p>Telephone: 043 3343 443</p>
                        </div>
                        <div class="col-1"></div>
                        <div class="col-3" style="text-align:center">
                            <h4 style="margin-top:20px">Our Offices</h4>
                            <p>59 St. Marks Road, Southernwood</p>
                            <p>East London, Eastern Cape</p>
                            <p>South Africa</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
