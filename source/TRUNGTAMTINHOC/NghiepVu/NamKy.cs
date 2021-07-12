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

        private string namky;
        private string batDau;
        private string ketThuc;
        private int mucHocPhi;

        public string Namky { get => namky; set => namky = value; }
        public string BatDau { get => batDau; set => batDau = value; }
        public string KetThuc { get => ketThuc; set => ketThuc = value; }
        public int MucHocPhi { get => mucHocPhi; set => mucHocPhi = value; }

        public NamKy(string namky, string batdau, string ketthuc, int muchocphi)
        {
            this.Namky = namky;
            this.BatDau = batdau;
            this.KetThuc = ketthuc;
            this.MucHocPhi = muchocphi;
        }

        public NamKy()
        {
        }

        


    }
 
}
