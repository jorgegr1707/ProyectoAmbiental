<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Aplicacion_Web.Login" %>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carbono Neutral</title>
    <!-- Core CSS - Include with every page -->
    <link href="assets/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
    <link href="assets/css/main-style.css" rel="stylesheet" />

</head>

<body class="body-Login-back">

    <div class="container">
       
        <div class="row">
            <div class="col-md-4 col-md-offset-4 text-center logo-margin">
              &nbsp;<asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="False" Font-Names="Tw Cen MT" Font-Size="XX-Large" ForeColor="White" Text="CARBONO NEUTRAL"></asp:Label>
                </div>
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default" style ="height: 100%; width: 100%">              
                    <div class="panel-heading">
                        Ingrese Usuario</div>
                    <div class="panel-body">
                        <form id="form1" runat="server">
                            <fieldset>
                                <!-- Change this to a button or input when using this as a form -->
                                <asp:Label ID="lblErrorIngreso" runat="server" ForeColor="Red" Text="Usuario o contraseña incorrectos" Visible="False"></asp:Label>
                                <br />
                                Usuario:
                                <asp:TextBox ID="txtUsuario" runat="server" Font-Size="XX-Large" Height="100%" Width="100%"></asp:TextBox>
                                <asp:Label ID="lblErrorUsername" runat="server" ForeColor="Red" Text="No ingresó usuario" Visible="False"></asp:Label>
                                <br />
                                Contraseña:
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="col-xs-offset-0" Font-Size="XX-Large" Height="100%" Width="100%" TextMode="Password"></asp:TextBox>
                                <asp:Label ID="lblErrorPassword" runat="server" ForeColor="Red" Text="No ingresó contraseña" Visible="False"></asp:Label>
                                <br />
                                &nbsp;<asp:Button ID="btnLogin" runat="server" BackColor="#00CC66" Height="100%" Text="Login" Width="100%" OnClick="btnLogin_Click"/>
                                
                                <asp:LinkButton ID="lnkCrearUsuario" runat="server" OnClick="lnkCrearUsuario_Click">¿No tienes una cuenta?</asp:LinkButton>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

     <!-- Core Scripts - Include with every page -->
    <script src="assets/plugins/jquery-1.10.2.js"></script>
    <script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="assets/plugins/metisMenu/jquery.metisMenu.js"></script>

</body>

</html>
