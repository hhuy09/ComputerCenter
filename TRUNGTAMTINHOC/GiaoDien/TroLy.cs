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
    public partial class TroLy : Form
    {
        public string MaNV;
        public string HoTen;

        public TroLy()
        {
            InitializeComponent();
        }

        private void TroLy_Load(object sender, EventArgs e)
        {
            label2.Text = HoTen;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            DangNhap dn = new DangNhap();
            this.Close();
            dn.Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            GiaoDien.TroLy_QLLH troly = new GiaoDien.TroLy_QLLH();
           
            troly.MaNV = MaNV;
            troly.HoTen = HoTen;
            this.Close();
            troly.Show();
            
        }
    }
}
