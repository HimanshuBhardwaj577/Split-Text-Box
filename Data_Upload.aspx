<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Data_Upload.aspx.cs" Inherits="Split_Data.Data_Upload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Upload Data</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <link href='support/style.css' rel='stylesheet' />
    <link href='nprogress.css' rel='stylesheet' />
    <script src='nprogress.js'></script>
</head>
<body style='display: none'>
    <form id="form1" runat="server">
        <div class="card shadow">
            <div class="card-body">
                <div class="form-group">
                    <asp:TextBox ID="TextBox1" class="form-control" AutoComplete="off" placeholder="Upload Your hockey team data here!" Height="200px" TextMode="MultiLine" ForeColor="Blue" runat="server"></asp:TextBox>
                </div>
                <br />
                <hr />
                <asp:Label runat="server" ID="Label1" Text=""></asp:Label>
                <br />
                <hr />
                <asp:Button ID="Button1" CssClass="btn btn-danger" OnClick="dataupload_Click" runat="server" Text="Upload Data" />
                <hr />
                <asp:Repeater ID="Repeater1" runat="server">
                    <HeaderTemplate>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Team</th>
                                    <th>Country</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Wight</th>
                                    <th>Height</th>
                                    <th>Date Of Birth</th>
                                    <th>HomeTown</th>
                                    <th>Prov</th>
                                    <th>Pos</th>
                                    <th>Age</th>
                                    <th>HeightFt</th>
                                    <th>Ht lN</th>
                                    <th>BMI</th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("Id") %></td>
                            <td><%# Eval("Team") %></td>
                            <td><%# Eval("Country") %></td>
                            <td><%# Eval("NameF") %></td>
                            <td><%# Eval("NameL") %></td>
                            <td><%# Eval("Weight") %></td>
                            <td><%# Eval("Height") %></td>
                            <td><%# Eval("DOB") %></td>
                            <td><%# Eval("Hometown") %></td>
                            <td><%# Eval("Prov") %></td>
                            <td><%# Eval("Pos") %></td>
                            <td><%# Eval("Age") %></td>
                            <td><%# Eval("HeightFt") %></td>
                            <td><%# Eval("HtIn") %></td>
                            <td><%# Eval("BMI") %></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </tbody>
                    <tfoot>
                        <tr>
                            <th>Id</th>
                            <th>Team</th>
                            <th>Country</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Wight</th>
                            <th>Height</th>
                            <th>Date Of Birth</th>
                            <th>HomeTown</th>
                            <th>Prov</th>
                            <th>Pos</th>
                            <th>Age</th>
                            <th>HeightFt</th>
                            <th>Ht lN</th>
                            <th>BMI</th>
                        </tr>
                    </tfoot>
                        </table>

                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>
        <!-- Hide Label Automaticlly after 5 second -->
        <script type="text/javascript">
            function HideLabel() {
                var seconds = 5;
                setTimeout(function () {
                    document.getElementById("<%=Label1.ClientID %>").style.display = "none";
                }, seconds * 1000);
            };
        </script>

        <script>
            $("body").show();
            $(".version").text(NProgress.version);
            NProgress.start();
            setTimeout(function () {
                NProgress.done();
                $(".fade").removeClass("out");
            }, 5000);
        </script>
    </form>
</body>
</html>
