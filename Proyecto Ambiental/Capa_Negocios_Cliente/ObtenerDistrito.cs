using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using CapaEnlaceDatos;

namespace Capa_Negocios_Cliente
{
    public class ObtenerDistrito
    {
        Manejador manejador = new Manejador();

        public int idCanton { get; set; }

        public DataTable listadoDistrito()
        {
            List<Parametro> canton = new List<Parametro>();
            canton.Add(new Parametro("@idCanton", idCanton));

            return manejador.listado("consultaDistrito", canton);
        }
    }
}
