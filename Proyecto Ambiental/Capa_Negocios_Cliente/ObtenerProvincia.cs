using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using CapaEnlaceDatos;

namespace Capa_Negocios_Cliente
{
    public class ObtenerProvincia
    {
        Manejador manejador = new Manejador();

        
        public DataTable listadoProvincias()
        {
            return manejador.listado("consultaProvincia", null);
        }
    }
}
