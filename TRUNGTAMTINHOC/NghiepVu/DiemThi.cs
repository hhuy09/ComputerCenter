using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using TRUNGTAMTINHOC.TruyCapDuLieu;

namespace TRUNGTAMTINHOC.NghiepVu
{
    class DiemThi
    {
        private string HocVien;
        private string LopHoc;
        private string LichThi;
        private string DiemThiHP;
        private string Dat;

        public static DataTable DanhSachHocVienThiHocPhan(string MaNV,string NamKy)
        {
            return TruyCapDuLieu.DiemThiDB.DSHocVienThiHocPhan(MaNV,NamKy);
        }
    }
}
