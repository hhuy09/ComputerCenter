using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TRUNGTAMTINHOC.GiaoDien
{
    public partial class TroLy_QLLH_CapNhat : Form
    {
        public string MaLopHoc;
        public string NamKy;
        public string HocPhan;
        public string NVChuyenMon;
        public string LichHoc;
        public string SiSo;
        public TroLy_QLLH_CapNhat()
        {
            InitializeComponent();
        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void TroLy_QLLH_CapNhat_Load(object sender, EventArgs e)
        {
            label8.Text = MaLopHoc;
            label9.Text = NamKy;
            label10.Text = HocPhan;
            label11.Text = NVChuyenMon;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            LichHoc = textBox5.Text;
            SiSo = textBox6.Text;
            NghiepVu.LichHoc.SuaLichHoc(MaLopHoc, NamKy, LichHoc, SiSo);
            this.Close();
        }
    }
}
