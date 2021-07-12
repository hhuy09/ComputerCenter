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
    class KhoaDaoTao
    {
        private string malopdt;
        private string khoahoc;
        private string namky;
        private string nvtroly;
        private string ngaykhaigiang;
        private string ngaythitn;
        private int siso;
        private int dadangky;

        public string MaLopDT { get => malopdt; set => malopdt = value; }
        public string KhoaHoc { get => khoahoc; set => khoahoc = value; }
        public string NamKy { get => namky; set => namky = value; }
        public string NVTroLy { get => nvtroly; set => nvtroly = value; }
        public string NgayKhaiGiang { get => ngaykhaigiang; set => ngaykhaigiang = value; }
        public string NgayThiTN { get => ngaythitn; set => ngaythitn = value; }
        public int SiSo { get => siso; set => siso = value; }
        public int DaDangKy { get => dadangky; set => dadangky = value; }

        public static DataTable DanhSachLichThiTotNghiep(KhoaDaoTao kdt)
        {
            string MaNV = kdt.NVTroLy;
            string NamKy = kdt.NamKy;
            return TruyCapDuLieu.KhoaDaoTaoDB.DSLichThiTN(MaNV, NamKy);
        }

        public static DataTable DanhSachLichThiTNTroLy(KhoaDaoTao kdt)
        {
            string MaNV = kdt.NVTroLy;
            string NamKy = kdt.NamKy;
            return TruyCapDuLieu.KhoaDaoTaoDB.DSLichThiTNTroLy(MaNV, NamKy);
        }

        public static DataTable CapNhatLichThiTNTroLy(KhoaDaoTao kdt)
        {
            string MaLDT = kdt.MaLopDT;
            string NgayThi = kdt.NgayThiTN;
            return TruyCapDuLieu.KhoaDaoTaoDB.CapNhatLTTN(MaLDT, NgayThi);
        }

        public static DataTable DanhSachLopDaoTao(KhoaDaoTao kdt)
        {
            string MaNV = kdt.NVTroLy;
            string NamKy = kdt.NamKy;
            return TruyCapDuLieu.KhoaDaoTaoDB.DSLopDaoTao(MaNV, NamKy);
        }

        public static DataTable DanhSachTatCaLopDaoTao(NamKy namky)
        {
            string NamKy = namky.Namky;
            return TruyCapDuLieu.KhoaDaoTaoDB.DSTatCaLDT(NamKy);
        }

        public static DataTable DanhSachLopDaoTao(NamKy namky)
        {
            string NamKy = namky.Namky;
            return TruyCapDuLieu.KhoaDaoTaoDB.DSLopDaoTao(NamKy);
        }

        public static bool ThemLopDaoTao(KhoaDaoTao kdt)
        {
            string MaLDT = kdt.MaLopDT;
            string KhHoc = kdt.KhoaHoc;
            string NamKy = kdt.NamKy;
            string NVTL = kdt.NVTroLy;
            string NKG = kdt.NgayKhaiGiang;
            int SS = kdt.SiSo;
            return TruyCapDuLieu.KhoaDaoTaoDB.ThemLDT(MaLDT, KhHoc, NamKy, NVTL, NKG, SS);
        }

        public static bool XoaLopDaoTao(KhoaDaoTao kdt)
        {
            string MaLDT = kdt.MaLopDT;
            return TruyCapDuLieu.KhoaDaoTaoDB.XoaLDT(MaLDT);
        }

        public static bool CapNhatLopDaoTao(KhoaDaoTao kdt)
        {
            string MaLDT = kdt.MaLopDT;
            string KhHoc = kdt.KhoaHoc;
            string NamKy = kdt.NamKy;
            string NKG = kdt.NgayKhaiGiang;
            int SS = kdt.SiSo;
            return TruyCapDuLieu.KhoaDaoTaoDB.CapNhatLDT(MaLDT, KhHoc, NamKy, NKG, SS);
        }
    }
}
