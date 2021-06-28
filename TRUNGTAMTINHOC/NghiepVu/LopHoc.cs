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
    class LopHoc
    {

        private string malophoc;
        private string namky;
        private string hocphan;
        private string nvchuyenmon;
        private string lichhoc;
        private int siso;
        private int dadangki;

        public string MaLopHoc { get => malophoc; set => malophoc = value; }
        public string NamKy { get => namky; set => namky = value; }
        public string HocPhan { get => hocphan; set => hocphan = value; }
        public string NVChuyenMon { get => nvchuyenmon; set => nvchuyenmon = value; }
        public string LichHoc { get => lichhoc; set => lichhoc = value; }
        public int SiSo { get => siso; set => siso = value; }
        public int DaDangKi { get => dadangki; set => dadangki = value; }

        public LopHoc()
        {

        }

        public LopHoc(string malophoc, string namky, string hocphan, string nvchuyenmon, string lichhoc, int siso, int dadangky )
        {
            this.MaLopHoc = malophoc;
            this.NamKy = namky;
            this.HocPhan = hocphan;
            this.NVChuyenMon = nvchuyenmon;
            this.LichHoc = lichhoc;
            this.SiSo = siso;
            this.DaDangKi = dadangky;
        }

        public static DataTable DanhSachLopHocPhan (string MaHV, LopHoc LopHoc)
        {
            string NamKy = LopHoc.NamKy;
            return TruyCapDuLieu.LopHocDB.DSLopHocPhan(MaHV, NamKy);
        }

        public static DataTable DanhSachLopHoc(LopHoc LopHoc)
        {
            string MaNV = LopHoc.NVChuyenMon;
            string NamKy = LopHoc.NamKy;
            return TruyCapDuLieu.LopHocDB.DSLopHoc(MaNV, NamKy);
        }

        public static DataTable DanhSachLopHoc(KhoaDaoTao kdt)
        {
            string NamKy = kdt.NamKy;
            string MaNV = kdt.NVTroLy;
            return TruyCapDuLieu.LopHocDB.DSLopHocTroLy(MaNV, NamKy);
        }

        public static DataTable DanhSachLichHocHP(KhoaDaoTao kdt)
        {
            string NamKy = kdt.NamKy;
            string MaNV = kdt.NVTroLy;
            return TruyCapDuLieu.LopHocDB.DSLichHocHPTroLy(MaNV, NamKy);
        }
    }
}
