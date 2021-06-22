using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Data;

namespace TRUNGTAMTINHOC.TruyCapDuLieu
{
    class HocVienDB
    {
        public static int DangNhap(string TenDN, string MatKhau)
        {
            string connectString = ConfigurationManager.ConnectionStrings["TTTH"].ConnectionString.ToString();
            SqlConnection con = new SqlConnection(connectString);
            con.Open();

            try
            {

                SqlCommand cmd = new SqlCommand("SP_DANGNHAP", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter tendn = new SqlParameter("@TENDN", SqlDbType.NVarChar, 100);
                SqlParameter matkhau = new SqlParameter("@MATKHAU", SqlDbType.NVarChar, 20);
                SqlParameter type = new SqlParameter("@TYPE", SqlDbType.Int);
                tendn.Value = TenDN;
                matkhau.Value = MatKhau;
                type.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(tendn);
                cmd.Parameters.Add(matkhau);
                cmd.Parameters.Add(type);
                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                string ty = type.Value.ToString();
                con.Close();
                MessageBox.Show("Đăng nhập thành công.");

                if (ty == "0")
                {
                    return 0;
                }
                else if (ty == "1")
                {
                    return 1;
                }
                else if (ty == "2")
                {
                    return 2;
                }
                else if (ty == "3")
                {
                    return 3;
                }
                else if (ty == "4")
                {
                    return 4;
                }
                else
                {
                    return -1;
                }
            }
            catch (Exception error)
            {
                string errorStr = error.ToString();
                string[] arrStr0 = errorStr.Split(':');
                string[] arrStr = arrStr0[1].Split('\n');
                MessageBox.Show(arrStr[0].ToString() + "\nĐăng nhập thất bại.");
                return -1;
            }        
        }

        public static string HoTen (string Email)
        {
            string connectString = ConfigurationManager.ConnectionStrings["TTTH"].ConnectionString.ToString();
            SqlConnection con = new SqlConnection(connectString);
            con.Open();
            try
            {

                SqlCommand cmd = new SqlCommand("SP_TTUSER", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter email = new SqlParameter("@EMAIL", SqlDbType.NVarChar, 100);
                SqlParameter hoten = new SqlParameter("@HOTEN", SqlDbType.NVarChar, 100);
                SqlParameter id = new SqlParameter("@ID", SqlDbType.NVarChar, 20);
                email.Value = Email;
                hoten.Direction = ParameterDirection.Output;
                id.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(email);
                cmd.Parameters.Add(hoten);
                cmd.Parameters.Add(id);
                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                string name = hoten.Value.ToString();
                con.Close();

                return name;
                
            }
            catch
            {           
                return null;
            }

        }

        public static string ID(string Email)
        {
            string connectString = ConfigurationManager.ConnectionStrings["TTTH"].ConnectionString.ToString();
            SqlConnection con = new SqlConnection(connectString);
            con.Open();
            try
            {

                SqlCommand cmd = new SqlCommand("SP_TTUSER", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter email = new SqlParameter("@EMAIL", SqlDbType.NVarChar, 100);
                SqlParameter hoten = new SqlParameter("@HOTEN", SqlDbType.NVarChar, 100);
                SqlParameter id = new SqlParameter("@ID", SqlDbType.NVarChar, 20);
                email.Value = Email;
                hoten.Direction = ParameterDirection.Output;
                id.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(email);
                cmd.Parameters.Add(hoten);
                cmd.Parameters.Add(id);
                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                string iden = id.Value.ToString();
                con.Close();

                return iden;

            }
            catch
            {
                return null;
            }

        }
    }
}
