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
    class DanhGiaNHP
    {
        private string hocvien;
        private string nhomhocphan;
        private int sohphoc;
        private int sohpdat;
        private string capccbv;

        public string HocVien { get => hocvien; set => hocvien = value; }
        public string NhomHocPhan { get => nhomhocphan; set => nhomhocphan = value; }
        public int SoHPHoc { get => sohphoc; set => sohphoc = value; }
        public int SoHPDat { get => sohpdat; set => sohpdat = value; }
        public string CapCCVB { get => capccbv; set => capccbv = value; }

        public static DataTable DGNhomHocPhan(HocVien HV)
        {
            string MaHV = HV.MaHocVien;
            return TruyCapDuLieu.DanhGiaNHPDB.DGNHP(MaHV);
        }

        public static DataTable Danhsach_hocVien_NHP()
        {
            return TruyCapDuLieu.DanhGiaNHPDB.Danhsach_HV_NHP();
        }

        public static bool DanhGiaNhomHocPhan(DanhGiaNHP dg)
        {
            string mahv = dg.HocVien;
            string nhp = dg.NhomHocPhan;
            return TruyCapDuLieu.DanhGiaNHPDB.DanhGiaNHP(mahv, nhp);
        }

        public static DataTable DSCapChungChi()
        {
            return TruyCapDuLieu.DanhGiaNHPDB.DSCCVB_NhomHocPhan();
        }
    }
}
