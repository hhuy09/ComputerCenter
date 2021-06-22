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
    public partial class HocVien_DKKHCD : Form
    {
        public string MaHV;
        public string HoTen;

        public HocVien_DKKHCD()
        {
            InitializeComponent();
        }

        private void HocVien_DKKHCD_Load(object sender, EventArgs e)
        {
            label2.Text = HoTen;
            DataTable dt = NghiepVu.HV_KDT.DanhSachDKKH(MaHV);
            dataGridView1.DataSource = dt;

            label25.Text = dataGridView1.Rows[0].Cells[3].Value.ToString();
            label26.Text = dataGridView1.Rows[0].Cells[2].Value.ToString();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (checkBox1.Checked == true)
            {
                string MaLopDT = label20.Text;
                NghiepVu.HV_KDT.DangKyKhoaHoc(MaHV, MaLopDT);
            }

            if (checkBox2.Checked)
            {
                string MaLopDT = label21.Text;
                NghiepVu.HV_KDT.DangKyKhoaHoc(MaHV, MaLopDT);
            }

            if (checkBox3.Checked)
            {
                string MaLopDT = label22.Text;
                NghiepVu.HV_KDT.DangKyKhoaHoc(MaHV, MaLopDT);
            }

            DataTable dt = NghiepVu.HV_KDT.DanhSachDKKH(MaHV);
            dataGridView1.DataSource = dt;
            label25.Text = dataGridView1.Rows[0].Cells[3].Value.ToString();
            label26.Text = dataGridView1.Rows[0].Cells[2].Value.ToString();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = this.dataGridView1.Rows[e.RowIndex];
                label25.Text = row.Cells[3].Value.ToString();
                label26.Text = row.Cells[2].Value.ToString();
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            string MaLopDT = label26.Text;
            NghiepVu.HV_KDT.HuyDangKyKhoaHoc(MaHV, MaLopDT);

            DataTable dt = NghiepVu.HV_KDT.DanhSachDKKH(MaHV);
            dataGridView1.DataSource = dt;
            label25.Text = dataGridView1.Rows[0].Cells[3].Value.ToString();
            label26.Text = dataGridView1.Rows[0].Cells[2].Value.ToString();
        }

        private void button4_Click(object sender, EventArgs e)
        {

        }
    }
}
