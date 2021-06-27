using System;
using System.Windows.Forms;
using TRUNGTAMTINHOC.NghiepVu;

namespace TRUNGTAMTINHOC
{
    public partial class DangNhap : Form
    {
        public string HoTen;
        public string Email;
        public string ID;

        public DangNhap()
        {
            InitializeComponent();
        }

        private void DangNhap_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string TenDN = textBox1.Text;
            string MatKhau = textBox2.Text;
            Email = TenDN;
            NghiepVu.HocVien hocvien = new NghiepVu.HocVien();
            hocvien.Email = Email;
            hocvien.MatKhau = MatKhau;

            int result = NghiepVu.HocVien.KiemTraDangNhap(hocvien);
            HoTen = NghiepVu.HocVien.HotenHocVien(hocvien);
            ID = NghiepVu.HocVien.IDHocVien(hocvien);

            if (result == 0)
            {
                LopHoc hv = new LopHoc();
                hv.HoTen = HoTen;
                hv.MaHV = ID;
                this.Hide();          
                hv.Show();
            }

            if (result == 1)
            {
                TroLy tl = new TroLy();
                tl.HoTen = HoTen;
                tl.MaNV = ID;
                this.Hide();
                tl.Show();
            }

            if (result == 2)
            {
                ChuyenMon cm = new ChuyenMon();
                cm.HoTen = HoTen;
                cm.MaNV = ID;
                this.Hide();
                cm.Show();
            }

            if (result == 3)
            {
                PhongDaoTao pdt = new PhongDaoTao();
                pdt.HoTen = HoTen;
                pdt.MaNV = ID;
                this.Hide();
                pdt.Show();
            }

            if (result == 4)
            {
                PhongTaiVu tv = new PhongTaiVu();
                tv.HoTen = HoTen;
                tv.MaNV = ID;
                this.Hide();
                tv.Show();
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void label6_Click(object sender, EventArgs e)
        {
            GiaoDien.DangKy dk = new GiaoDien.DangKy();
            this.Hide();
            dk.Show();
        }
    }
}
