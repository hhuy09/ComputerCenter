using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TRUNGTAMTINHOC.NghiepVu
{
    public class DSDKHocPhan
    {
        public DSDKHocPhan(string mahocvien, string hoten, string malopDT, string tenhocphan)
        {
            this.MaHocVien = mahocvien;
            this.HoTen = hoten;
            this.MaLopDT = malopDT;
            this.TenHocPhan = tenhocphan;
        }

        public DSDKHocPhan(DataRow row)
        {
            this.MaHocVien = row["MaHocVien"].ToString();
            this.HoTen = row["HoTen"].ToString();
            this.MaLopDT = row["MaLopDT"].ToString();
            this.TenHocPhan = row["TenHocPhan"].ToString();
        }

        private string maHocVien;
        private string hoTen;
        private string maLopDT;
        private string tenHocPhan;

        public string MaHocVien { get => maHocVien; set => maHocVien = value; }
        public string HoTen { get => hoTen; set => hoTen = value; }
        public string MaLopDT { get => maLopDT; set => maLopDT = value; }
        public string TenHocPhan { get => tenHocPhan; set => tenHocPhan = value; }


    }
}
