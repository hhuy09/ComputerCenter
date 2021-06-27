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
    class HV_LCD
    {
        private string HocVien;
        private string HoTen;
        private string LopChuyenDe;
        private string NgayGhiDanh;

        public static DataTable DanhSachDKCD(string MaHV)
        {
            return TruyCapDuLieu.HV_LCDDB.DSDKCD(MaHV);
        }

        public static bool DangKyChuyenDe(string MaHV, string MaLopCD)
        {
            return TruyCapDuLieu.HV_LCDDB.ThemDKCD(MaHV, MaLopCD);
        }

        public static bool HuyDangKyChuyenDe(string MaHV, string MaLopCD)
        {
            return TruyCapDuLieu.HV_LCDDB.HuyDKCD(MaHV, MaLopCD);
        }
    }
}
