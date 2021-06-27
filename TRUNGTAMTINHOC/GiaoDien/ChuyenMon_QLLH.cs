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
    public partial class ChuyenMon_QLLH : Form
    {
        public string MaNV;
        public string HoTen;
        public string NamKy;

        public ChuyenMon_QLLH()
        {
            InitializeComponent();
        }

        private void ChuyenMon_QLLH_Load(object sender, EventArgs e)
        {
            label2.Text = HoTen;
            NamKy = comboBox1.Text;
            HV_KDT hv_kdt = new HV_KDT();
            hv_kdt.HocVien = MaNV;

            DataTable dt1 = NghiepVu.LopHoc.DanhSachLopHoc(MaNV,NamKy);
            dataGridView1.DataSource = dt1;

            DataTable dt2 = NghiepVu.KhoaDaoTao.DanhSachThiTotNghiep(MaNV, NamKy);
            dataGridView2.DataSource = dt2;

            DataTable dt3 = NghiepVu.LopHoc.DanhSachThiHocPhan(MaNV, NamKy);
            dataGridView3.DataSource = dt3;

            DataTable dt4 = NghiepVu.HocVien.DanhSachHocVien(MaNV, NamKy);
            dataGridView4.DataSource = dt4;

            DataTable dt5 = NghiepVu.HocVien.DanhSachHocVienThiHocPhan(MaNV, NamKy);
            dataGridView5.DataSource = dt5;


            DataTable dt6 = NghiepVu.HV_KDT.DanhSachHocVienThiTotNghiep(hv_kdt, NamKy);
            dataGridView6.DataSource = dt6;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {

        }
    }
}
