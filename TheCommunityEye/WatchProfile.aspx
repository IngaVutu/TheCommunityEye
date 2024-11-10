<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WatchProfile.aspx.cs" Inherits="TheCommunityEye.WatchProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Watch Member Management</title>
    <link href="Styles/Content/bootstrap.css" rel="stylesheet" />
    <link href="Styles/WatchProfile.css" rel="stylesheet" />
    <link href="Styles/StyleSheet5.css" rel="stylesheet" />
    <style>
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
    <script src="Scripts/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        function validateUserType() {
            var userType = document.getElementById('<%= ddlUserType.ClientID %>').value;
            if (userType === "None") {
                alert("Please select a valid user type.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
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
        <main class="main-content">
            <div class="container">
                <h2 style="text-align: center">Welcome to the User Management Portal</h2>
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="user-form m-2">
                            <div class="row" style="background-color: midnightblue; border-radius: 10px; height: 40px; margin-bottom: 10px">
                                <h2 class="text-center" style="color: white">Add or Update User</h2>
                            </div>
                            <asp:Label ID="lblMessage" runat="server" Visible="false" CssClass="alert" role="alert"></asp:Label>
                            <div class="form-group">
                                <asp:Label ID="lblMemberName" runat="server" Text="Member Name"></asp:Label>
                                <asp:TextBox ID="txtMemberName" runat="server" CssClass="form-control" required></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" required></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" required></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="ddlUserType">User Type</label>
                                <asp:DropDownList ID="ddlUserType" runat="server" CssClass="form-control" required>
                                    <asp:ListItem Text="Choose User Type" Value="None"></asp:ListItem>
                                    <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                                    <asp:ListItem Text="Member" Value="Member"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="row">
                                <div class="col-3"></div>
                                <div class="col-6 mt-2">
                                    <asp:Button ID="btnAddUser" Width="120" CssClass="btn btn-primary btn-block" runat="server" Text="Add User" OnClick="btnAddUser_Click" OnClientClick="return validateUserType();" />
                                    <asp:Button ID="btnUpdateUser" runat="server" Text="Update User" Width="120" CssClass="btn btn-primary btn-block" OnClick="btnUpdateUser_Click" OnClientClick="return validateUserType();" Visible="false" />
                                </div>
                                <div class="col-3"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-2"></div>
                </div>

                <div class="row">
                    <div class="col-1"></div>
                    <div class="col-10">
                        <div class="row" style="background-color: midnightblue; border-radius: 10px; height: 40px">
                            <h2 style="text-align: center; color: white">User List</h2>
                        </div>
                        <div class="row" style="border-radius: 10px; align-content: center">
                            <div class="col-12">
                                <asp:GridView ID="GridViewUsers" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="False" DataKeyNames="MemberID" OnSelectedIndexChanged="GridViewUsers_SelectedIndexChanged">
                                    <Columns>
                                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                        <asp:BoundField DataField="MemberName" HeaderText="Member Name" SortExpression="MemberName" />
                                        <asp:BoundField DataField="Password_" HeaderText="Password" SortExpression="Password_" />
                                        <asp:BoundField DataField="Role_" HeaderText="Role" SortExpression="Role_" />
                                        <asp:CommandField ShowSelectButton="True" SelectText="Edit" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Button ID="btnRemoveUser" runat="server" Text="Remove" CssClass="btn btn-danger btn-sm" OnClick="btnRemoveUser_Click" OnClientClick="return confirm('Are you sure you want to remove this user?');" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                    <div class="col-1"></div>
                </div>
            </div>
            <div class="footer">
                <p>&copy; 2024 The Community Eye</p>
            </div>
        </main>
    </form>
</body>
</html>
