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
    class DanhGiaNHP
    {
        public static DataTable DGNhomHocPhan(string MaHV)
        {
            return TruyCapDuLieu.DanhGiaNHPDB.DGNHP(MaHV);
        }
    }
}
