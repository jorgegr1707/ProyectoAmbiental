using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using CapaLogicaNegocio;

namespace CapaPresentacion
{
    public partial class AdminMejorado : Form
    {
        private String id;
        private MetodosAdministrador amd = new MetodosAdministrador();
        DataTable dt;
        string rolConsultado;
        public AdminMejorado(String id)
        {
            this.id = id;
            InitializeComponent();
            if (button4.Enabled == true) { button4.Enabled = !button4.Enabled; }
            if (button3.Enabled == true) { button3.Enabled = !button3.Enabled; }
            if (button2.Enabled == true) { button2.Enabled = !button2.Enabled; }
        }
        /*##############################################################*/
        public void llenaDatos(DataTable dt, String tipo)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                grid1.Rows.Add(dt.Rows[i][0]);
                grid1.Rows[i].Cells[0].Value = dt.Rows[i][0].ToString(); //cedula
                try
                {
                    if (tipo == "Persona")
                    {
                        grid1.Rows[i].Cells[3].Value = amd.BuscarRol(dt.Rows[i][0].ToString()); //rol
                    }
                    else if (tipo == "guardian")
                    {
                        grid1.Rows[i].Cells[3].Value = "Guardian"; //rol
                    }
                    else if (tipo == "oficial")
                    {
                        grid1.Rows[i].Cells[3].Value = "Oficial"; //rol
                    }
                    else if (tipo == "juez")
                    {
                        grid1.Rows[i].Cells[3].Value = "Juez"; //rol
                    }
                    else if (tipo == "consultante")
                    {
                        grid1.Rows[i].Cells[3].Value = "Consultante"; //rol
                    }
                    else if (tipo == "Administrador")
                    {
                        grid1.Rows[i].Cells[3].Value = "Administrador"; //rol
                    }
                }
                catch (Exception e)
                {
                    throw e;
                }
                grid1.Rows[i].Cells[4].Value = dt.Rows[i][1].ToString() + " " + dt.Rows[i][2].ToString() + " " + dt.Rows[i][3].ToString() + " " + dt.Rows[i][4].ToString(); //nombre
                grid1.Rows[i].Cells[1].Value = amd.verEstado(dt.Rows[i][0].ToString());
                grid1.Rows[i].Cells[6].Value = dt.Rows[i][10].ToString(); //mail
                grid1.Rows[i].Cells[5].Value = dt.Rows[i][9].ToString(); //telefono
                grid1.Rows[i].Cells[2].Value = dt.Rows[i][6].ToString(); //username
            }
        }
        /*##############################################################*/
        private void tileItem4_ItemClick(object sender, DevExpress.XtraEditors.TileItemEventArgs e)
        {
            this.rolConsultado = "Oficiales";
            //dt.Clear();
            dt = amd.cargarOficiales();
            grid1.Rows.Clear();
            this.llenaDatos(dt, "oficial");
            if (button4.Enabled) { button4.Enabled = !button4.Enabled; }
            if (button3.Enabled == false) { button3.Enabled = !button3.Enabled; }
            if (button2.Enabled == false) { button2.Enabled = !button2.Enabled; }
        }
        /*##############################################################*/
        private void tileItem5_ItemClick(object sender, DevExpress.XtraEditors.TileItemEventArgs e)
        {
            grid1.Rows.Clear();
            dt = amd.cargarPersonas();
            grid1.Rows.Clear();
            this.llenaDatos(dt, "Persona");
        }
        /*##############################################################*/
        private void tileItem5_ItemClick_1(object sender, DevExpress.XtraEditors.TileItemEventArgs e)
        {
            dt = amd.cargarPersonas();
            llenaDatos(dt, "Persona");
            if (button4.Enabled == true) { button4.Enabled = !button4.Enabled; }
            if (button3.Enabled == true) { button3.Enabled = !button3.Enabled; }
            if (button2.Enabled == true) { button2.Enabled = !button2.Enabled; }
        }
        /*##############################################################*/
        private void tomarValorGrid()
        {
            grid1.SelectedRows.ToString();
        }
        /*##############################################################*/
        private void tileItem2_ItemClick(object sender, DevExpress.XtraEditors.TileItemEventArgs e)
        {
            this.rolConsultado = "Guardianes";
            dt = amd.cargarGuardianes();
            grid1.Rows.Clear();
            this.llenaDatos(dt, "guardian");
            if (button4.Enabled) { button4.Enabled = !button4.Enabled; }
            if (button3.Enabled == false) { button3.Enabled = !button3.Enabled; }
            if (button2.Enabled == false) { button2.Enabled = !button2.Enabled; }
        }
        /*##############################################################*/
        private void tileItem3_ItemClick(object sender, DevExpress.XtraEditors.TileItemEventArgs e)
        {
            this.rolConsultado = "Jueces";
            dt = amd.cargarJueces();
            grid1.Rows.Clear();
            this.llenaDatos(dt, "juez");
            if (button4.Enabled) { button4.Enabled = !button4.Enabled; }
            if (button3.Enabled == false) { button3.Enabled = !button3.Enabled; }
            if (button2.Enabled == false) { button2.Enabled = !button2.Enabled; }
        }
        /*##############################################################*/
        private void tileItem8_ItemClick(object sender, DevExpress.XtraEditors.TileItemEventArgs e)
        {
            dt = amd.cargarConsultantes();
            grid1.Rows.Clear();
            this.llenaDatos(dt, "consultante");
            rolConsultado = "Consultantes";
            if (button4.Enabled == false) { button4.Enabled = !button4.Enabled; }
            if (button3.Enabled == true) { button3.Enabled = !button3.Enabled; }
            if (button2.Enabled == true) { button2.Enabled = !button2.Enabled; }
        }
        /*##############################################################*/
        private void tileItem7_ItemClick(object sender, DevExpress.XtraEditors.TileItemEventArgs e)
        {
            dt = amd.cargarAdministradores();
            grid1.Rows.Clear();
            this.llenaDatos(dt, "Administrador");
            rolConsultado = "Administradores";
            if (button4.Enabled == false) { button4.Enabled = !button4.Enabled; }
            if (button3.Enabled == true) { button3.Enabled = !button3.Enabled; }
            if (button2.Enabled == true) { button2.Enabled = !button2.Enabled; }
            
        }
        /*##############################################################*/
        private void button1_Click(object sender, EventArgs e)
        {
            crearAutoridades crearAutoridad = new crearAutoridades(id);
            crearAutoridad.Show();
            this.Hide();
        }
        /*##############################################################*/
        private Boolean verificarSeleccionGrid()
        {
            if ((grid1.CurrentCell.Value.ToString().Length == 9))
            {
                try
                {
                    int y = Int32.Parse(grid1.CurrentCell.Value.ToString());
                    return true;
                }
                catch (Exception e)
                {
                    String x = e.Message;
                    return false;
                }
            }
            return false;
        }
        /*##############################################################*/
        private void button2_Click(object sender, EventArgs e)
        {

            if (verificarSeleccionGrid())
            {
                amd.cambiarEstadoActivo(grid1.CurrentCell.Value.ToString());
                cargar();
                MessageBox.Show("Se ha activado el usuario", "Completado",
                MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
            }
            else
            {
                MessageBox.Show("Debes seleccionar la Cédula del usuario al que deseas Activar", "error",
                MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
            }
        }
        /*##############################################################*/
        private Boolean cargar()
        {
            if (this.rolConsultado == "Guardianes")
            {
                dt.Clear();
                dt = amd.cargarGuardianes();
                grid1.Rows.Clear();
                this.llenaDatos(dt, "guardian");
                return true;
            }
            else if (this.rolConsultado == "Administradores")
            {
                dt.Clear();
                dt = amd.cargarAdministradores();
                grid1.Rows.Clear();
                this.llenaDatos(dt, "Administrador");
                return true;
            }
            else if (this.rolConsultado  == "Consultantes")
            {
                dt.Clear();
                dt = amd.cargarConsultantes();
                grid1.Rows.Clear();
                this.llenaDatos(dt, "consultante");
                return true;
            }
            else if (this.rolConsultado == "Oficiales")
            {
                dt.Clear();
                dt = amd.cargarOficiales();
                grid1.Rows.Clear();
                this.llenaDatos(dt, "oficial");
                return true;
            }
            else if (this.rolConsultado  == "Jueces")
            {
                dt.Clear();
                dt = amd.cargarJueces();
                grid1.Rows.Clear();
                this.llenaDatos(dt, "juez");
                return true;
            }
            dt.Clear();
            dt = amd.cargarPersonas();
            grid1.Rows.Clear();
            this.llenaDatos(dt, "Persona");
            return true;
        }
        /*##############################################################*/
        private void button3_Click(object sender, EventArgs e)
        {
            if (verificarSeleccionGrid())
            {
                amd.cambiarEstadoDesactivo(grid1.CurrentCell.Value.ToString());
                cargar();
                MessageBox.Show("Se ha desactivado el usuario", "",
                MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
            }
            else
            {
                MessageBox.Show("Debes seleccionar la Cédula del usuario al que deseas Desactivar", "error",
                MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
            }
        }
        /*##############################################################*/
        private void button4_Click(object sender, EventArgs e)
        {
            if (this.rolConsultado == "Administradores")
            {
                if (verificarSeleccionGrid())
                {
                    amd.eliminaAdministrador(grid1.CurrentCell.Value.ToString());
                    dt.Clear();
                    dt = amd.cargarAdministradores();
                    grid1.Rows.Clear();
                    this.llenaDatos(dt, "Administrador");
                    amd.cambiarEstadoActivo(grid1.CurrentCell.Value.ToString());
                    cargar();
                }
                else
                {
                    MessageBox.Show("Debes seleccionar la Cédula de la Autoridad que deseas Eliminar", "error",
                    MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
                }

            }
            else if (this.rolConsultado == "Consultantes")
            {
                if (verificarSeleccionGrid())
                {
                    amd.eliminaConsultante(grid1.CurrentCell.Value.ToString());
                    dt.Clear();
                    dt = amd.cargarConsultantes();
                    grid1.Rows.Clear();
                    this.llenaDatos(dt, "consultante");
                    amd.cambiarEstadoActivo(grid1.CurrentCell.Value.ToString());
                    cargar();
                }
                else
                {
                    MessageBox.Show("Debes seleccionar la Cédula de la Autoridad que deseas Eliminar", "error",
                    MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
                }


            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        /*##############################################################*/
    }
}
