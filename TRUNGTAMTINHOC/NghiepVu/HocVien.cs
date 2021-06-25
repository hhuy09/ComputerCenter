using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TRUNGTAMTINHOC.TruyCapDuLieu;

namespace TRUNGTAMTINHOC.NghiepVu
{
    class HocVien
    {
        private string MaHocVien;
        private string HoTen;
        private string GioiTinh;
        private string Email;
        private string SoDienThoai;
        private string MatKhau;

        public static int KiemTraDangNhap(string TenDN, string MatKhau)
        {
            int result = HocVienDB.DangNhap(TenDN, MatKhau);
            return result;
        }

        public static string Hoten(string Email)
        {
            return TruyCapDuLieu.HocVienDB.HoTen(Email);
        }

        public static string ID(string Email)
        {
            return TruyCapDuLieu.HocVienDB.ID(Email);
        }

        public static bool KiemTraTonTaiEmail(string Email)
        {
            return TruyCapDuLieu.HocVienDB.KTEmail(Email);
        }

        public static bool DangKyHocVien(string HoTen, string GioiTinh, string Email, string SDT, string MatKhau)
        {
            return TruyCapDuLieu.HocVienDB.DKHocVien(HoTen, GioiTinh, Email, SDT, MatKhau);
        }
    }
}
