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
        private string hocvien;
        private string lichthi;
        private string lophoc;
        private float diemthihp;
        private string dat;

        public string HocVien { get => hocvien; set => hocvien = value; }
        public string LichThi { get => lichthi; set => lichthi = value; }
        public string LopHoc { get => lophoc; set => lophoc = value; }
        public float DiemThiHP { get => diemthihp; set => diemthihp = value; }
        public string Dat { get => dat; set => dat = value; }


        public static DataTable BangDiemHocVien (HocVien HocVien, string NamKy)
        {
            string MaHV = HocVien.MaHocVien;
            return TruyCapDuLieu.DiemThiDB.BangDiemHP(MaHV, NamKy);
        }

        public static bool DangKyThiLai(DiemThi DiemThi)
        {
            string MaHV = DiemThi.HocVien;
            string MaLT = DiemThi.LichThi;
            return TruyCapDuLieu.DiemThiDB.DKThiLai(MaHV, MaLT);
        }

        public static bool HuyDangKyThiLai(DiemThi DiemThi)
        {
            string MaHV = DiemThi.HocVien;
            string MaLT = DiemThi.LichThi;
            return TruyCapDuLieu.DiemThiDB.HuyDKThiLai(MaHV, MaLT);
        }
        public static DataTable Diem_HocPhan_HVKH(DiemThi DiemThi)
        {
            string MaHV = DiemThi.HocVien;
            string MaLT = DiemThi.LichThi;
            return TruyCapDuLieu.DiemThiDB.DiemHP_HV_KH(MaHV, MaLT);
        }
        public static DataTable DIEM_HP_NHP(HocVien HocVien, string MaNHP)
        {
            string MaHV = HocVien.MaHocVien;
            return TruyCapDuLieu.DiemThiDB.DiemHP_HV(MaHV, MaNHP);
        }

        public static DataTable DanhSachHocVienThiHocPhan(LichThi lichThi)
        {
            string MaLT = lichThi.MaLichThi;
            return TruyCapDuLieu.DiemThiDB.DSHocVienThiHocPhan(MaLT);
        }

        public static bool CapNhatDiemThiHP(DiemThi DiemThi)
        {
            string MaHV = DiemThi.HocVien;
            string MaLT = DiemThi.LichThi;
            string MaLH = DiemThi.LopHoc;
            float Diem = DiemThi.DiemThiHP;
            return TruyCapDuLieu.DiemThiDB.CapNhatDiemHP(MaHV, MaLT, MaLH, Diem);
        }
    }
}
