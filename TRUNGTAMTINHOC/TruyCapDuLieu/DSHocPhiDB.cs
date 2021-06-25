using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TRUNGTAMTINHOC.NghiepVu;

namespace TRUNGTAMTINHOC.TruyCapDuLieu
{
    class DSHocPhiDB
    {
        private static DSHocPhiDB instance;

        public static DSHocPhiDB Instance
        {
            get { if (instance == null) instance = new DSHocPhiDB(); return instance; }
            set => instance = value;
        }

        private DSHocPhiDB() { }

        public List<DSHocPhi> GetListDSHocPhi_NamKy(string namky)
        {
            List<DSHocPhi> list = new List<DSHocPhi>();

            string query = "exec USP_DSHocPhi @namky";
            DataTable data = DataProvider.Instance.ExecuteQuery(query, new object[] { namky });

            foreach (DataRow item in data.Rows)
            {
                DSHocPhi dshp = new DSHocPhi(item);
                list.Add(dshp);
            }


            return list;
        }

        public void HuyNopHocPhi(string mahocvien)
        {
            string query = "exec USP_HuyNopHocPhi @mahocvien ";
            DataProvider.Instance.ExecuteNonQuery(query, new object[] { mahocvien });
        }

        public void TinhHocPhi(string namky)
        {
            string query = "exec USP_TinhHocPhi @namky";
            DataProvider.Instance.ExecuteNonQuery(query, new object[] { namky });
        }

        public void NopHocPhi(string mahocvien)
        {
            string query = "exec USP_NopHocPhi @mahocvien ";
            DataProvider.Instance.ExecuteNonQuery(query, new object[] { mahocvien });
        }


        public List<DSHocPhi> GetList_ChuaNopHocPhi(string namky)
        {
            List<DSHocPhi> list = new List<DSHocPhi>();

            string query = "exec USP_DS_ChuaNop_HocPhi @namky";
            DataTable data = DataProvider.Instance.ExecuteQuery(query, new object[] { namky });

            foreach (DataRow item in data.Rows)
            {
                DSHocPhi ds = new DSHocPhi(item);
                list.Add(ds);
            }

            return list;
        }
    }
}
