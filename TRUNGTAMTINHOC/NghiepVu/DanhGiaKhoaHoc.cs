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
        public static DataTable DGKhoaHoc(string MaHV)
        {
            return TruyCapDuLieu.DanhGiaKhoaHocDB.DGKH(MaHV);
        }
        public static DataTable DS_DG_HVKH(string MaHV)
        {
            return TruyCapDuLieu.DanhGiaKhoaHocDB.DS_Danhgia_HVKH(MaHV);
        }
        public static DataTable DSCCVB_KH(string namky)
        {
            return TruyCapDuLieu.DanhGiaKhoaHocDB.DSCCVB_KhoaHoc(namky);
        }
        public static DataTable UPDATE_DAT_KH(string MaHV,string MaKH)
        {
            return TruyCapDuLieu.DanhGiaKhoaHocDB.Update_KhoaHoc(MaHV,MaKH);
        }
        public static DataTable DS_HV_CHUADAT_KH(string namky)
        {
            return TruyCapDuLieu.DanhGiaKhoaHocDB.DS_HVKhoaHoc_ChuaDat(namky);
        }
    }
}
