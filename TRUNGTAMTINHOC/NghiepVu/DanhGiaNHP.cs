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
        public static DataTable DGNhomHocPhan(string MaHV)
        {
            return TruyCapDuLieu.DanhGiaNHPDB.DGNHP(MaHV);
        }
        public static DataTable DS_HV_NHP_CD(string namky)
        {
            return TruyCapDuLieu.DanhGiaNHPDB.DS_NHP_CHUADAT(namky);
        }
        public static DataTable UPDATE_DGNHP(string MaHV,string MaNHP)
        {
            return TruyCapDuLieu.DanhGiaNHPDB.Update_DGHP(MaHV,MaNHP);
        }
        public static DataTable DSCCVB_NHP(string namky)
        {
            return TruyCapDuLieu.DanhGiaNHPDB.DSCCVB_NhomHocPhan(namky);
        }
        public static DataTable Danhsach_hocVien_NHP(string namky)
        {
            return TruyCapDuLieu.DanhGiaNHPDB.Danhsach_HV_NHP(namky);
        }


    }
}
