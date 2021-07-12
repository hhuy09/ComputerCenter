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
    class DanhGiaKhoaHoc
    {
        private string hocvien;
        private string khoahoc;
        private int sohphoc;
        private int sohpdat;
        private string capccbv;

        public string HocVien { get => hocvien; set => hocvien = value; }
        public string KhoaHoc { get => khoahoc; set => khoahoc = value; }
        public int SoHPHoc { get => sohphoc; set => sohphoc = value; }
        public int SoHPDat { get => sohpdat; set => sohpdat = value; }
        public string CapCCVB { get => capccbv; set => capccbv = value; }

        public static DataTable DGKhoaHoc(string MaHV)
        {
            return TruyCapDuLieu.DanhGiaKhoaHocDB.DGKH(MaHV);
        }

        public static DataTable DS_DG_HVKH()
        {
            return TruyCapDuLieu.DanhGiaKhoaHocDB.DS_Danhgia_HVKH();
        }

        public static bool DanhGiaKhoaHocHV(DanhGiaKhoaHoc dg)
        {
            string mahv = dg.HocVien;
            string kh = dg.KhoaHoc;
            return TruyCapDuLieu.DanhGiaKhoaHocDB.DanhGiaKH(mahv, kh);
        }

        public static DataTable DSCapVanBang()
        {
            return TruyCapDuLieu.DanhGiaKhoaHocDB.DSCCVB_KhoaHoc();
        }
    }
}
