using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Data;


namespace TRUNGTAMTINHOC.NghiepVu
{
    class DangKyHocPhan
    {
        public static DataTable DanhSachDKHP(string MaHV, string NamKy)
        {
            return TruyCapDuLieu.DangKyHocPhanDB.DSDKHP(MaHV, NamKy);
        }
    }
}
