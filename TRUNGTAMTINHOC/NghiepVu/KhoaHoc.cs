using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;

namespace TRUNGTAMTINHOC.NghiepVu
{
    class KhoaHoc
    {
        public static DataTable Danhsachkhoahoc(string namky)
        {
            return TruyCapDuLieu.KhoaHocDB.Danhsachkhoahoc(namky);
        }
        public static DataTable DSNHP(string namky)
        {
            return TruyCapDuLieu.KhoaHocDB.DanhsachNHP(namky);
        }
        public static DataTable DIEMHP(string Mahv,string MaNHP)
        {
            return TruyCapDuLieu.KhoaHocDB.DiemHP_HV(Mahv,MaNHP);
        }



    }
}
