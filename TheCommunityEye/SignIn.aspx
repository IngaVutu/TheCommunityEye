<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="TheCommunityEye.SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign In</title>
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
                            <img src="../Images/Logo.jpg" alt="Company Logo" style="height: 50px; width:50px; margin-right: 10px;">
                            The Community Eye
                        </a>
                    </div>
                    <div class="col-8"></div>
                    <div class="col-1">
                        <a href="SignUp.aspx" style="text-align: center; margin-top:10px">Sign Up</a>
                    </div>
                </div>
            </header>

            <div class="main">
                <div class="row" style="padding:20px">
                    <div class="col-4"></div>
                    <div class="col-4">
                        <div class="container m-4 border-0 bg-secondary-subtle rounded-2 p-4">
                            <div class="row mb-2">
                                <div class="col-3"></div>
                                <div class="col-6" style="text-align:center">
                                    <h2 style="font-size: 34px; font-family: 'Lucida Sans'; text-align: center; color: midnightblue">Sign In</h2>
                                </div>
                                <div class="col-3"></div>
                            </div>
                            <div class="row mb-1 mt-2">
                                <div class="col-3"></div>
                                <div class="col-6" style="text-align:center">
                                    <h2 style="font-size: 20px; font-family: 'Lucida Sans'; text-align: center; color: midnightblue">Email</h2>
                                </div>
                                <div class="col-3"></div>
                            </div>
                            <div class="row">
                                <div class="col-3"></div>
                                <div class="col-6">
                                     <asp:Label ID="lblError" runat="server" Text="Incorrect details. Please try again." Visible="false" ForeColor="Red" Font-Bold="true"></asp:Label>
                                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" style="border-radius: 5px" required></asp:TextBox>
                                </div>
                                <div class="col-3"></div>
                            </div>
                            <div class="row mb-1 mt-2">
                                <div class="col-3"></div>
                                <div class="col-6" style="text-align:center">
                                    <h2 style="font-size: 20px; font-family: 'Lucida Sans'; text-align: center; color: midnightblue">Password</h2>
                                </div>
                                <div class="col-3"></div>
                            </div>
                            <div class="row">
                                <div class="col-3"></div>
                                <div class="col-6">
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" style="border-radius: 5px" required></asp:TextBox>
                                </div>
                                <div class="col-3"></div>
                            </div>
                            
                            <div class="row m-4 align-content-center">
                                <div class="col-3"></div>
                                <div class="col-6" style="text-align:center">
                                    <asp:Button ID="btnSignIn" runat="server" OnClick="SignIn_Click" Text="Sign In" ForeColor="White" BackColor="MidnightBlue" Width="100" Height="50" style="border-radius: 16px"/> 
                                </div>
                                <div class="col-3"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-4"></div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
