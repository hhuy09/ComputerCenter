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

            DataTable dt1 = NghiepVu.HV_KDT.DanhSachDKKH(MaHV);
            dataGridView1.DataSource = dt1;
            dataGridView1.Columns[2].Width = 220;
            int count1 = dataGridView1.Rows.Count - 1;

            if (count1 > 0)
            {
                label25.Text = dataGridView1.Rows[0].Cells[2].Value.ToString();
                label26.Text = dataGridView1.Rows[0].Cells[1].Value.ToString();
            }
            else
            {
                label25.Text = "(none)";
                label26.Text = "(none)";
            }

            DataTable dt2 = NghiepVu.HV_LCD.DanhSachDKCD(MaHV);
            dataGridView2.DataSource = dt2;
            dataGridView2.Columns[2].Width = 250;
            int count2 = dataGridView2.Rows.Count - 1;

            if(count2 > 0)
            {
                label31.Text = dataGridView2.Rows[0].Cells[2].Value.ToString();
                label30.Text = dataGridView2.Rows[0].Cells[1].Value.ToString();
            }
            else
            {
                label31.Text = "(none)";
                label30.Text = "(none)";
            }     
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (checkBox1.Checked == true)
            {
                string MaLopDT = label20.Text;
                NghiepVu.HV_KDT.DangKyKhoaHoc(MaHV, MaLopDT);
            }

            if (checkBox2.Checked == true)
            {
                string MaLopDT = label21.Text;
                NghiepVu.HV_KDT.DangKyKhoaHoc(MaHV, MaLopDT);
            }

            if (checkBox3.Checked == true)
            {
                string MaLopDT = label22.Text;
                NghiepVu.HV_KDT.DangKyKhoaHoc(MaHV, MaLopDT);
            }

            DataTable dt1 = NghiepVu.HV_KDT.DanhSachDKKH(MaHV);
            dataGridView1.DataSource = dt1;
            dataGridView1.Columns[2].Width = 220;
            int count1 = dataGridView1.Rows.Count - 1;

            if (count1 > 0)
            {
                label25.Text = dataGridView1.Rows[0].Cells[2].Value.ToString();
                label26.Text = dataGridView1.Rows[0].Cells[1].Value.ToString();
            }
            else
            {
                label25.Text = "(none)";
                label26.Text = "(none)";
            }
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
                label25.Text = row.Cells[2].Value.ToString();
                label26.Text = row.Cells[1].Value.ToString();
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            string MaLopDT = label26.Text;
            NghiepVu.HV_KDT.HuyDangKyKhoaHoc(MaHV, MaLopDT);

            DataTable dt1 = NghiepVu.HV_KDT.DanhSachDKKH(MaHV);
            dataGridView1.DataSource = dt1;
            dataGridView1.Columns[2].Width = 220;
            int count1 = dataGridView1.Rows.Count - 1;

            if (count1 > 0)
            {
                label25.Text = dataGridView1.Rows[0].Cells[2].Value.ToString();
                label26.Text = dataGridView1.Rows[0].Cells[1].Value.ToString();
            }
            else
            {
                label25.Text = "(none)";
                label26.Text = "(none)";
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            if (checkBox6.Checked == true)
            {
                string MaLopCD = label27.Text;
                NghiepVu.HV_LCD.DangKyChuyenDe(MaHV, MaLopCD);
            }

            if (checkBox5.Checked == true)
            {
                string MaLopCD = label28.Text;
                NghiepVu.HV_LCD.DangKyChuyenDe(MaHV, MaLopCD);
            }

            if (checkBox4.Checked == true)
            {
                string MaLopCD = label29.Text;
                NghiepVu.HV_LCD.DangKyChuyenDe(MaHV, MaLopCD);
            }

            DataTable dt2 = NghiepVu.HV_LCD.DanhSachDKCD(MaHV);
            dataGridView2.DataSource = dt2;
            dataGridView2.Columns[2].Width = 250;
            int count2 = dataGridView2.Rows.Count - 1;

            if (count2 > 0)
            {
                label31.Text = dataGridView2.Rows[0].Cells[2].Value.ToString();
                label30.Text = dataGridView2.Rows[0].Cells[1].Value.ToString();
            }
            else
            {
                label31.Text = "(none)";
                label30.Text = "(none)";
            }
        }

        private void dataGridView2_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = this.dataGridView2.Rows[e.RowIndex];
                label31.Text = row.Cells[2].Value.ToString();
                label30.Text = row.Cells[1].Value.ToString();
            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
            string MaLopCD = label30.Text;
            NghiepVu.HV_LCD.HuyDangKyChuyenDe(MaHV, MaLopCD);

            DataTable dt2 = NghiepVu.HV_LCD.DanhSachDKCD(MaHV);
            dataGridView2.DataSource = dt2;
            dataGridView2.Columns[2].Width = 250;
            int count2 = dataGridView2.Rows.Count - 1;

            if (count2 > 0)
            {
                label31.Text = dataGridView2.Rows[0].Cells[2].Value.ToString();
                label30.Text = dataGridView2.Rows[0].Cells[1].Value.ToString();
            }
            else
            {
                label31.Text = "(none)";
                label30.Text = "(none)";
            }
        }
    }
}
