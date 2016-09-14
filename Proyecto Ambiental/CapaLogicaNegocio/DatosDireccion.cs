using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CapaLogicaNegocio;
using System.Data;
using CapaEnlaceDatos;

namespace CapaLogicaNegocio
{
    public class DatosDireccion
    {
        private Manejador M = new Manejador();




        public DataTable cargarProvincias()
        {
            return M.Consulta("cargarProvincias", null);
        }

        public DataTable cargarCantones(String provincia)
        {
            DataTable dt = new DataTable();
            List<Parametro> lista = new List<Parametro>();
            try{
                lista.Add(new Parametro("@provincia", provincia));
                dt = M.Consulta("cargarCantones", lista);
            }
            catch (Exception ex){
                throw ex;
            }
            return dt;
        }

        public DataTable cargarDistritos(String canton)
        {
            DataTable dt = new DataTable();
            List<Parametro> lista = new List<Parametro>();
            try
            {
                lista.Add(new Parametro("@canton", canton));
                dt = M.Consulta("cargarDistritor", lista);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;
        }
    }
}
