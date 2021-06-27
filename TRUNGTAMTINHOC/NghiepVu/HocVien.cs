using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Data;
using TRUNGTAMTINHOC.TruyCapDuLieu;

namespace TRUNGTAMTINHOC.NghiepVu
{
    class HocVien
    {
        private string mahocvien;
        private string hoten;
        private string gioitinh;
        private string email;
        private string sodienthoai;
        private string matkhau;

        public string MaHocVien { get => mahocvien; set => mahocvien = value; }
        public string HoTen { get => hoten; set => hoten = value; }
        public string GioiTinh { get => gioitinh; set => gioitinh = value; }
        public string Email { get => email; set => email = value; }
        public string SoDienThoai { get => sodienthoai; set => sodienthoai = value; }
        public string MatKhau { get => matkhau; set => matkhau = value; }

        public static int KiemTraDangNhap(HocVien HocVien)
        {
            string TenDN = HocVien.Email;
            string MatKhau = HocVien.MatKhau;
            int result = HocVienDB.DangNhap(TenDN, MatKhau);
            return result;
        }

        public static string HotenHocVien(HocVien HocVien)
        {
            string Email = HocVien.Email;
            return TruyCapDuLieu.HocVienDB.HoTen(Email);
        }

        public static string IDHocVien(HocVien HocVien)
        {
            string ID = HocVien.Email;
            return TruyCapDuLieu.HocVienDB.ID(ID);
        }

        public static bool KiemTraTonTaiEmail(HocVien HocVien)
        {
            string Email = HocVien.Email;
            return TruyCapDuLieu.HocVienDB.KTEmail(Email);
        }

        public static bool DangKyHocVien(HocVien HocVien)
        {
            string HoTen = HocVien.HoTen;
            string GioiTinh = HocVien.GioiTinh;
            string Email = HocVien.Email;
            string SDT = HocVien.SoDienThoai;
            string MatKhau = HocVien.MatKhau;
            return TruyCapDuLieu.HocVienDB.DKHocVien(HoTen, GioiTinh, Email, SDT, MatKhau);
        }





    }
}
