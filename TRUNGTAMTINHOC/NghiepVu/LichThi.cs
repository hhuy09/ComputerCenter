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
    class LichThi
    {
        private string malichthi;
        private string lophoc;
        private string ngaythi;
        private int lanthi;

        public string MaLichThi { get => malichthi; set => malichthi = value; }
        public string LopHoc { get => lophoc; set => lophoc = value; }
        public string NgayThi { get => ngaythi; set => ngaythi = value; }
        public int LanThi { get => lanthi; set => lanthi = value; }

        public static DataTable DSLichThiLai(HocVien hocvien, string NamKy)
        {
            string MaHV = hocvien.MaHocVien;
            return TruyCapDuLieu.LichThiDB.LichThiLai(MaHV, NamKy);
        }

        public static DataTable DSLichThiHP(LopHoc lophoc)
        {
            string MaNV = lophoc.NVChuyenMon;
            string NamKy = lophoc.NamKy;
            return TruyCapDuLieu.LichThiDB.LichThiHocPhanChuyenMon(MaNV, NamKy);
        }

        public static DataTable LichThiHP(KhoaDaoTao kdt)
        {
            string MaNV = kdt.NVTroLy;
            string NamKy = kdt.NamKy;
            return TruyCapDuLieu.LichThiDB.LichThiHocPhanTroLy(MaNV, NamKy);
        }

        public static DataTable LichThiLopHP(KhoaDaoTao kdt, string MaLH)
        {
            string MaNV = kdt.NVTroLy;
            string NamKy = kdt.NamKy;
            return TruyCapDuLieu.LichThiDB.LichThiHocPhanTroLy(MaNV, NamKy, MaLH);
        }

        public static bool ThemLichThiHP (LichThi LT)
        {
            string MaLH = LT.LopHoc;
            string NgayThi = LT.NgayThi;
            return TruyCapDuLieu.LichThiDB.ThemLichThi(MaLH, NgayThi);
        }

        public static bool XoaLichThiHP(LichThi LT)
        {
            string MaLT = LT.MaLichThi;
            return TruyCapDuLieu.LichThiDB.XoaLichThi(MaLT);
        }

        public static bool CapNhatLichThiHP(LichThi LT)
        {
            string MaLT = LT.MaLichThi;
            string NgayThi = LT.NgayThi;
            return TruyCapDuLieu.LichThiDB.CapNhatLichThi(MaLT, NgayThi);
        }
    }

}
