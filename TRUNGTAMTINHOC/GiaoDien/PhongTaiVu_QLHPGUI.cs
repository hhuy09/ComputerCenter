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
using TRUNGTAMTINHOC.TruyCapDuLieu;

namespace TRUNGTAMTINHOC.GiaoDien
{
    public partial class PhongTaiVu_QLHPGUI : Form
    {
        public string MaNV;
        public string HoTen;

        public PhongTaiVu_QLHPGUI()
        {
            InitializeComponent();
        }


        private void btn_TinhHocPhi_Click(object sender, EventArgs e)
        {
            int row = dtgv_DSHocPhi.Rows.Count - 1;
            if (row > 0)
            {
                for (int i = 0; i < row; i++)
                {
                    string MaHV = dtgv_DSHocPhi.Rows[i].Cells[0].Value.ToString();
                    string MaLDT = dtgv_DSHocPhi.Rows[i].Cells[2].Value.ToString();

                    NghiepVu.HV_KDT h = new HV_KDT();
                    h.HocVien = MaHV;
                    h.LopDT = MaLDT;

                    NghiepVu.HV_KDT.TinhTienHocPhi(h);
                }
            }
            PhongTaiVu_QLHP_Load(sender, e);
        }
      

        private void btn_Nop_Click(object sender, EventArgs e)
        {
            string MaHV = lb_MaHocVien.Text;
            string MaLDT = label6.Text;

            NghiepVu.HV_KDT h = new HV_KDT();
            h.HocVien = MaHV;
            h.LopDT = MaLDT;

            NghiepVu.HV_KDT.HVNopHocPhi(h);
            PhongTaiVu_QLHP_Load(sender, e);
        }

        private void btn_Huy_Click(object sender, EventArgs e)
        {
            string MaHV = lb_MaHocVien.Text;
            string MaLDT = label6.Text;

            NghiepVu.HV_KDT h = new HV_KDT();
            h.HocVien = MaHV;
            h.LopDT = MaLDT;

            NghiepVu.HV_KDT.HVHuyNopHocPhi(h);
            PhongTaiVu_QLHP_Load(sender, e);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void PhongTaiVu_QLHP_Load(object sender, EventArgs e)
        {
            lb_TenNV.Text = HoTen;
            string namky = cbx_NamKy_DKHP.Text;

            DataTable dt1 = NghiepVu.DangKyHocPhan.DanhSachDKHocPhan(namky);
            dtgv_dsdkHocPhan.DataSource = dt1;
            dtgv_dsdkHocPhan.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dtgv_dsdkHocPhan.AutoResizeColumns();

            DataTable dt2 = NghiepVu.HV_KDT.DanhSachHocPhi(namky);
            dtgv_DSHocPhi.DataSource = dt2;
            dtgv_DSHocPhi.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dtgv_DSHocPhi.AutoResizeColumns();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            int row = dtgv_DSHocPhi.Rows.Count - 1;
            if(row > 0)
            {
                for(int i = 0; i< row; i++)
                {
                    string MaHV = dtgv_DSHocPhi.Rows[i].Cells[0].Value.ToString();
                    string MaLDT = dtgv_DSHocPhi.Rows[i].Cells[2].Value.ToString();

                    NghiepVu.HV_KDT h = new HV_KDT();
                    h.HocVien = MaHV;
                    h.LopDT = MaLDT;

                    NghiepVu.HV_KDT.TinhTongHocPhan(h);
                }
            }
            PhongTaiVu_QLHP_Load(sender, e);
        }

        private void dtgv_DSHocPhi_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = this.dtgv_DSHocPhi.Rows[e.RowIndex];
                string MaHV = row.Cells[0].Value.ToString();
                string MaLDT = row.Cells[2].Value.ToString();
                string HocPhi = row.Cells[5].Value.ToString();
                lb_MaHocVien.Text = MaHV;
                label6.Text = MaLDT;
                lb_HocPhi.Text = HocPhi;

            }
        }

        private void btn_DSChuaNop_Click(object sender, EventArgs e)
        {
            string namky = cbx_NamKy_DKHP.Text;

            DataTable dt2 = NghiepVu.HV_KDT.DSChuaNopHocPhi(namky);
            dtgv_DSHocPhi.DataSource = dt2;
            dtgv_DSHocPhi.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dtgv_DSHocPhi.AutoResizeColumns();
        }
    }
}
