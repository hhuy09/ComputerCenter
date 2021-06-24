using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TRUNGTAMTINHOC
{

    public partial class PhongDaoTao : Form
    {

        public string MaNV;
        public string HoTen;
        public PhongDaoTao()
        {
            InitializeComponent();
        }

        private void PhongDaoTao_Load(object sender, EventArgs e)
        {
            label2.Text = HoTen;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            GiaoDien.PhongDT_QLCCVB pdt_ql = new GiaoDien.PhongDT_QLCCVB();
            pdt_ql.MaNV = MaNV;
            pdt_ql.HoTen = HoTen;
            this.Close();
            pdt_ql.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            DangNhap dn = new DangNhap();
            this.Close();
            dn.Show();
        }

        private void label2_Click(object sender, EventArgs e)
        {
         
        }
    }
}
