using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace TRUNGTAMTINHOC.NghiepVu
{
    class LopChuyenDe
    {
        private string malopcd;
        private string chuyende;
        private string namky;
        private string nvtroly;
        private string ngayhoc;
        private int siso;
        private int dadangky;

        public string MaLopCD { get => malopcd; set => malopcd = value; }
        public string ChuyenDe { get => chuyende; set => chuyende = value; }
        public string NamKy { get => namky; set => namky = value; }
        public string NVTroLy { get => nvtroly; set => nvtroly = value; }
        public string NgayHoc { get => ngayhoc; set => ngayhoc = value; }
        public int SiSo { get => siso; set => siso = value; }
        public int DaDangKy { get => dadangky; set => dadangky = value; }

        public static DataTable DanhSachLopChuyenDe(LopChuyenDe lcd)
        {
            string NamKy = lcd.NamKy;
            string MaNV = lcd.NVTroLy;
            return TruyCapDuLieu.LopChuyenDeDB.DSLopCD(MaNV, NamKy);
        }

        public static DataTable DanhSachLopChuyenDe(NamKy namky)
        {
            string NamKy = namky.Namky;
            return TruyCapDuLieu.LopChuyenDeDB.DSLopCD(NamKy);
        }

    }
}
