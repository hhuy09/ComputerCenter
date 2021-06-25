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
    public partial class ChuyenMon_QLLH : Form
    {
        public string MaNV;
        public string HoTen;
        public ChuyenMon_QLLH()
        {
            InitializeComponent();
        }

        private void ChuyenMon_QLLH_Load(object sender, EventArgs e)
        {
            label2.Text = HoTen;

            DataTable dt1 = NghiepVu.LopHoc.DanhSachLopHoc(MaNV);
            dataGridView1.DataSource = dt1;

            DataTable dt2 = NghiepVu.KhoaDaoTao.DanhSachThiTotNghiep(MaNV);
            dataGridView2.DataSource = dt2;

            DataTable dt3 = NghiepVu.LichThi.DanhSachThiHocPhan(MaNV);
            dataGridView3.DataSource = dt3;

            DataTable dt4 = NghiepVu.HocVien.DanhSachHocVien(MaNV);
            dataGridView4.DataSource = dt4;

            DataTable dt5 = NghiepVu.HocVien.DanhSachHocVienThiHocPhan(MaNV);
            dataGridView5.DataSource = dt5;

            DataTable dt6 = NghiepVu.HocVien.DanhSachHocVienThiTotNghiep(MaNV);
            dataGridView6.DataSource = dt6;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void dataGridView4_CellClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView4_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void groupBox4_Enter(object sender, EventArgs e)
        {

        }
    }
}
