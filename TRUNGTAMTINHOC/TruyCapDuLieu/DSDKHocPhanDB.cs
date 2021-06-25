using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TRUNGTAMTINHOC.NghiepVu;

namespace TRUNGTAMTINHOC.TruyCapDuLieu
{
    class DSDKHocPhanDB
    {
        private static DSDKHocPhanDB instance;

        public static DSDKHocPhanDB Instance
        {
            get { if (instance == null) instance = new DSDKHocPhanDB(); return instance; }
            private set => instance = value;
        }

        private DSDKHocPhanDB() { }

        public List<DSDKHocPhan> GetListDSDK_NamKy(string namky)
        {
            List<DSDKHocPhan> list = new List<DSDKHocPhan>();

            string query = "exec USP_DanhSachDangKyHocPhan_NamKy @namky";
            DataTable data = DataProvider.Instance.ExecuteQuery(query, new object[] { namky });

            foreach (DataRow item in data.Rows)
            {
                DSDKHocPhan dsdk = new DSDKHocPhan(item);
                list.Add(dsdk);
            }


            return list;
        }

        //public List<DSDKHocPhan> GetListDSDK(string namky)
        //{
        //    List<DSDKHocPhan> list = new List<DSDKHocPhan>();

        //    string query = "select distinct hv.MaHocVien, hv.HoTen, kdt.MaLopDT, hp.TenHocPhan from DANGKYHOCPHAN dkhp, HOCVIEN hv, KHOADAOTAO kdt, LOPHOC lh, HOCPHAN hp, HOCVIEN_KDT hvkdt where hv.MaHocVien = dkhp.HocVien and dkhp.LopHoc = lh.MaLopHoc and lh.HocPhan = hp.MaHocPhan and hv.MaHocVien = hvkdt.HocVien and hvkdt.LopDaoTao = kdt.MaLopDT" ;
        //    DataTable data = DataProvider.Instance.ExecuteQuery(query);

        //    foreach (DataRow item in data.Rows)
        //    {
        //        DSDKHocPhan dsdk = new DSDKHocPhan(item);
        //        list.Add(dsdk);
        //    }


        //    return list;
        //}
    }
}
