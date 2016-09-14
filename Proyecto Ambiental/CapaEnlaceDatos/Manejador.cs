using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace CapaEnlaceDatos
{
    public class Manejador{
        // Establece la conexion a la base de datos
        public SqlConnection conexion = new SqlConnection("Server=.; DataBase = Proyecto; Integrated Security = SSPI");

        // Conecta la BD
        public void Conectar() {
            if (conexion.State == ConnectionState.Closed)
                conexion.Open();
        }

        // Desconecta la BD
        public void Desconectar() {
            if (conexion.State == ConnectionState.Open)
                conexion.Close();
        }

        // Llena los datos para el procedimiento
        public DataTable Consulta(String NombreSP, List<Parametro> lista) {
            DataTable dt = new DataTable();
            SqlDataAdapter da;
            try {
                Conectar();
                // Crea el objeto de conexion
                da = new SqlDataAdapter(NombreSP, conexion);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                
                if (lista != null) { 
                    //Recorremos la lista Genérica
                    for (int i = 0; i < lista.Count; i++){
                        //Pasamos cada uno de los parámetros
                        da.SelectCommand.Parameters.AddWithValue(lista[i].m_Nombre, lista[i].m_Valor);
                    }
                }
                da.Fill(dt);
            }
            catch (Exception ex){
                throw ex;
            }
            Desconectar();
            return dt;
        }

        // Manda a ejecutar el procedimiento almacenado  
        public void EjecutarPA(String NombreSP,ref List<Parametro> lst){
            SqlCommand cmd;
           try{
                Conectar();
                
                // Crea el comando que se va a ejecutar
                cmd = new SqlCommand(NombreSP,conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                
                if (lst != null) { 
                    //Recorremos la lista
                    for (int i = 0; i < lst.Count; i++){
                        //Verificamos si los parametros son de entrada
                        if (lst[i].m_Direccion == ParameterDirection.Input)
                            cmd.Parameters.AddWithValue(lst[i].m_Nombre,lst[i].m_Valor);
                        //Verificamos si los parametros son de salida
                        if (lst[i].m_Direccion == ParameterDirection.Output)
                            cmd.Parameters.Add(lst[i].m_Nombre, lst[i].m_TipoDato, lst[i].m_Tamaño).Direction = ParameterDirection.Output;
                    }
                    // Ejecuta el procedimiento almacenado
                    cmd.ExecuteNonQuery();

                    //Recuperamos los datos de Salida
                    for (int i = 0; i < lst.Count; i++){
                        if (cmd.Parameters[i].Direction == ParameterDirection.Output)
                            lst[i].m_Valor = cmd.Parameters[i].Value;
                    }
                }
            }
            catch (Exception ex){
                throw ex;
            }
        }
    }
}
