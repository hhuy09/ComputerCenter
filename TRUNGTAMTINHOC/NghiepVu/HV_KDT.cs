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
    class HV_KDT
    {
        private string MaLopDT;
        private string KhoaHoc;
        private string NamKy;
        private string NVTroLy;
        private string NgayKhaiGiang;
        private string NgayThiTN;
        private int SiSo;
        private int DaDangKy;

        public static DataTable DanhSachDKKH(string MaHV)
        {
            return TruyCapDuLieu.HV_KDTDB.DSDKKH(MaHV);
        }

        public static bool DangKyKhoaHoc(string MaHV, string MaLopDT)
        {
            return TruyCapDuLieu.HV_KDTDB.ThemDKKH(MaHV, MaLopDT);
        }

        public static bool HuyDangKyKhoaHoc(string MaHV, string MaLopDT)
        {
            return TruyCapDuLieu.HV_KDTDB.HuyDKKH(MaHV, MaLopDT);
        }

        public static DataTable BangDiemTotNghiep(string MaHV, string NamKy)
        {
            return TruyCapDuLieu.HV_KDTDB.BangDiemTN(MaHV, NamKy);
        }
    }
}
