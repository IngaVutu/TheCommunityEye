<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminUser.aspx.cs" Inherits="TheCommunityEye.AdminUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Management</title>
    <link href="Styles/StyleSheet5.css" rel="stylesheet" />
    <link href="Styles/Content/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <aside class="sidebar">
                <div class="sidebar-profile">
                    <asp:Label ID="lblUserEmail" runat="server" Font-Size="Large" Text=" "></asp:Label>
                </div>
                <nav>
                    <ul class="sidebar-nav">
                        <li><a href="AdminDashBoard.aspx">Dashboard</a></li>
                        <li><a href="AdminProfile.aspx">Profile</a></li>
                        <li><a href="Graphs.aspx">Graphs</a></li>
                        <li><a href="AdminUser.aspx" class="active">Users</a></li>
                        <li><a href="Default.aspx">Logout</a></li>
                    </ul>
                </nav>
            </aside>

            <main class="main-content">
                <div class="container">
                    <div class="row">
                        <div class="col-2"></div>
                        <div class="col-8">
                            <div class="user-form m-2">
                                <div class="row" style="background-color: midnightblue; border-radius: 10px; padding: 10px">
                                    <h2 class="text-center" style="color: white">Add or Update User</h2>
                                </div>
                                <asp:Label ID="lblMessage" runat="server" Visible="false" CssClass="alert" role="alert"></asp:Label>
                                <div class="form-group">
                                    <asp:Label ID="lblMemberID" runat="server" Text="Member ID"></asp:Label>
                                    <asp:TextBox ID="txtMemberID" runat="server" CssClass="form-control" required></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" required></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblCellNum" runat="server" Text="Cell Number"></asp:Label>
                                    <asp:TextBox ID="txtCellNum" runat="server" TextMode="Phone" CssClass="form-control" required></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" required></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="ddlUserType">User Type</label>
                                    <asp:DropDownList ID="ddlUserType" runat="server" CssClass="form-control">
                                        <asp:ListItem Text="Choose User Type" Value="None"></asp:ListItem>
                                        <asp:ListItem Text="Officer" Value="Officer"></asp:ListItem>
                                        <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                                        <asp:ListItem Text="Member" Value="Member"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="row">
                                    <div class="col-4"></div>
                                    <div class="col-4 mt-2">
                                        <asp:Button ID="btnAddUser" Width="100" CssClass="btn btn-primary btn-block" runat="server" Text="Add User" OnClick="btnAddUser_Click" />
                                        <asp:Button ID="btnUpdateUser" runat="server" Text="Update User" CssClass="btn btn-secondary btn-block" OnClick="btnUpdateUser_Click" />
                                    </div>
                                    <div class="col-4"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-2"></div>
                    </div>
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-10">
                            <div class="user-form m-2">
                                <div class="row" style="background-color: midnightblue; border-radius: 10px; padding: 10px">
                                    <h2 class="text-center" style="color: white">User List</h2>
                                </div>
                                <asp:GridView ID="GridViewUsers" runat="server" CssClass="gridview" AutoGenerateColumns="False" DataKeyNames="MemberID" OnSelectedIndexChanged="GridViewUsers_SelectedIndexChanged">
                                    <Columns>
                                        <asp:BoundField DataField="MemberID" HeaderText="MemberID" ReadOnly="True" SortExpression="MemberID" />
                                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                        <asp:BoundField DataField="CellNum" HeaderText="CellNum" SortExpression="CellNum" />
                                        <asp:BoundField DataField="Password_" HeaderText="Password_" SortExpression="Password_" />
                                        <asp:BoundField DataField="UserType" HeaderText="UserType" SortExpression="UserType" />
                                        <asp:CommandField ShowSelectButton="True" SelectText="Edit" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <div class="col-1"></div>
                    </div>
                </div>
                <div class="footer">
                    <p>&copy; 2024 The Community Eye</p>
                </div>
            </main>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
