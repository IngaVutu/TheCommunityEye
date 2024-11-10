<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error404.aspx.cs" Inherits="TheCommunityEye.ErrorPages.Error404" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>404 - Page Not Found</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f3f3f3; text-align: center; padding: 50px; }
        .error-message { font-size: 24px; color: #333; }
        a { color: #007acc; text-decoration: none; }
    </style>
</head>
<body>
    <div class="error-message">
        <img src="../Images/person.png" height="150" width="150"/>
        <h1>404 - Page Not Found</h1>
        <p>Sorry, the page you are looking for does not exist.</p>
        <p><a href="../Default.aspx">Go back to the homepage</a></p>
    </div>
</body>
    <%--<link href="../Styles/Content/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="align-content-center" style="text-align:center; margin-top:200px; margin-bottom:200px">
            <img src="../Images/person.png" height="200" width="200"/>
           <h1>
               Couldn't find that page...
           </h1>
            <p><a href="~/Default.aspx">Go back to the homepage</a></p>
        </div>
    </form>
</body>--%>
</html>
