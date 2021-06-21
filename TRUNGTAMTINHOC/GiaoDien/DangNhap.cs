using System;
using System.Windows.Forms;

namespace TRUNGTAMTINHOC
{
    public partial class DangNhap : Form
    {
        public string HoTen;

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
            int result = NghiepVu.HocVien.KiemTraDangNhap(TenDN, MatKhau);

            if(result == 0)
            {
                HocVien hv = new HocVien();
                this.Hide();
                hv.Show();
            }

            if (result == 1)
            {
                TroLy tl = new TroLy();
                this.Hide();
                tl.Show();
            }

            if (result == 2)
            {
                ChuyenMon cm = new ChuyenMon();
                this.Hide();
                cm.Show();
            }

            if (result == 3)
            {
                PhongDaoTao pdt = new PhongDaoTao();
                this.Hide();
                pdt.Show();
            }

            if (result == 4)
            {
                PhongTaiVu tv = new PhongTaiVu();
                this.Hide();
                tv.Show();
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
