using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TRUNGTAMTINHOC.NghiepVu
{
    public class DSHocPhi
    {
        public DSHocPhi(string hocvien, string hoten, string lopdaotao, string hocphi)
        {
            this.HocVien = hocvien;
            this.hoTen = hoten;
            this.LopDaoTao = lopdaotao;
            this.HocPhi = hocphi;
        }

        public DSHocPhi(DataRow row)
        {
            this.HocVien = row["hocvien"].ToString();
            this.hoTen = row["hoten"].ToString();
            this.LopDaoTao = row["lopdaotao"].ToString();
            this.HocPhi = row["hocphi"].ToString();
        }

        private string hocVien;
        private string hoTen;
        private string lopDaoTao;
        private string hocPhi;

        public string HocVien { get => hocVien; set => hocVien = value; }
        public string HoTen { get => hoTen; set => hoTen = value; }
        public string LopDaoTao { get => lopDaoTao; set => lopDaoTao = value; }
        public string HocPhi { get => hocPhi; set => hocPhi = value; }

    }
}
