using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using TRUNGTAMTINHOC.TruyCapDuLieu;

namespace TRUNGTAMTINHOC.NghiepVu
{
    class LichThi
    {
        private string MaLichThi;
        private string LopHoc;
        private string NgayThi;

        public static DataTable DanhSachThiHocPhan(string NVChuyenMon)
        {
            return TruyCapDuLieu.LichThiDB.DSThiHocPhan(NVChuyenMon);
        }
    }
}
