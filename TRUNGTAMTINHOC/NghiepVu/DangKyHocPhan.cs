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
        private string hocvien;
        private string lophoc;
        private int solandathi;

        public string HocVien { get => hocvien; set => hocvien = value; }
        public string LopHoc { get => lophoc; set => lophoc = value; }
        public int SoLanDaThi { get => solandathi; set => solandathi = value; }

        public static DataTable DanhSachDKHP(HocVien HocVien, string NamKy)
        {
            string MaHV = HocVien.MaHocVien;
            return TruyCapDuLieu.DangKyHocPhanDB.DSDKHP(MaHV, NamKy);
        }

        public static bool HVDangKyHocPhan(DangKyHocPhan DKHP)
        {
            string MaHV = DKHP.HocVien;
            string MaLH = DKHP.LopHoc;
            return TruyCapDuLieu.DangKyHocPhanDB.DKHP(MaHV, MaLH);
        }

        public static bool HVHuyDangKyHocPhan(DangKyHocPhan DKHP)
        {
            string MaHV = DKHP.HocVien;
            string MaLH = DKHP.LopHoc;
            return TruyCapDuLieu.DangKyHocPhanDB.HuyDKHP(MaHV, MaLH);
        }

        public static DataTable DanhSachHocVienLopHoc(DangKyHocPhan DKHP)
        {
            string MaLH = DKHP.LopHoc;
            return TruyCapDuLieu.DangKyHocPhanDB.DSHocVienLopHoc(MaLH);
        }

        
    }
}
