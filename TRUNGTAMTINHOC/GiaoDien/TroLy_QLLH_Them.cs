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
    public partial class TroLy_QLLH_Them : Form
    {
        public TroLy_QLLH_Them()
        {
            InitializeComponent();
        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox6_TextChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string MaLopHoc = textBox1.Text;
            string NamKy = textBox2.Text;
            string HocPhan = textBox3.Text;
            string NVChuyenMon = textBox4.Text;
            string LichHoc = textBox5.Text;
            string SiSo = textBox6.Text;

            NghiepVu.LichHoc.ThemLichHoc(MaLopHoc, NamKy, HocPhan, NVChuyenMon, LichHoc, SiSo);
            this.Close();
        }
    }
}
