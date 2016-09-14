using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using CapaEnlaceDatos;

namespace CapaLogicaNegocio
{
    public class AgregarPersona{
        // manejador (conecta y desconecta la base de datos)
        private Manejador M = new Manejador();

        /*############# Atributos #############*/
        public int cedula { get; set; }
        public String primerNombre { get; set; }
        public String segundoNombre { get; set; }
        public String primerApellido { get; set; }
        public String segundoApellido { get; set; }
        public DateTime fechaNacimiento { get; set; }
        public String username { get; set; }
        public String conraseña { get; set; }
        public int telefono { get; set; }
        public String email { get; set; }
        public String provincia { get; set; }
        public String canton { get; set; }
        public String distrito { get; set; }
        public String detalle { get; set; }
        public String mensaje { get; set; }
        //#####################################

        // Me retorna una tabla con todos los datos de personas... se debe borrar
        public DataTable Listado() {
            return M.Consulta("listadoPersonas", null);
        }

        // llena la tabla con los valores
        public String RegistrarPersona() {
            List<Parametro> lista = new List<Parametro>();
            String Mensaje = "";
            try
            {
                //Pasamos los parametros de entrada
                lista.Add(new Parametro("@cedula", this.cedula));
                lista.Add(new Parametro("@primerNombre", this.primerNombre));
                lista.Add(new Parametro("@segundoNombre", this.segundoNombre));
                lista.Add(new Parametro("@primerApellido", this.primerApellido));
                lista.Add(new Parametro("@segundoApellido", this.segundoApellido));
                lista.Add(new Parametro("@fechaNacimiento", this.fechaNacimiento));
                lista.Add(new Parametro("@username", this.username));
                lista.Add(new Parametro("@passw", this.conraseña));
                lista.Add(new Parametro("@telefono", this.telefono));
                lista.Add(new Parametro("@email", this.email));
                lista.Add(new Parametro("@provincia", this.provincia));
                lista.Add(new Parametro("@canton", this.canton));
                lista.Add(new Parametro("@distrito", this.distrito));
                lista.Add(new Parametro("@detalle", this.detalle));
                //Pasamos los datos de Salida
                lista.Add(new Parametro("@mensaje", SqlDbType.VarChar,100));

                // Ejecuta el procedimiento
                M.EjecutarPA("RegistrarAlumnos", ref lista);
                // Atrapamos el parametro de respuesta
                Mensaje = lista[14].m_Valor.ToString();
            }
            catch (Exception ex){                
                throw ex;
            }
            return Mensaje;
        }
        /*
        public String ActualizarDatos() {
            List<Parametro> lst = new List<Parametro>();
            String Mensaje = "";
            try
            {
                lst.Add(new Parametro("@Dni",m_Dni));
                lst.Add(new Parametro("@Apellidos",m_Apellidos));
                lst.Add(new Parametro("@Nombres",m_Nombres));
                lst.Add(new Parametro("@Sexo",m_Sexo));
                lst.Add(new Parametro("@FechaNac",m_FechaNac));
                lst.Add(new Parametro("@Direccion",m_Direccion));
                lst.Add(new Parametro("@Mensaje",SqlDbType.VarChar,100));
                M.EjecutarPA("ActualizarDatos",ref lst);
                Mensaje=lst[6].m_Valor.ToString();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return Mensaje;
        }

        public String EliminarRegistro() {
            List<Parametro> lst = new List<Parametro>();
            String Mensaje = "";
            try
            {
                lst.Add(new Parametro("@Dni",m_Dni));
                lst.Add(new Parametro("@Mensaje",SqlDbType.VarChar,100));
                M.EjecutarPA("EliminarAlumnos",ref lst);
                Mensaje = lst[1].m_Valor.ToString();
            }
            catch (Exception ex)
            {  
                throw ex;
            }
            return Mensaje;
        }

        public DataTable BuscarAlumno(String objDni) {
            DataTable dt = new DataTable();
            List<Parametro> lst = new List<Parametro>();
            try
            {
                lst.Add(new Parametro("@Dni",objDni));
                dt = M.LLenadoDatos("BuscarAlumnos",lst);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;
        }
        */
    }
}
