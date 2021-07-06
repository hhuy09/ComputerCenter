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
            NghiepVu.LopHoc lophoc = new NghiepVu.LopHoc();
            lophoc.NamKy = "2021-1";

            DataTable dt1 = NghiepVu.LopHoc.DanhSachLopHocPhan(MaHV, lophoc);
            dt1.Columns.Add(new DataColumn("DangKy", typeof(bool)));
            dataGridView1.DataSource = dt1;          
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView1.AutoResizeColumns();

            NghiepVu.HocVien hocvien = new HocVien();
            hocvien.MaHocVien = MaHV;

            DataTable dt2 = NghiepVu.DangKyHocPhan.DanhSachDKHP(hocvien, "2021-1");
            dt2.Columns.Add(new DataColumn("HuyDK", typeof(bool)));
            dataGridView2.DataSource = dt2;
            dataGridView2.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
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

                    NghiepVu.DangKyHocPhan dkhp = new DangKyHocPhan();
                    dkhp.HocVien = MaHV;
                    dkhp.LopHoc = MaLH;

                    NghiepVu.DangKyHocPhan.HVDangKyHocPhan(dkhp);
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

                    NghiepVu.DangKyHocPhan dkhp = new DangKyHocPhan();
                    dkhp.HocVien = MaHV;
                    dkhp.LopHoc = MaLH;

                    NghiepVu.DangKyHocPhan.HVHuyDangKyHocPhan(dkhp);
                }
            }

            HocVien_DKHP_Load(sender, e);

        }
    }
}
