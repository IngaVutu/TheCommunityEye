<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="TheCommunityEye.Sign_Up" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
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
                            <img src="../Images/Logo.jpg" alt="Company Logo" style="height:50px; width:50px; margin-right: 10px;">
                            The Community Eye
                        </a>
                    </div>
                    <div class="col-8"></div>

                    <div class="col-1">
                        <a href="SignIn.aspx" style="text-align: center; margin-top:10px">Sign In</a>
                    </div>
                </div>
            </header>

            <div class="main">
                <div class="row" style="padding: 20px">
                    <div class="col-4"></div>
                    <div class="col-4">
                        <div class="container m-4 border-0 bg-secondary-subtle rounded-2 p-4">
                            <div class="row mb-2">
                                <div class="col-3"></div>
                                <div class="col-6" style="text-align: center">
                                    <h2 style="font-size: 34px; font-family: 'Lucida Sans'; text-align: center; color: midnightblue">Sign Up</h2>
                                </div>
                                <div class="col-3"></div>
                            </div>
                            <div class="row mb-1 mt-2">
                                <div class="col-3"></div>
                                <div class="col-6" style="text-align: center">
                                    <h2 style="font-size: 20px; font-family: 'Lucida Sans'; text-align: center; color: midnightblue">ID Number</h2>
                                </div>
                                <div class="col-3"></div>
                            </div>
                            <div class="row">
                                <div class="col-3"></div>
                                <div class="col-6" style="text-align: center">
                                    <asp:Label ID="lblIDError" runat="server" Text="Incorrect input, ID Number must be 13 digits." Visible="false" Font-Size="9" ForeColor="Red" Font-Bold="true"></asp:Label>
                                    <asp:TextBox ID="txtID" runat="server" MaxLength="13" Style="border-radius: 5px" required></asp:TextBox>
                                </div>
                                <div class="col-3"></div>
                            </div>
                            <div class="row mb-1 mt-2">
                                <div class="col-3"></div>
                                <div class="col-6" style="text-align: center">
                                    <h2 style="font-size: 20px; font-family: 'Lucida Sans'; text-align: center; color: midnightblue">Email</h2>
                                </div>
                                <div class="col-3"></div>
                            </div>
                            <div class="row">
                                <div class="col-3"></div>
                                <div class="col-6" style="text-align: center">
                                    <asp:Label ID="lblEmailError" runat="server" Text="Please enter a valid email address (e.g., example@example.com)." Font-Size="9" Visible="false" ForeColor="Red" Font-Bold="true"></asp:Label>
                                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" Style="border-radius: 5px" required></asp:TextBox>
                                </div>
                                <div class="col-3"></div>
                            </div>
                            <div class="row mb-1 mt-2">
                                <div class="col-3"></div>
                                <div class="col-6" style="text-align: center">
                                    <h2 style="font-size: 20px; font-family: 'Lucida Sans'; text-align: center; color: midnightblue">Cellphone Number</h2>
                                </div>
                                <div class="col-3"></div>
                            </div>
                            <div class="row">
                                <div class="col-3"></div>
                                <div class="col-6" style="text-align: center">
                                    <asp:Label ID="lblCellError" runat="server" Text="Please enter a valid contact number." Visible="false" Font-Size="9" ForeColor="Red" Font-Bold="true"></asp:Label>
                                    <asp:TextBox ID="txtCell" runat="server" TextMode="Phone" MaxLength="10" Style="border-radius: 5px" required></asp:TextBox>
                                </div>
                                <div class="col-3"></div>
                            </div>
                            <div class="row mb-1 mt-2">
                                <div class="col-3"></div>
                                <div class="col-6" style="text-align: center">
                                    <h2 style="font-size: 20px; font-family: 'Lucida Sans'; text-align: center; color: midnightblue">Password</h2>
                                </div>
                                <div class="col-3"></div>
                            </div>
                            <div class="row">
                                <div class="col-3"></div>
                                <div class="col-6" style="text-align: center">
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Style="border-radius: 5px" required></asp:TextBox>
                                </div>
                                <div class="col-3"></div>
                            </div>
                            <div class="row mb-1 mt-2">
                                <div class="col-3"></div>
                                <div class="col-6" style="text-align: center">
                                    <h2 style="font-size: 20px; font-family: 'Lucida Sans'; text-align: center; color: midnightblue">Confirm Password</h2>
                                </div>
                                <div class="col-3"></div>
                            </div>
                            <div class="row">
                                <div class="col-3"></div>
                                <div class="col-6" style="text-align: center">
                                    <asp:Label ID="lblPasswordError" runat="server" Text="Passwords do not match." Visible="false" Font-Size="9" ForeColor="Red" Font-Bold="true"></asp:Label>
                                    <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password" Style="border-radius: 5px" required></asp:TextBox>
                                </div>
                                <div class="col-3"></div>
                            </div>
                            <div class="row m-4 align-content-center">
                                <div class="col-1"></div>
                                <div class="col-4" style="text-align: center">
                                    <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" OnClick="btnSignUp_Click" ForeColor="White" BackColor="MidnightBlue" Width="100" Height="50" Style="border-radius: 16px" />
                                </div>
                                <div class="col-2"></div>
                                <div class="col-4" style="text-align: center">
                                    <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClears_Click" ForeColor="White" BackColor="MidnightBlue" Width="100" Height="50" Style="border-radius: 16px" />
                                </div>

                                <div class="col-1"></div>
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
