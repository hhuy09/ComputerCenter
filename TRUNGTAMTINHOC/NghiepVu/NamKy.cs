using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TRUNGTAMTINHOC.NghiepVu
{
    public class NamKy
    {
        public NamKy(string namky, DateTime? batdau, DateTime? ketthuc, int muchocphi)
        {
            this.Namky = namky;
            this.BatDau = batdau;
            this.KetThuc = ketthuc;
            this.MucHocPhi = muchocphi;
        }

        public NamKy(DataRow row)
        {
            this.Namky = row["namky"].ToString();
            this.BatDau = (DateTime?)row["batdau"];
            this.KetThuc = (DateTime?)row["ketthuc"];
            this.MucHocPhi = (int)row["muchocphi"];
        }

        private string namky;
        private DateTime? batDau;
        private DateTime? ketThuc;
        private int mucHocPhi;

        public string Namky { get => namky; set => namky = value; }
        public DateTime? BatDau { get => batDau; set => batDau = value; }
        public DateTime? KetThuc { get => ketThuc; set => ketThuc = value; }
        public int MucHocPhi { get => mucHocPhi; set => mucHocPhi = value; }
    }
}
