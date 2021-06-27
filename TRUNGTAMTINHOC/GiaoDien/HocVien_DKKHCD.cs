using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using TRUNGTAMTINHOC.NghiepVu;

namespace TRUNGTAMTINHOC
{
    public partial class HocVien_DKKHCD : Form
    {
       public string MaHV;
       public string HoTen;
       HV_KDT hv_kdt = new HV_KDT();

        public HocVien_DKKHCD()
        {
            InitializeComponent();
        }

        private void HocVien_DKKHCD_Load(object sender, EventArgs e)
        {
            label2.Text = HoTen;
            hv_kdt.HocVien = MaHV;

            DataTable dt1 = NghiepVu.HV_KDT.DanhSachDKKH(hv_kdt);
            dataGridView1.DataSource = dt1;
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView1.AutoResizeColumns();
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
            dataGridView2.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView2.AutoResizeColumns();
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
                hv_kdt.LopDT = MaLopDT;
                NghiepVu.HV_KDT.DangKyKhoaHoc(hv_kdt);
            }

            if (checkBox2.Checked == true)
            {
                string MaLopDT = label21.Text;
                hv_kdt.LopDT = MaLopDT;
                NghiepVu.HV_KDT.DangKyKhoaHoc(hv_kdt);
            }

            if (checkBox3.Checked == true)
            {
                string MaLopDT = label22.Text;
                hv_kdt.LopDT = MaLopDT;
                NghiepVu.HV_KDT.DangKyKhoaHoc(hv_kdt);
            }

            HocVien_DKKHCD_Load(sender, e);
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
            hv_kdt.LopDT = MaLopDT;
            NghiepVu.HV_KDT.HuyDangKyKhoaHoc(hv_kdt);

            HocVien_DKKHCD_Load(sender, e);
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

            HocVien_DKKHCD_Load(sender, e);
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

            HocVien_DKKHCD_Load(sender, e);
        }

        private void dataGridView2_CellClick_1(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = this.dataGridView2.Rows[e.RowIndex];
                label31.Text = row.Cells[2].Value.ToString();
                label30.Text = row.Cells[1].Value.ToString();
            }
        }
    }
}
