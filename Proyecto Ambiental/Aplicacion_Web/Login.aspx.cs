using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Capa_Negocios_Cliente;


namespace Aplicacion_Web
{
    public partial class Login : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsuario.Text;
            string password = txtPassword.Text;

            if(username == "")
            {
                lblErrorUsername.Visible = true;
                lblErrorPassword.Visible = false;
                lblErrorIngreso.Visible = false;
            }
                
            else if(password == "")
            {
                lblErrorUsername.Visible = false;
                lblErrorPassword.Visible = true;
                lblErrorIngreso.Visible = false;
            }
            else
            {
                VerificarLogin chequeoLogin = new VerificarLogin();
                string resultado;
                chequeoLogin.user = username;
                chequeoLogin.contraseña = password;
                resultado = chequeoLogin.verificarLogin();

                if (resultado != "Incorrecto")
                {
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    lblErrorUsername.Visible = false;
                    lblErrorPassword.Visible = false;
                    lblErrorIngreso.Visible = true;
                }
            }
        }

        protected void lnkCrearUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("CrearUsuario.aspx");
        }
    }
}