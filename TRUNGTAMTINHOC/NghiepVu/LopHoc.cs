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

        private string MaLopHoc;
        private string LopDaoTao;
        private string HocPhan;
        private string NVChuyenMon;
        private string LichHoc;
        private string SiSo;
        private string DaDangKi;

        public static DataTable DanhSachLopHocPhan (string MaHV, string NamKy)
        {
            return TruyCapDuLieu.LopHocDB.DSLopHocPhan(MaHV, NamKy);
        }


        public static DataTable DanhSachLopHoc(string MaNV, string NamKy)
        {
            return TruyCapDuLieu.LopHocDB.DSLopHoc(MaNV, NamKy);
        }

        public static DataTable DanhSachThiHocPhan(string MaNV, string NamKy)
        {
            return TruyCapDuLieu.LopHocDB.DSThiHocPhan(MaNV, NamKy);
        }

    }
}
