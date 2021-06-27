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

            DataTable dt2 = NghiepVu.KhoaDaoTao.DanhSachLichThiTotNghiep(MaNV, NamKy);
            dataGridView2.DataSource = dt2;
            string MaLDT = dataGridView2.Rows[0].Cells[0].Value.ToString();
            dataGridView2.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView2.AutoResizeColumns();
            NghiepVu.HV_KDT hv_kdt = new NghiepVu.HV_KDT();
            hv_kdt.LopDT = MaLDT;


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


            DataTable dt6 = NghiepVu.HV_KDT.DanhSachHocVienThiTotNghiep(hv_kdt);
            dataGridView6.DataSource = dt6;
            dataGridView6.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView6.AutoResizeColumns();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            DiemThi diemthi = new DiemThi();            
            int rows = dataGridView5.Rows.Count - 1;
            LichThi lichthi = new LichThi();
            if (rows > 0)
            {
                string malt = dataGridView5.Rows[0].Cells[0].Value.ToString();
                for (int i = 0; i < rows; i++)
                {
                    string malh = dataGridView5.Rows[i].Cells[1].Value.ToString();
                    string mahv = dataGridView5.Rows[i].Cells[2].Value.ToString();
                    string diem = dataGridView5.Rows[i].Cells[4].Value.ToString();

                    diemthi.HocVien = mahv;
                    diemthi.LichThi = malt;
                    diemthi.LopHoc = malh;
                    diemthi.DiemThiHP = float.Parse(diem);

                    NghiepVu.DiemThi.CapNhatDiemThiHP(diemthi);

                }              
                lichthi.MaLichThi = malt;
               
            }

            DataTable dt5 = NghiepVu.DiemThi.DanhSachHocVienThiHocPhan(lichthi);
            dataGridView5.DataSource = dt5;
            dataGridView5.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView5.AutoResizeColumns();

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
                dataGridView4.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                dataGridView4.AutoResizeColumns();
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
                dataGridView5.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                dataGridView5.AutoResizeColumns();
            }
        }

        private void dataGridView2_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = this.dataGridView2.Rows[e.RowIndex];
                string MaLDT = row.Cells[0].Value.ToString();

                NghiepVu.HV_KDT hv_kdt = new NghiepVu.HV_KDT();
                hv_kdt.LopDT = MaLDT;

                DataTable dt6 = NghiepVu.HV_KDT.DanhSachHocVienThiTotNghiep(hv_kdt);
                dataGridView6.DataSource = dt6;
                dataGridView6.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                dataGridView6.AutoResizeColumns();
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            HV_KDT hv_kdt = new HV_KDT();
            int rows = dataGridView6.Rows.Count - 1;

            if (rows > 0)
            {
                string maldt = dataGridView6.Rows[0].Cells[0].Value.ToString();
                for (int i = 0; i < rows; i++)
                {
                    string mahv = dataGridView6.Rows[i].Cells[1].Value.ToString();
                    string diem = dataGridView6.Rows[i].Cells[5].Value.ToString();

                    hv_kdt.HocVien = mahv;
                    hv_kdt.LopDT = maldt;
                    hv_kdt.DiemTotNghiep = float.Parse(diem);

                    NghiepVu.HV_KDT.CapNhatDiemThiTotNghiep(hv_kdt);

                }              
            }

            DataTable dt6 = NghiepVu.HV_KDT.DanhSachHocVienThiTotNghiep(hv_kdt);
            dataGridView6.DataSource = dt6;
            dataGridView6.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView6.AutoResizeColumns();
        }
    }
}
