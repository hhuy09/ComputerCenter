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
    public partial class HocVien_TTHV : Form
    {
        public string MaHV;
        public string HoTen;

        public HocVien_TTHV()
        {
            InitializeComponent();
        }

        private void HocVien_TTHV_Load(object sender, EventArgs e)
        {
            label2.Text = HoTen;
            string NamKy = comboBox1.Text;

            DataTable dt1 = NghiepVu.DiemThi.BangDiemHocVien(MaHV, NamKy);
            dataGridView1.DataSource = dt1;

            DataTable dt2 = NghiepVu.HV_KDT.BangDiemTotNghiep(MaHV, NamKy);
            dataGridView2.DataSource = dt2;


        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
