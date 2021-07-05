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
        private string hocvien;
        private string lopchuyende;
        private string ngayghidanh;

        public string HocVien { get => hocvien; set => hocvien = value; }
        public string LopChuyenDe { get => lopchuyende; set => lopchuyende = value; }
        public string NgayGhiDanh { get => ngayghidanh; set => ngayghidanh = value; }

        public static DataTable DanhSachDKCD(HocVien hv)
        {
            string MaHV = hv.MaHocVien;
            return TruyCapDuLieu.HV_LCDDB.DSDKCD(MaHV);
        }

        public static bool DangKyChuyenDe(HV_LCD hv)
        {
            string MaHV = hv.HocVien;
            string MaLopCD = hv.LopChuyenDe;
            return TruyCapDuLieu.HV_LCDDB.ThemDKCD(MaHV, MaLopCD);
        }

        public static bool HuyDangKyChuyenDe(HV_LCD hv)
        {
            string MaHV = hv.HocVien;
            string MaLopCD = hv.LopChuyenDe;
            return TruyCapDuLieu.HV_LCDDB.HuyDKCD(MaHV, MaLopCD);
        }
    }
}
