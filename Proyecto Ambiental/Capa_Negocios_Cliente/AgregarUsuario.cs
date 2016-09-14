using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEnlaceDatos;

namespace Capa_Negocios_Cliente
{
    class AgregarUsuario
    {
        private Manejador controlador = new Manejador();

        public int cedula { get; set; }
        public string primerNombre { get; set; }
        public string segundoNombre { get; set; }
        public string primerApellido { get; set; }
        public string segundoApellido { get; set; }
        public DateTime fechaNacimiento { get; set; }
        public string username { get; set; }
        public string conraseña { get; set; }
        public int telefono { get; set; }
        public string email { get; set; }
        public string provincia { get; set; }
        public string canton { get; set; }
        public string distrito { get; set; }
        public string detalle { get; set; }
        public string mensaje { get; set; }
    }
}
