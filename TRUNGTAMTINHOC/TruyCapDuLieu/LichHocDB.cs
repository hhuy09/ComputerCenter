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
    class LichHocDB
    {
        public static DataTable DSLichHoc()
        {
            string connectString = ConfigurationManager.ConnectionStrings["TTTH"].ConnectionString.ToString();
            SqlConnection con = new SqlConnection(connectString);
            con.Open();

            try
            {
                string sql = "EXEC SP_DSLICHHOC";
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
        public static DataTable TimKiem(string MaLopHoc, string HocPhan, string NVChuyenMon)
        {
            string connectString = ConfigurationManager.ConnectionStrings["TTTH"].ConnectionString.ToString();
            SqlConnection con = new SqlConnection(connectString);
            con.Open();

            try
            {
                string sql = "EXEC SP_SEARCH_LICHHOC '" + MaLopHoc + "', '" + HocPhan + "', '" + NVChuyenMon + "'";
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

        public static bool Them(string MaLopHoc, string NamKy, string HocPhan, string NVChuyenMon, string LichHoc, string SiSo)
        {
            string connectString = ConfigurationManager.ConnectionStrings["TTTH"].ConnectionString.ToString();
            SqlConnection con = new SqlConnection(connectString);
            con.Open();

            try
            {
                string sql = "EXEC SP_INS_LICHHOC_LOPHOC '" + MaLopHoc + "', N'" + NamKy + "', '" + HocPhan + "', '" + NVChuyenMon + "', '" + LichHoc + "', " + SiSo + "";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();
                MessageBox.Show("Thêm lịch học thành công.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                con.Close();
                return true;
            }
            catch (Exception error)
            {
                string errorStr = error.ToString();
                string[] arrStr0 = errorStr.Split(':');
                string[] arrStr = arrStr0[1].Split('\n');
                MessageBox.Show(arrStr[0].ToString() + "\nThêm lịch học không thành công.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return false;
            }

        }

        public static bool Xoa(string MaLopHoc)
        {
            string connectString = ConfigurationManager.ConnectionStrings["TTTH"].ConnectionString.ToString();
            SqlConnection con = new SqlConnection(connectString);
            con.Open();

            try
            {
                string sql = "EXEC SP_DEL_LICHHOC '" + MaLopHoc + "'";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();
                MessageBox.Show("Xóa lịch học thành công.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                con.Close();
                return true;
            }
            catch (Exception error)
            {
                string errorStr = error.ToString();
                string[] arrStr0 = errorStr.Split(':');
                string[] arrStr = arrStr0[1].Split('\n');
                MessageBox.Show(arrStr[0].ToString() + "\nXóa lịch học không thành công.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return false;
            }
        }
        public static bool Sua(string MaLopHoc, string NamKy, string LichHoc, string SiSo)
        {
            string connectString = ConfigurationManager.ConnectionStrings["TTTH"].ConnectionString.ToString();
            SqlConnection con = new SqlConnection(connectString);
            con.Open();

            try
            {
                string sql = "EXEC SP_UPDATE_LICHHOC '" + MaLopHoc + "', '" + NamKy + "', N'" + LichHoc + "', '" + SiSo + "'";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();
                MessageBox.Show("Sửa lịch học thành công.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                con.Close();
                return true;
            }
            catch (Exception error)
            {
                string errorStr = error.ToString();
                string[] arrStr0 = errorStr.Split(':');
                string[] arrStr = arrStr0[1].Split('\n');
                MessageBox.Show(arrStr[0].ToString() + "\nSửa lịch học không thành công.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return false;
            }
        }
    }
}
