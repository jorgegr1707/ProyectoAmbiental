using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace CapaEnlaceDatos
{
    // inicio de la clase 
    public class Parametro{
        //Atributos
        public String m_Nombre {get; set;}
        public Object m_Valor { get; set; }
        public SqlDbType m_TipoDato { get; set; }
        public ParameterDirection m_Direccion { get; set; }
        public int m_Tamaño { get; set; }

        //CONSTRUCTORES
        //Parámetros de Entrada, funciona cuando vamos a mandar a hacer algo a la base de datos
        public Parametro(String objNombre, Object objValor){
            m_Nombre = objNombre;
            m_Valor = objValor;
            m_Direccion = ParameterDirection.Input;
        }


        //Parámetros de Salida, funciona cuando vamos a hacer algo en la base y esa operacion nos va a devolver datos
        public Parametro(String objNombre, SqlDbType objTipoDato, Int32 objTamaño){
            m_Nombre = objNombre;
            m_TipoDato = objTipoDato;
            m_Tamaño = objTamaño;
            m_Direccion = ParameterDirection.Output;
        }
    }
}
