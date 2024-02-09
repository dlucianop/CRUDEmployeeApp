using CRUDEmployee.Models;
using System.Data.SqlClient;
using System.Data;
using System.Net.NetworkInformation;
using NuGet.Protocol.Plugins;

namespace CRUDEmployee.Datos
{
    public class employeeDatos
    {
        public List<EmployeeModel> Listar()
        {
            var oLista = new List<EmployeeModel>();
            var cn = new Conexion();

            using (var conexion = new SqlConnection(cn.getCadenaSQL()))
            {
                conexion.Open();
                SqlCommand cmd = new SqlCommand("RetrieveEmployees", conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        oLista.Add(new EmployeeModel()
                        {
                            ID = Convert.ToInt32(dr["ID"]),
                            NameEmployee = dr["NameEmployee"].ToString(),
                            LastName = dr["LastName"].ToString(),
                            RFC = dr["RFC"].ToString(),
                            BornDate = Convert.IsDBNull(dr["BornDate"]) ? (DateTime?)null : Convert.ToDateTime(dr["BornDate"]),
                            Status = dr["EmployeeStatus"].ToString()
                        });
                    }
                }
            }
            return oLista;
        }
        public List<EmployeeModel> Filtrar(string nombreFiltro)
        {
            var oLista = new List<EmployeeModel>();
            var cn = new Conexion();

            using (var conexion = new SqlConnection(cn.getCadenaSQL()))
            {
                conexion.Open();
                SqlCommand command = new SqlCommand("RetrieveEmployees", conexion);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@nameFilter", nombreFiltro);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        EmployeeModel empleado = new EmployeeModel
                        {
                            ID = Convert.ToInt32(reader["ID"]),
                            NameEmployee = reader["NameEmployee"].ToString(),
                            LastName = reader["LastName"].ToString(),
                            RFC = reader["RFC"].ToString(),
                            BornDate = Convert.IsDBNull(reader["BornDate"]) ? (DateTime?)null : Convert.ToDateTime(reader["BornDate"]),
                            Status = reader["EmployeeStatus"].ToString()
                        };
                        oLista.Add(empleado);
                    }


                }
                return oLista;
            }
        }

        public EmployeeModel Obtener(string NameEmployee)
        {
            var oEmployee = new EmployeeModel();
            var cn = new Conexion();

            using (var conexion = new SqlConnection(cn.getCadenaSQL()))
            {
                conexion.Open();
                SqlCommand cmd = new SqlCommand("get_employee", conexion);
                cmd.Parameters.AddWithValue("NameEmployee", NameEmployee);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        oEmployee.ID = Convert.ToInt32(dr["ID"]);
                        oEmployee.NameEmployee = dr["NameEmployee"].ToString();
                        oEmployee.LastName = dr["LastName"].ToString();
                        oEmployee.RFC = dr["RFC"].ToString();
                        oEmployee.BornDate = dr.IsDBNull(dr.GetOrdinal("BornDate")) ? null : (DateTime?)dr["BornDate"];
                        oEmployee.Status = dr["EmployeeStatus"].ToString();
                    }
                }

            }
            return oEmployee;
        }

        public EmployeeModel ObtenerPorRFC(string rfc)
        {
            var oEmployee = new EmployeeModel();
            var cn = new Conexion();

            using (var conexion = new SqlConnection(cn.getCadenaSQL()))
            {
                conexion.Open();
                SqlCommand cmd = new SqlCommand("empleado_rfc", conexion);
                cmd.Parameters.AddWithValue("@RFC", rfc);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        oEmployee.ID = Convert.ToInt32(dr["ID"]);
                        oEmployee.NameEmployee = dr["NameEmployee"].ToString();
                        oEmployee.LastName = dr["LastName"].ToString();
                        oEmployee.RFC = dr["RFC"].ToString();
                        oEmployee.BornDate = dr.IsDBNull(dr.GetOrdinal("BornDate")) ? null : (DateTime?)dr["BornDate"];
                        oEmployee.Status = dr["EmployeeStatus"].ToString();
                    }
                }
            }
            return oEmployee;
        }

        public bool Guardar(EmployeeModel oemployee)
        {
            bool rpta;
            try
            {
                var cn = new Conexion();

                using (var conexion = new SqlConnection(cn.getCadenaSQL()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("alta_empleado", conexion);
                    cmd.Parameters.AddWithValue("NameEmployee", oemployee.NameEmployee);
                    cmd.Parameters.AddWithValue("LastName", oemployee.LastName);
                    cmd.Parameters.AddWithValue("RFC", oemployee.RFC);
                    cmd.Parameters.AddWithValue("BornDate", oemployee.BornDate);
                    cmd.Parameters.AddWithValue("EmployeeStatus", oemployee.Status);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.ExecuteNonQuery();
                    rpta = true;
                }
            }
            catch (Exception ex) 
            {
                string msg = ex.Message;
                rpta=false;
                Console.WriteLine(msg);
            }
            return rpta;
        }

        public bool Editar(EmployeeModel oemployee)
        {
            bool rpta;
            try
            {
                var cn = new Conexion();

                using (var conexion = new SqlConnection(cn.getCadenaSQL()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("modificar_empleado", conexion);
                    cmd.Parameters.AddWithValue("ID", oemployee.ID);
                    cmd.Parameters.AddWithValue("NameEmployee", oemployee.NameEmployee);
                    cmd.Parameters.AddWithValue("LastName", oemployee.LastName);
                    cmd.Parameters.AddWithValue("RFC", oemployee.RFC);
                    cmd.Parameters.AddWithValue("BornDate", oemployee.BornDate);
                    cmd.Parameters.AddWithValue("EmployeeStatus", oemployee.Status);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.ExecuteNonQuery();
                    rpta = true;
                }
            }
            catch (Exception ex)
            {
                // Agregar registro de seguimiento para capturar la excepción
                Console.WriteLine("Error en el método Editar: " + ex.Message);
                rpta = false;
            }

            return rpta;
        }


        public bool Eliminar(EmployeeModel oemployee)
        {
            bool rpta;
            try
            {
                var cn = new Conexion();

                using (var conexion = new SqlConnection(cn.getCadenaSQL()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("baja_empleado", conexion);
                    cmd.Parameters.AddWithValue("ID", oemployee.ID);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery();
                    rpta = true;
                }
            }
            catch (Exception ex)
            {
                string msg = ex.Message;
                rpta = false;
            }
            return rpta;
        }


    }
}
