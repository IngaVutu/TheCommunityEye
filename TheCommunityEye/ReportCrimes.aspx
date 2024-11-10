<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportCrimes.aspx.cs" Inherits="TheCommunityEye.ReportCrimes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device=width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Report A Crime</title>
    <link href="Styles/StyleSheet2.css" rel="stylesheet" />
    <link href="Styles/StyleSheet3.css" rel="stylesheet" />
    <script src="Styles/JavaScript.js"></script>
    <link href="Styles/Content/bootstrap.css" rel="stylesheet" />
    <script src="Styles/Scripts/bootstrap.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style>
        .rounded-textbox {
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 10px;
            width: 200px;
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
        <div>
            <script type="text/javascript">
                function submissionAcknowledgement() {
                    alert("Thank you for your submission! Your information has been successfully submitted.");
                }
                function submitEvidence() {
                    alert("You are required to select file type");
                }
                function submitDescription() {
                    alert("You are required to describe the crime");
                }
                function selectOptions() {
                    alert("You are required to select crime information");
                }
            </script>
            <div class="topnav">
                <a href="ReportCrimes.aspx" class="active"><b>Report Crime</b></a>
                <div id="myLinks">
                    <a href="MyCases.aspx">My Cases</a>
                    <a href="CrimeStats.aspx">Neighborhood Watch</a>
                    <a href="Default.aspx">Sign Out</a>
                </div>
                <a href="javascript:void(0);" class="icon" onclick="myFunction()">
                    <i class="fa fa-bars"></i>
                </a>
            </div>

            <div class="body row" style="background-color: lightgray">
                <asp:Label ID="lblID" runat="server" Text="Label" Visible="false"></asp:Label>
                <div class="col-2"></div>
                <div class="col-8">
                    <div class="container m-4 border-0" style="padding: 10px; border-radius: 7px">
                        <div class="row" style="margin-bottom: 8px; text-align: center; margin-top: 10px; margin-left: 10px; margin-right: 10px">
                            <h2 style="color: white; background-color: midnightblue; border-radius: 16px; padding: 15px">This is where you report crime!</h2>
                        </div>
                        <div class="row" style="text-align: center">
                            <asp:Label ID="lblSuccess" runat="server" ForeColor="MidnightBlue" Font-Size="16" Text=" "></asp:Label>
                        </div>
                        <div class="row">
                            <div class="col-2"></div>
                            <div class="col-3 align-content-center">
                                <asp:Label ID="Area" runat="server" Text="Choose the Area:"></asp:Label>
                            </div>
                            <div class="col-3 align-content-center">
                                <asp:Label ID="CrimeType" runat="server" Text="Choose crime type:"></asp:Label>
                            </div>
                            <div class="col-3 align-content-center">
                                <asp:Label ID="Dating" runat="server" Text="Date of incident:"></asp:Label>
                            </div>
                            <div class="col-1"></div>
                        </div>
                        <div class="row mb-4">
                            <div class="col-2"></div>
                            <div class="col-3 align-content-center mt-1">
                                <asp:DropDownList ID="ddlArea" runat="server">
                                    <asp:ListItem Text="Choose Below" Value="None" />
                                    <asp:ListItem Text="Abbortsford" Value="Abbortsford" />
                                    <asp:ListItem Text="Amalinda" Value="Amalinda" />
                                    <asp:ListItem Text="Beacon Bay" Value="Beacon Bay" />
                                    <asp:ListItem Text="Berea" Value="Berea" />
                                    <asp:ListItem Text="Braelyn" Value="Braelyn" />
                                    <asp:ListItem Text="Buffalo Flats" Value="Buffalo Flats" />
                                    <asp:ListItem Text="CBD" Value="CBD" />
                                    <asp:ListItem Text="Cambridge" Value="Cambridge" />
                                    <asp:ListItem Text="Dice" Value="Dice" />
                                    <asp:ListItem Text="Duncan Village" Value="Duncan Village" />
                                    <asp:ListItem Text="Ducats" Value="Ducats" />
                                    <asp:ListItem Text="Gonubie" Value="Gonubie" />
                                    <asp:ListItem Text="Mdantsane" Value="Mdantsane" />
                                    <asp:ListItem Text="Mzamomhle" Value="Mzamomhle" />
                                    <asp:ListItem Text="Nahoon" Value="Nahoon" />
                                    <asp:ListItem Text="New Life" Value="New Life" />
                                    <asp:ListItem Text="Nompumelelo" Value="Nompumelelo" />
                                    <asp:ListItem Text="Orange Groove" Value="Orange Groove" />
                                    <asp:ListItem Text="Parkside" Value="Parkside" />
                                    <asp:ListItem Text="Peffervile" Value="Peffervile" />
                                    <asp:ListItem Text="Quigney" Value="Quigney" />
                                    <asp:ListItem Text="Reeston" Value="Reeston" />
                                    <asp:ListItem Text="Santa" Value="Santa" />
                                    <asp:ListItem Text="Scenery Park" Value="Scenery Park" />
                                    <asp:ListItem Text="Southernwood" Value="Southernwood" />
                                    <asp:ListItem Text="Sunnyridge" Value="Sunnyridge" />
                                    <asp:ListItem Text="Vergenoeg" Value="Vergenoeg" />
                                    <asp:ListItem Text="Vincent" Value="Vincent" />
                                    <asp:ListItem Text="West Bank" Value="West Bank" />
                                </asp:DropDownList>
                            </div>
                            <div class="col-3 align-content-center mt-1">
                                <asp:DropDownList ID="ddlCrimeType" runat="server">
                                    <asp:ListItem Text="Choose Below" Value="None" />
                                    <asp:ListItem Text="Violent Crime" Value="Violent Crime" />
                                    <asp:ListItem Text="Property Crime" Value="Property Crime" />
                                    <asp:ListItem Text="Organized Crime" Value="Organized Crime" />
                                    <asp:ListItem Text="Drug Crime" Value="Drug Crime" />
                                    <asp:ListItem Text="Cyber Crime" Value="Cyber Crime" />
                                    <asp:ListItem Text="Statutory Crime" Value="Statutory Crime" />
                                    <asp:ListItem Text="Juvenile Crime" Value="Juvenile Crime" />
                                </asp:DropDownList>
                            </div>
                            <div class="col-3 align-content-center mt-1">
                                <asp:DropDownList ID="ddlDating" runat="server">
                                    <asp:ListItem Text="Choose Below" Value="None" />
                                    <asp:ListItem Text="Recently" Value="Recently" />
                                    <asp:ListItem Text="Over a month" Value="Over a month" />
                                    <asp:ListItem Text="Over three months" Value="Over three months" />
                                    <asp:ListItem Text="Over a year" Value="Over a year" />
                                </asp:DropDownList>
                            </div>
                            <div class="col-1"></div>
                        </div>

                        <div class="row">
                            <div class="col-2"></div>
                            <div class="col-3 mt-4 mb-3">
                                <p>Provide a detailed explanation of the crime:</p>
                            </div>
                            <div class="col-6 mt-4 mb-3 align-content-between">
                                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="10" Columns="50" Height="200px" Width="410px" BackColor="White" BorderColor="MidnightBlue" MaxLength="5000" CssClass="rounded-textbox" required></asp:TextBox>
                            </div>
                            <div class="col-1"></div>
                        </div>

                        <div class="row">
                            <div class="col-2"></div>
                            <div class="col-4 p-4 align-content-center">
                                <asp:Label ID="Label1" runat="server" Text="Choose the Filetype"></asp:Label>
                            </div>
                            <div class="col-4 p-4 align-content-center">
                                <asp:DropDownList ID="ddlFile" runat="server">
                                    <asp:ListItem Text="Choose Below" Value="None" />
                                    <asp:ListItem Text="Image" Value=".jpg" />
                                    <asp:ListItem Text="Audio" Value=".mp3" />
                                    <asp:ListItem Text="Video" Value=".mp4" />
                                    <asp:ListItem Text="Document" Value=".pdf" />
                                </asp:DropDownList>
                            </div>
                            <div class="col-2"></div>
                        </div>

                        <div class="row">
                            <div class="col-2"></div>
                            <div class="col-4 p-4 align-content-center">
                                <p>Click on "Browse" to upload evidence:</p>
                            </div>
                            <div class="col-4 p-4 align-content-center">
                                <asp:FileUpload ID="FileUploadEvidence" runat="server" />
                            </div>
                            <div class="col-2"></div>
                        </div>

                        <div class="row m-4 align-content-center">
                            <div class="col-3"></div>
                            <div class="col-3" style="text-align: center">
                                <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" ForeColor="White" BackColor="MidnightBlue" Width="100" Height="50" Style="border-radius: 16px" />
                            </div>
                            <div class="col-3" style="text-align: center">
                                <asp:Button ID="btnClear" runat="server" OnClick="btnClears_Click" Text="Clear" ForeColor="White" BackColor="MidnightBlue" Width="100" Height="50" Style="border-radius: 16px" />
                            </div>
                            <div class="col-3"></div>
                        </div>
                    </div>
                </div>
                <div class="col-2"></div>
            </div>
            <div class="footer">
                <p>&copy; 2024 The Community Eye</p>
            </div>
        </div>
    </form>
</body>
</html>
