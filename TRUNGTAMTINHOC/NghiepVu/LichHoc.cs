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
    class LichHoc
    {
        public static DataTable DanhSachLichHoc()
        {
            return TruyCapDuLieu.LichHocDB.DSLichHoc();
        }

        public static DataTable TimKiemLichHoc(string MaLopHoc, string HocPhan, string NVChuyenMon)
        {
            return TruyCapDuLieu.LichHocDB.TimKiem(MaLopHoc, HocPhan, NVChuyenMon);
        }

        public static bool ThemLichHoc(string MaLopHoc, string NamKy, string HocPhan, string NVChuyenMon, string LichHoc, string SiSo)
        {
            return TruyCapDuLieu.LichHocDB.Them(MaLopHoc, NamKy, HocPhan, NVChuyenMon, LichHoc, SiSo);
        }
        public static bool XoaLichHoc(string MaLopHoc)
        {
            return TruyCapDuLieu.LichHocDB.Xoa(MaLopHoc);
        }
        public static bool SuaLichHoc(string MaLopHoc, string NamKy, string LichHoc, string SiSo)
        {
            return TruyCapDuLieu.LichHocDB.Sua(MaLopHoc, NamKy, LichHoc, SiSo);
        }
    }
}
