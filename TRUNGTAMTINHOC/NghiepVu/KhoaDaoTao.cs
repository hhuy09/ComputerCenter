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

        //public static DataTable DanhSachThiTotNghiep(string MaNV, string NamKy)
        //{
        //    return TruyCapDuLieu.KhoaDaoTaoDB.DSThiTotNghiep(MaNV, NamKy);
        //}

        public static DataTable DanhSachLichThiTotNghiep(string MaNV, string NamKy)
        {
            return TruyCapDuLieu.KhoaDaoTaoDB.DSLichThiTN(MaNV, NamKy);
        }
    }
}
