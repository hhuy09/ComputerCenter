using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Configuration;


namespace TRUNGTAMTINHOC.TruyCapDuLieu
{
    public class DataProvider
    {
        //tao 1 instance duy nhat
        //cho co duy nhat 1 the hien cua dataprovider ton tai trong chuong trinh
        private static DataProvider instance;//ctrl + r +e
        public static DataProvider Instance
        {
            get { if (instance == null) instance = new DataProvider(); return DataProvider.instance; }
            private set => instance = value;
        }

       
        public DataTable ExecuteQuery(string query, object[] parameter = null)
        {
            DataTable data = new DataTable();
            string connectString = ConfigurationManager.ConnectionStrings["TTTH"].ConnectionString.ToString();
            using (SqlConnection connection = new SqlConnection(connectString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);

                if (parameter != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }

                SqlDataAdapter adapter = new SqlDataAdapter(command);

                adapter.Fill(data);
                connection.Close();

            }
            return data;
        }
        //tra ra so dong thanh cong
        public int ExecuteNonQuery(string query, object[] parameter = null)
        {
            int data = 0;
            string connectString = ConfigurationManager.ConnectionStrings["TTTH"].ConnectionString.ToString();
            using (SqlConnection connection = new SqlConnection(connectString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);

                if (parameter != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }
                data = command.ExecuteNonQuery();
                //SqlDataAdapter adapter = new SqlDataAdapter(command);

                // adapter.Fill(data);
                connection.Close();

            }
            return data;
        }

        //dem so luong
        public object ExecuteScalar(string query, object[] parameter = null)
        {
            object data = 0;
            string connectString = ConfigurationManager.ConnectionStrings["TTTH"].ConnectionString.ToString();
            using (SqlConnection connection = new SqlConnection(connectString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);

                if (parameter != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }

                data = command.ExecuteScalar();
                connection.Close();

            }
            return data;
        }
    }
}
