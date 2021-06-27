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

        public ChuyenMon_QLLH()
        {
            InitializeComponent();
        }

        private void ChuyenMon_QLLH_Load(object sender, EventArgs e)
        {
            label2.Text = HoTen;
            string NamKy = comboBox1.Text;
            NghiepVu.HV_KDT hv_kdt = new NghiepVu.HV_KDT();
            hv_kdt.HocVien = MaNV;
            NghiepVu.LopHoc lophoc = new NghiepVu.LopHoc();
            lophoc.NamKy = NamKy;
            lophoc.NVChuyenMon = MaNV;

            DataTable dt1 = NghiepVu.LopHoc.DanhSachLopHoc(MaNV, lophoc);
            dataGridView1.DataSource = dt1;
            string MaLopHoc = dataGridView1.Rows[0].Cells[0].Value.ToString();
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView1.AutoResizeColumns();
            NghiepVu.DangKyHocPhan dkhp = new DangKyHocPhan();
            dkhp.LopHoc = MaLopHoc;

            //DataTable dt2 = NghiepVu.KhoaDaoTao.DanhSachThiTotNghiep(MaNV, NamKy);
            //dataGridView2.DataSource = dt2;
            

            DataTable dt3 = NghiepVu.LichThi.DSLichThiHP(lophoc);
            dataGridView3.DataSource = dt3;
            string MaLichThi = dataGridView3.Rows[0].Cells[0].Value.ToString();
            dataGridView3.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView3.AutoResizeColumns();
            LichThi lichthi = new LichThi();
            lichthi.MaLichThi = MaLichThi;

            DataTable dt4 = NghiepVu.DangKyHocPhan.DanhSachHocVienLopHoc(dkhp);
            dataGridView4.DataSource = dt4;
            dataGridView4.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView4.AutoResizeColumns();

            DataTable dt5 = NghiepVu.DiemThi.DanhSachHocVienThiHocPhan(lichthi);
            dataGridView5.DataSource = dt5;
            dataGridView5.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView5.AutoResizeColumns();


            //DataTable dt6 = NghiepVu.HV_KDT.DanhSachHocVienThiTotNghiep(hv_kdt, NamKy);
            //dataGridView6.DataSource = dt6;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = this.dataGridView1.Rows[e.RowIndex];
                string MaLopHoc = row.Cells[0].Value.ToString();

                NghiepVu.DangKyHocPhan dkhp = new DangKyHocPhan();
                dkhp.LopHoc = MaLopHoc;

                DataTable dt4 = NghiepVu.DangKyHocPhan.DanhSachHocVienLopHoc(dkhp);
                dataGridView4.DataSource = dt4;
            }
        }

        private void dataGridView3_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = this.dataGridView3.Rows[e.RowIndex];
                string MaLichThi = row.Cells[0].Value.ToString();

                LichThi lichthi = new LichThi();
                lichthi.MaLichThi = MaLichThi;

                DataTable dt5 = NghiepVu.DiemThi.DanhSachHocVienThiHocPhan(lichthi);
                dataGridView5.DataSource = dt5;
            }
        }
    }
}
