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
    class LopHocDB
    {
        public static DataTable DSLopHocPhan (string MaHV, string NamKy)
        {
            string connectString = ConfigurationManager.ConnectionStrings["TTTH"].ConnectionString.ToString();
            SqlConnection con = new SqlConnection(connectString);
            con.Open();

            try
            {
                string sql = "EXEC SP_DANHSACHLOP '" + MaHV + "', '" + NamKy + "'";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                return dt;
            }
            catch (Exception error)
            {
                string errorStr = error.ToString();
                string[] arrStr0 = errorStr.Split(':');
                string[] arrStr = arrStr0[1].Split('\n');
                MessageBox.Show(arrStr[0].ToString());
                return null;
            }
        }

        public static DataTable DSLopHoc(string MaNV, string NamKy)
        {
            string connectString = ConfigurationManager.ConnectionStrings["TTTH"].ConnectionString.ToString();
            SqlConnection con = new SqlConnection(connectString);
            con.Open();

            try
            {
                string sql = "EXEC sp_danhsach_LH '" + MaNV + "', '" + NamKy + "'";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                return dt;
            }
            catch (Exception error)
            {
                string errorStr = error.ToString();
                string[] arrStr0 = errorStr.Split(':');
                string[] arrStr = arrStr0[1].Split('\n');
                MessageBox.Show(arrStr[0].ToString());
                return null;
            }
        }

        public static DataTable DSLopHocTroLy (string MaNV, string NamKy)
        {
            string connectString = ConfigurationManager.ConnectionStrings["TTTH"].ConnectionString.ToString();
            SqlConnection con = new SqlConnection(connectString);
            con.Open();

            try
            {
                string sql = "EXEC SP_DSHP_TROLY '" + MaNV + "', '" + NamKy + "'";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                return dt;
            }
            catch (Exception error)
            {
                string errorStr = error.ToString();
                string[] arrStr0 = errorStr.Split(':');
                string[] arrStr = arrStr0[1].Split('\n');
                MessageBox.Show(arrStr[0].ToString());
                return null;
            }
        }

        public static DataTable DSLichHocHPTroLy(string MaNV, string NamKy)
        {
            string connectString = ConfigurationManager.ConnectionStrings["TTTH"].ConnectionString.ToString();
            SqlConnection con = new SqlConnection(connectString);
            con.Open();

            try
            {
                string sql = "EXEC SP_DSLICHHOC '" + MaNV + "', '" + NamKy + "'";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                return dt;
            }
            catch (Exception error)
            {
                string errorStr = error.ToString();
                string[] arrStr0 = errorStr.Split(':');
                string[] arrStr = arrStr0[1].Split('\n');
                MessageBox.Show(arrStr[0].ToString());
                return null;
            }
        }
    }
}
