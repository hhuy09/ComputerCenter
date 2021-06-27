using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TRUNGTAMTINHOC.NghiepVu;

namespace TRUNGTAMTINHOC.TruyCapDuLieu
{
    public class NamKy_DB_H
    {
        private static NamKy_DB_H instance;

        public static NamKy_DB_H Instance
        {
            get { if (instance == null) instance = new NamKy_DB_H(); return instance; }
            private set => instance = value;
        }

        private NamKy_DB_H() { }

        public List<NamKy> GetListNamKy()
        {
            List<NamKy> list = new List<NamKy>();

            string query = "Select * from NamKy";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach(DataRow item in data.Rows)
            {
                NamKy nk = new NamKy(item);
                list.Add(nk);
            }

            return list;
        }
 
    }
}
