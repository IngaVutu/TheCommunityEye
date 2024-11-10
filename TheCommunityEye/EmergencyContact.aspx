<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmergencyContact.aspx.cs" Inherits="TheCommunityEye.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Emergency Contacts</title>
    <link href="Styles/Content/bootstrap.css" rel="stylesheet" />
    <link href="Styles/StyleSheet1.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
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

            <div class="row" style="margin-top: 60px">
                <div class="col-2"></div>
                <div class="col-8" style="align-content: center">
                    <div class="container m-4 border-0" style="background: lightgrey; padding: 10px; padding-left: 20px; border-radius: 7px">
                        <div class="row align-content-center">
                            <div class="col-1"></div>
                            <div class="col-10">
                                <h2 style="color: white; background-color: midnightblue; border-radius: 16px; padding: 15px; text-align: center">KNOW WHO TO DIAL!</h2>
                            </div>
                            <div class="col-1"></div>
                        </div>
                        <div class="row m-4">
                            <div class="col-3"></div>
                            <div class="col-6">
                                <p style="font-size: 22px; color: white; background-color: midnightblue; border-radius: 16px; padding: 15px; text-align: center">Emergency Services</p>
                                <p style="font-size: 18px; font-family: 'Lucida Sans'; text-align: center; color: midnightblue;">Police(SAPS): 10111</p>
                                <p style="font-size: 18px; font-family: 'Lucida Sans'; text-align: center; color: midnightblue;">Ambulance & Fire: 10177</p>
                                <p style="font-size: 22px; color: white; background-color: midnightblue; border-radius: 16px; padding: 15px; text-align: center">Additional Important Numbers</p>
                                <p style="font-size: 18px; font-family: 'Lucida Sans'; text-align: center; color: midnightblue;">Crime Stop: 08600 10111</p>
                                <p style="font-size: 18px; font-family: 'Lucida Sans'; text-align: center; color: midnightblue;">GBV Command Centre: 0800 428 428 (or SMS “help” to 31531)</p>
                                <p style="font-size: 18px; font-family: 'Lucida Sans'; text-align: center; color: midnightblue;">Childline: 08000 55 555</p>
                                <p style="font-size: 18px; font-family: 'Lucida Sans'; text-align: center; color: midnightblue;">Poison Information Centre: 0861 555 777</p>
                                <p style="font-size: 18px; font-family: 'Lucida Sans'; text-align: center; color: midnightblue;">National Traffic Call Centre: 0861 400 800</p>


                            </div>
                            <div class="col-3"></div>
                        </div>
                    </div>
                </div>
                <div class="col-2"></div>
            </div>
            <div class="footer text-white">
                <div class="row">
                    <div class="col-2 m-4" style="text-align: center">
                        <p style="color: white; margin-left: 30px; margin-top: 20px"><a href="About.aspx" style="color: white;">About Us</a></p>
                        <p style="margin-left: 30px; margin-top: 20px">Terms and Conditions Apply</p>
                        <p style="margin-left: 30px">&copy The Community Eye 2024</p>
                    </div>
                    <div class="col-2"></div>
                    <div class="col-3" style="text-align: center">
                        <h4 style="margin-top: 20px">Our Socials</h4>
                        <p>Facebook: The Community Eye SA</p>
                        <p>Instagram: @communityeye_sa</p>
                        <p>X: @thecommunityeye_sa</p>
                        <p>Telephone: 043 3343 443</p>
                    </div>
                    <div class="col-1"></div>
                    <div class="col-3" style="text-align: center">
                        <h4 style="margin-top: 20px">Our Offices</h4>
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
