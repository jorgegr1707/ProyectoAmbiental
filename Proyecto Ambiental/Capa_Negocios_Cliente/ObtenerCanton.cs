using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using CapaEnlaceDatos;

namespace Capa_Negocios_Cliente
{

    public class ObtenerCanton
    {
        Manejador manejador = new Manejador();

        public int idProvincia { get; set; }

        public DataTable listadoCanton()
        {
            List<Parametro> provincia = new List<Parametro>();
            provincia.Add(new Parametro("@idProvincia", idProvincia));

            return manejador.listado("consultaCanton", provincia);
        }
    }
}
