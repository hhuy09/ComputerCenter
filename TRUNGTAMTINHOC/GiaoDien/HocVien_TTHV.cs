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

            DataTable dt3 = NghiepVu.LichThi.DSLICHTHILAI(MaHV, NamKy);
            dataGridView6.DataSource = dt3;
            int row = dataGridView6.Rows.Count - 1;
            if( row > 0)
            {
                string malt = dataGridView6.Rows[0].Cells[0].Value.ToString();
                label4.Text = malt;
            }
            else
            {
                label4.Text = "none";
            }

            DataTable dt4 = NghiepVu.DanhGiaKhoaHoc.DGKhoaHoc(MaHV);
            dataGridView3.DataSource = dt4;
            dataGridView3.AutoResizeColumns();

            DataTable dt5 = NghiepVu.DanhGiaNHP.DGNhomHocPhan(MaHV);
            dataGridView4.DataSource = dt5;
            dataGridView4.AutoResizeColumns();

        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void dataGridView6_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = this.dataGridView6.Rows[e.RowIndex];
                string malt = row.Cells[0].Value.ToString();
                label4.Text = malt;
            }
        }

        private void button6_Click(object sender, EventArgs e)
        {
            string MaLT = label4.Text;
            NghiepVu.DiemThi.DangKyThiLai(MaHV, MaLT);

            HocVien_TTHV_Load(sender, e);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            string MaLT = label4.Text;
            NghiepVu.DiemThi.HuyDangKyThiLai(MaHV, MaLT);

            HocVien_TTHV_Load(sender, e);
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
