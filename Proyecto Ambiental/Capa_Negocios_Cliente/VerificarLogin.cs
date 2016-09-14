using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using CapaEnlaceDatos;


namespace Capa_Negocios_Cliente
{
    public class VerificarLogin
    {
        private Manejador M = new Manejador();

        // atributos
        public String user { get; set; }
        public String contraseña { get; set; }
        public String resultado { get; set; }

        // Metodos

        public String verificarLogin()
        {
            List<Parametro> lista = new List<Parametro>();
            String Mensaje;

            try
            {
                lista.Add(new Parametro("@user", this.user));
                lista.Add(new Parametro("@Pass", this.contraseña));
                // retorno
                lista.Add(new Parametro("@Result", SqlDbType.NVarChar, 10));

                // Ejecuta el procedimiento
                M.EjecutarPA("LoginPersona", ref lista);

                // Atrapamos el parametro de respuesta
                Mensaje = lista[2].m_Valor.ToString();
            }
            catch (Exception e)
            {
                throw e;
            }
            return Mensaje;
        }
    }
}
