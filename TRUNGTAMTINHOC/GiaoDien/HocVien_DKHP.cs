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
    public partial class HocVien_DKHP : Form
    {
        public string HoTen;
        public string MaHV;
        public HocVien_DKHP()
        {
            InitializeComponent();
        }

        private void dataGridView2_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = this.dataGridView2.Rows[e.RowIndex];
            }
        }

        private void HocVien_DKHP_Load(object sender, EventArgs e)
        {
            label2.Text = HoTen;

            DataTable dt1 = NghiepVu.LopHoc.DanhSachLopHocPhan(MaHV,"2021-1");
            dt1.Columns.Add(new DataColumn("DangKy", typeof(bool)));
            dataGridView1.DataSource = dt1;          
            int rows1 = dataGridView1.Rows.Count - 1;
            dataGridView1.AutoResizeColumns();

            DataTable dt2 = NghiepVu.DangKyHocPhan.DanhSachDKHP(MaHV, "2021-1");
            dataGridView2.DataSource = dt2;
            dt2.Columns.Add(new DataColumn("HuyDK", typeof(bool)));
            dataGridView2.DataSource = dt2;
            int rows2 = dataGridView1.Rows.Count - 1;
            dataGridView2.AutoResizeColumns();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }


        private void button2_Click(object sender, EventArgs e)
        {
            int rows = dataGridView1.Rows.Count - 1;
            for (int i = 0; i < rows; i++)
            {
                string dk = dataGridView1.Rows[i].Cells[5].Value.ToString();
                if (dk == "True")
                {
                    string MaLH = dataGridView1.Rows[i].Cells[0].Value.ToString();
                    NghiepVu.DangKyHocPhan.HVDangKyHocPhan(MaHV, MaLH);
                }               
            }

            HocVien_DKHP_Load(sender, e);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int rows = dataGridView2.Rows.Count - 1;
            for (int i = 0; i < rows; i++)
            {
                string dk = dataGridView2.Rows[i].Cells[5].Value.ToString();
                if (dk == "True")
                {
                    string MaLH = dataGridView2.Rows[i].Cells[0].Value.ToString();
                    NghiepVu.DangKyHocPhan.HVHuyDangKyHocPhan(MaHV, MaLH);
                }
            }

            HocVien_DKHP_Load(sender, e);

        }
    }
}
