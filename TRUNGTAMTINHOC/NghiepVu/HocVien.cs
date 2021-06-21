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
    }
}
