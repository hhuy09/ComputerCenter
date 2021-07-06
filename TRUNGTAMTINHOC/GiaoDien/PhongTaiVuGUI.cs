using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using TRUNGTAMTINHOC.GiaoDien;

namespace TRUNGTAMTINHOC
{
    public partial class PhongTaiVu : Form
    {
        public string MaNV;
        public string HoTen;

        public PhongTaiVu()
        {
            InitializeComponent();
        }

        private void PhongTaiVu_Load(object sender, EventArgs e)
        {
            label2.Text = HoTen;
        }

        private void btn_QLHP_Click(object sender, EventArgs e)
        {
            PhongTaiVu_QLHPGUI f = new PhongTaiVu_QLHPGUI();
            f.MaNV = MaNV;
            f.HoTen = HoTen;
            f.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            DangNhap dn = new DangNhap();
            this.Close();
            dn.Show();
        }
    }
}
