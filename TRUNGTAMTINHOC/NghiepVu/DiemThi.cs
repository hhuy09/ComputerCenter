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
    class DiemThi
    {
        public static DataTable BangDiemHocVien (string MaHV, string NamKy)
        {
            return TruyCapDuLieu.DiemThiDB.BangDiemHP(MaHV, NamKy);
        }

        public static bool DangKyThiLai(string MaHV, string MaLT)
        {
            return TruyCapDuLieu.DiemThiDB.DKThiLai(MaHV, MaLT);
        }

        public static bool HuyDangKyThiLai(string MaHV, string MaLT)
        {
            return TruyCapDuLieu.DiemThiDB.HuyDKThiLai(MaHV, MaLT);
        }
        public static DataTable Diem_HocPhan_HVKH(string MaHV, string MaLT)
        {
            return TruyCapDuLieu.DiemThiDB.DiemHP_HV_KH(MaHV, MaLT);
        }
        public static DataTable DIEM_HP_NHP(string Mahv, string MaNHP)
        {
            return TruyCapDuLieu.DiemThiDB.DiemHP_HV(Mahv, MaNHP);
        }
    }
}
