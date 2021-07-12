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
    public partial class ChuyenMon : Form
    {
        public string MaNV;
        public string HoTen;

        public ChuyenMon()
        {
            InitializeComponent();
        }

        private void ChuyenMon_Load(object sender, EventArgs e)
        {
            label2.Text = HoTen;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            ChuyenMon_QLLH ql = new ChuyenMon_QLLH();
            ql.MaNV = MaNV;
            ql.HoTen = HoTen;
            ql.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            DangNhap dn = new DangNhap();
            this.Close();
            dn.Show();
        }
    }
}
