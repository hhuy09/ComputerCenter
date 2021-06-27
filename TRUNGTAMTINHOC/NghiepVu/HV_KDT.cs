using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TRUNGTAMTINHOC.NghiepVu
{
    class HV_KDT
    { 
        private string hocvien;
        private string lopdt;
        private string ngayghidanh;
        private int tongsohp;
        private int hocphi;
        private string nophocphi;
        private float diemtotnghiep;
        private string capccvb;

        public string HocVien { get => hocvien; set => hocvien = value; }
        public string LopDT { get => lopdt; set => lopdt = value; }
        public string NgayGhiDanh { get => ngayghidanh; set => ngayghidanh = value; }
        public int TongSoHP { get => tongsohp; set => tongsohp = value; }
        public int HocPhi { get => hocphi; set => hocphi = value; }
        public string NopHocPhi { get => nophocphi; set => nophocphi = value; }
        public float DiemTotNghiep { get => diemtotnghiep; set => diemtotnghiep = value; }
        public string CapCCVB { get => capccvb; set => capccvb = value; }

        public HV_KDT()
        {

        }

        public HV_KDT(string hocvien, string lopdt, string ngayghidanh, int tongsohp, int hocphi, string nophocphi, float diemtotnghiep, string capccvb)
        {
            this.HocVien = hocvien;
            this.LopDT = lopdt;
            this.NgayGhiDanh = ngayghidanh;
            this.TongSoHP = tongsohp;
            this.HocPhi = hocphi;
            this.NopHocPhi = nophocphi;
            this.DiemTotNghiep = diemtotnghiep;
            this.CapCCVB = capccvb;
        }

        //Chuc nang Hoc vien: Dang ky khoa hoc - chuyen de
        public static DataTable DanhSachDKKH(HV_KDT HV_KDT)
        {
            string MaHV = HV_KDT.HocVien;
            return TruyCapDuLieu.HV_KDTDB.DSDKKH(MaHV);
        }

        public static bool DangKyKhoaHoc(HV_KDT HV_KDT)
        {
            string MaHV = HV_KDT.HocVien;
            string MaLopDT = HV_KDT.LopDT;
            return TruyCapDuLieu.HV_KDTDB.ThemDKKH(MaHV, MaLopDT);
        }

        public static bool HuyDangKyKhoaHoc(HV_KDT HV_KDT)
        {
            string MaHV = HV_KDT.HocVien;
            string MaLopDT = HV_KDT.LopDT;
            return TruyCapDuLieu.HV_KDTDB.HuyDKKH(MaHV, MaLopDT);
        }

        //Chuc nang Hoc vien: Thong tin hoc vien
        public static DataTable BangDiemTotNghiep(HV_KDT HV_KDT, string NamKy)
        {
            string MaHV = HV_KDT.HocVien;
            return TruyCapDuLieu.HV_KDTDB.BangDiemTN(MaHV, NamKy);
        }

        //Chuc nang NV chuyen môn: Quan ly lop hoc
        public static DataTable DanhSachHocVien(HV_KDT HV_KDT)
        {
            string LopDT = HV_KDT.LopDT;
            return TruyCapDuLieu.HV_KDTDB.DSHVien(LopDT);
        }

        public static DataTable DanhSachHocVienThiTotNghiep(HV_KDT HV_KDT, string NamKy)
        {
            string MaHV = HV_KDT.HocVien;
            return TruyCapDuLieu.HV_KDTDB.DSHocVienThiTotNghiep(MaHV, NamKy);
        }
    }
}
