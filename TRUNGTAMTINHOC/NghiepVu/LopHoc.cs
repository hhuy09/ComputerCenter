using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using TRUNGTAMTINHOC.TruyCapDuLieu;

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

        public static DataTable DanhSachLopDay(string MaNV,string NamKy)
        {
            return TruyCapDuLieu.LopHocDB.DSLopDay(MaNV,NamKy);
        }
    }
}
