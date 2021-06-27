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
    class NamKyDB
    {
        public static DataTable Load_DB_Combobox()
        {
            string connectString = ConfigurationManager.ConnectionStrings["TTTH"].ConnectionString.ToString();
            SqlConnection con = new SqlConnection(connectString);
            con.Open();
            SqlCommand commnad = new SqlCommand("SELECT Namky FROM dbo.NamKy", con);
            SqlDataAdapter da = new SqlDataAdapter(commnad);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
    }
}
