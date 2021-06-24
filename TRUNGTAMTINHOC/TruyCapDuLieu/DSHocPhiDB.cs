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

       


    }
}
