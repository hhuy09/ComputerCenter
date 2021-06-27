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
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView1.AutoResizeColumns();

            HV_KDT hv_kdt = new HV_KDT();
            hv_kdt.HocVien = MaHV;
            DataTable dt2 = NghiepVu.HV_KDT.BangDiemTotNghiep(hv_kdt, NamKy);
            dataGridView2.DataSource = dt2;
            dataGridView2.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView2.AutoResizeColumns();

            DataTable dt3 = NghiepVu.LichThi.DSLichThiLai(MaHV, NamKy);
            dataGridView6.DataSource = dt3;
            dataGridView6.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView6.AutoResizeColumns();
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
            dataGridView3.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView3.AutoResizeColumns();

            DataTable dt5 = NghiepVu.DanhGiaNHP.DGNhomHocPhan(MaHV);
            dataGridView4.DataSource = dt5;
            dataGridView4.AutoResizeColumns();
            dataGridView4.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
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
    }
}
