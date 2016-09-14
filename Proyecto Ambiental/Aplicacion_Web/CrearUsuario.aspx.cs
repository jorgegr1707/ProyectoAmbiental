using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using Capa_Negocios_Cliente;

namespace Aplicacion_Web
{
    public partial class CrearUsuario : System.Web.UI.Page
    {
        ObtenerProvincia provincia = new ObtenerProvincia();
        ObtenerCanton canton = new ObtenerCanton();
        ObtenerDistrito distrito = new ObtenerDistrito();

        //Procedimiento para cargar la pagina
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                for (int i = 1900; i <= DateTime.Now.Year; i++)
                {
                    ddlAnio.Items.Insert(0, new ListItem(i.ToString(), i.ToString()));
                }
                DataTable tableProvincia = provincia.listadoProvincias();
                DataRow row;
                for (int i = 0; i < 7; i++)
                {
                    row = tableProvincia.Rows[i];
                    ddlProvincia.Items.Add(new ListItem(row["nombreProvincia"].ToString(), (i+1).ToString()));
                }
            }


        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            /*if (!IsPostBack)
            {
                for (int i = 1900; i <= DateTime.Now.Year; i--)
                {
                    ddlAnio.Items.Insert(0, new ListItem(i.ToString(), i.ToString()));
                }
            }*/

        }

        //Metodo que modifica el año del calendario a gusto del usuario
        protected void Set_Calendar(object sender, EventArgs e)
        {
            calendarFecha.TodaysDate = new DateTime(2000, 12, 12);
        }

        //Metodo que crea usuario
        protected void btnCrearUsuario_Click(object sender, EventArgs e)
        {
            string anio = ddlAnio.SelectedItem.Text;
            calendarFecha.TodaysDate = new DateTime(Int32.Parse(anio), 1, 1);

        }
       
        protected void ddlAnio_DataBound(object sender, EventArgs e)
        {
            Console.WriteLine("hola");
            Console.WriteLine(ddlAnio.SelectedItem.ToString());
            string anio = ddlAnio.SelectedValue.ToString();
            Console.WriteLine(anio);
            calendarFecha.TodaysDate = new DateTime(Int32.Parse(anio), 1, 1);
        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            Console.WriteLine(ddlProvincia.SelectedItem.ToString());

        }

        protected void ComboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string anio = ddlAnio.SelectedItem.Text;
            calendarFecha.TodaysDate = new DateTime(Int32.Parse(anio), 1, 1);
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string anio = ddlAnio.SelectedItem.Text;
            calendarFecha.TodaysDate = new DateTime(Int32.Parse(anio), 1, 1);
        }

        protected void btnActualizarFecha_Click(object sender, EventArgs e)
        {
            string anio = ddlAnio.SelectedItem.Text;
            calendarFecha.TodaysDate = new DateTime(Int32.Parse(anio), 1, 1);

        }
        //Metodo del boton actualizar Cantones
        protected void btnActualizarCanton_Click(object sender, EventArgs e)
        {
            canton.idProvincia = Int32.Parse(ddlProvincia.SelectedValue);
            DataTable tableCanton = canton.listadoCanton();
            DataRow row;
            ddlCanton.Items.Clear();
            for(int i = 0; i < tableCanton.Rows.Count; i++)
            {
                row = tableCanton.Rows[i];
                ddlCanton.Items.Add(new ListItem(row["nombreCanton"].ToString(), row["idCanton"].ToString()));

            }
        }

        protected void btnActualizarDistrito_Click(object sender, EventArgs e)
        {
            distrito.idCanton = Int32.Parse(ddlCanton.SelectedValue);
            DataTable tableDistrito = distrito.listadoDistrito();
            DataRow row;
            ddlDistrito.Items.Clear();
            for(int i = 0; i < tableDistrito.Rows.Count; i++)
            {
                row = tableDistrito.Rows[i];
                ddlDistrito.Items.Add(new ListItem(row["nombreDistrito"].ToString(), row["idDistrito"].ToString()));
            }
        }

        protected void btnCrearUsuario_Click1(object sender, EventArgs e)
        {
            try
            {
                
            }
            catch (Exception)
            {

                throw;
            }
            //txtUsername.Text = rdbRol.SelectedItem.Text;
        }

        /*protected void ddlMes_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlDia.Items.Clear();
            int anioActual = DateTime.Now.Year;
            int diasFebrero;
            int totalMes;
            if ((anioActual % 4 == 0) && (anioActual % 100 != 0) || anioActual % 400 == 0)
                diasFebrero = 29;
            else
                diasFebrero = 28;


            switch (ddlMes.SelectedIndex)
            {
                case 3: case 5: case 8: case 10:
                    totalMes = 30;
                    break;
                case 1:
                    totalMes = diasFebrero;
                    break;
                default:
                    totalMes = 31;
                    break;
            }

            int pos = 1;
            for(int i = 1; i <= totalMes; i++)
            {
                ListItem Dias = new ListItem(i.ToString(), pos.ToString());
                ddlDia.Items.Add(Dias);
            }
        }*/
    }
}