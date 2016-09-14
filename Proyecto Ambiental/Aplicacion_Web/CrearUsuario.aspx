<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CrearUsuario.aspx.cs" Inherits="Aplicacion_Web.CrearUsuario" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
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
                        Ingrese Usuario&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="* Espacios Obligatorios"></asp:Label>
                    </div>
                    
                    <div class="panel-body">
                        
                    
                        <form id="form1" runat="server">
                            <asp:ScriptManager ID="scriptManejador" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="panelUpdate" runat="server"><ContentTemplate>
                              <fieldset>
                                <asp:Label ID="lblCedula" runat="server" Text="Cédula"></asp:Label>
                                <asp:Label ID="lblAsterisco1" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtCedula" runat="server" MaxLength="9"></asp:TextBox>
                                <asp:Label ID="lblValidaCedula" runat="server" ForeColor="Red" Text="No ingresó cédula" Visible="False"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="lblPrimerNombre" runat="server" Text="Primer Nombre"></asp:Label>
                                <asp:Label ID="lblAsterisco2" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtPrimerNombre" runat="server" MaxLength="20"></asp:TextBox>
                                <asp:Label ID="lblValidaPrimerNombre" runat="server" ForeColor="Red" Text="No ingresó nombre" Visible="False"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="lblSegundoNombre" runat="server" Text="Segundo Nombre"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtSegundoNombre" runat="server" MaxLength="20"></asp:TextBox>
                                <br />
                                <br />
                                <asp:Label ID="lblPrimerApellido" runat="server" Text="Primer Apellido"></asp:Label>
                                <asp:Label ID="lblAsterisco3" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtPrimerApellido" runat="server" MaxLength="20"></asp:TextBox>
                                <asp:Label ID="lblValidaPrimerApellido" runat="server" ForeColor="Red" Text="No ingresó apellido" Visible="False"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="lblSegundoApellido" runat="server" Text="Segundo Apellido"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtSegundoApellido" runat="server" MaxLength="20"></asp:TextBox>
                                <br />
                                <br />
                                <asp:Label ID="lblEmail" runat="server" Text="Correo Electrónico"></asp:Label>
                                <asp:Label ID="lblAsterisco4" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtEmail" runat="server" MaxLength="50"></asp:TextBox>
                                <asp:Label ID="lblValidaEmail" runat="server" ForeColor="Red" Text="No ingresó e-mail" Visible="False"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="lblTelefono" runat="server" Text="Teléfono"></asp:Label>
                                <asp:Label ID="lblAsterisco5" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtTelefono" runat="server" MaxLength="8"></asp:TextBox>
                                <asp:Label ID="lblValidaTelefono" runat="server" ForeColor="Red" Text="No ingresó teléfono" Visible="False"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="lblDireccion" runat="server" Text="Direccion:"></asp:Label>
                                <asp:Label ID="lblAsterisco10" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                <asp:Label ID="lblValidaDireccion" runat="server" ForeColor="Red" Text="Debe completar la dirección" Visible="False"></asp:Label>
                                <br />
                                <asp:Label ID="lblProvincia" runat="server" Text="Provincia"></asp:Label>
                                <br />
                                <asp:DropDownList ID="ddlProvincia" runat="server" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged" Height="17px" Width="122px">
                                </asp:DropDownList>
                                  &nbsp;
                                  <asp:Button ID="btnActualizarCanton" runat="server" Height="24px" Width="90px" Text="Actualizar" OnClick="btnActualizarCanton_Click" />
                                <br />
                                <br />
                                <asp:Label ID="lblCanton" runat="server" Text="Cantón"></asp:Label>
                                <br />
                                <asp:DropDownList ID="ddlCanton" runat="server" Height="17px" Width="122px">
                                </asp:DropDownList>
                                  &nbsp;
                                  <asp:Button ID="btnActualizarDistrito" runat="server" Height="24px" Width="90px" Text="Actualizar" OnClick="btnActualizarDistrito_Click"/>
                                <br />
                                <br />
                                <asp:Label ID="lblDistrito" runat="server" Text="Distrito"></asp:Label>
                                <br />
                                <asp:DropDownList ID="ddlDistrito" runat="server" Height="17px" Width="122px">
                                </asp:DropDownList>
                                <br />
                                <br />
                                <asp:Label ID="lblDetalle" runat="server" Text="Detalle"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtDetalle" runat="server" Height="61px" Width="277px"></asp:TextBox>
                                <br />
                                <br />
                                <asp:Label ID="lblFechaNacimiento" runat="server" Text="Fecha de Nacimiento:"></asp:Label>
                                <asp:Label ID="lblAsterisco9" runat="server" Text="*"></asp:Label>
                                <asp:Label ID="lblValidaFechaNacimiento" runat="server" ForeColor="Red" Text="* Complete la fecha de nacimiento" Visible="False"></asp:Label>
                                  <br />
                                  <asp:DropDownList ID="ddlAnio" runat="server" Height="16px" Width="96px" OnSelectedIndexChanged="ddlAnio_DataBound">
                                  </asp:DropDownList>
                                  <asp:Button ID="btnActualizarFecha" runat="server" Height="21px" Text="Actualizar" Width="68px" OnClick="btnActualizarFecha_Click" />
                                <br />
                                <asp:Calendar ID="calendarFecha" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" SelectionMode="DayWeekMonth"></asp:Calendar>
                                    
                                <br />
                                <asp:Label ID="lblUsername" runat="server" Text="Nombre de Usuario"></asp:Label>
                                <asp:Label ID="lblAsterisco6" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtUsername" runat="server" MaxLength="20"></asp:TextBox>
                                <asp:Label ID="lblValidaUsername" runat="server" ForeColor="Red" Text="No ingresó usuario" Visible="False"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="lblContrasenia" runat="server" Text="Contraseña"></asp:Label>
                                <asp:Label ID="lblAsterisco7" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtContrasenia" runat="server" MaxLength="15"></asp:TextBox>
                                <asp:Label ID="lblValidaContrasenia" runat="server" ForeColor="Red" Text="No ingresó contraseña" Visible="False"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="lblRol" runat="server" Text="Elige un rol"></asp:Label>
                                <asp:Label ID="lblAsterisco8" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                <br />
                                <asp:RadioButtonList ID="rdbRol" runat="server">
                                    <asp:ListItem Text="Guardian" Value="Guardian" />
                                    <asp:ListItem Text="Oficial" Value="Oficial"/>
                                    <asp:ListItem Text="Juez" Value="Juez"/>
                                </asp:RadioButtonList>
                                <asp:Button ID="btnCrearUsuario" runat="server" BackColor="#00CC99" Text="Crear Usuario" OnClick="btnCrearUsuario_Click1"/>
                                <br />
                            </fieldset>
                            </ContentTemplate></asp:UpdatePanel>
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
