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

namespace TRUNGTAMTINHOC.GiaoDien
{
    public partial class PhongDT_QLCCVB : Form
    {
        public string MaNV;
        public string HoTen;
        public string namky = "2021-1";
        public string lopDT;
        public string Mahv;
        public string MaNHP;
        public PhongDT_QLCCVB()
        {
            InitializeComponent();
        }
        
        public void load_cbx()
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = this.dataGridView3.Rows[e.RowIndex];
                string ma_ldt = row.Cells[0].Value.ToString();
                HV_KDT hv_kdt = new HV_KDT();
                hv_kdt.LopDT = ma_ldt;
                DataTable dt2 = NghiepVu.HV_KDT.DanhSachHocVien(hv_kdt);
                dataGridView1.DataSource = dt2;
            }
            cbx_Namky.DataSource = NghiepVu.NamKy.load_data_cbx();
            cbx_Namky.DisplayMember = "Namky";
            cbx_Namky.ValueMember = "Namky";
        }
        
        private void PhongDT_QLCCVB_Load(object sender, EventArgs e)
        {
            label2.Text = HoTen;
            this.load_cbx();

            //tabControl1
            DataTable dt = NghiepVu.KhoaHoc.Danhsachkhoahoc(namky);
            dataGridView3.DataSource = dt;
            string ma_ldt = dataGridView3.Rows[0].Cells[0].Value.ToString();
            HV_KDT hv_kdt = new HV_KDT();
            hv_kdt.LopDT = ma_ldt;
            DataTable dt2 = NghiepVu.HV_KDT.DanhSachHocVien(hv_kdt);
            dataGridView1.DataSource = dt2;
            // Trang 2
            DataTable dt1 = NghiepVu.KhoaHoc.DSNHP(namky);
            dataGridView2.DataSource = dt1;
          
            dtgv_DSKDT.DataSource = dt;

            string ma_ldt = dtgv_DSKDT.Rows[0].Cells[0].Value.ToString();
            DataTable dt2 = NghiepVu.HV_KDT.DanhSachHVien(ma_ldt);
            dtgv_Load_DSHV.DataSource = dt2;

            // tabControl2
            DataTable dt1 = NghiepVu.DanhGiaNHP.Danhsach_hocVien_NHP(namky);
            dtgv_Load_DGHP.DataSource = dt1;

            string Mahv = dtgv_Load_DGHP.Rows[0].Cells[0].Value.ToString();
            string MaNHP = dtgv_Load_DGHP.Rows[0].Cells[2].Value.ToString();
            DataTable dt3 = NghiepVu.DiemThi.DIEM_HP_NHP(Mahv, MaNHP);
            dtgv_Load_DHP.DataSource = dt3;
            //tabControl3
            DataTable dt4 = NghiepVu.DanhGiaKhoaHoc.DS_DG_HVKH(namky);
            dtgv_Load_DGKH.DataSource = dt4;

            string Mahv_kh = dtgv_Load_DGHP.Rows[0].Cells[0].Value.ToString();
            string MaKH = dtgv_Load_DGHP.Rows[0].Cells[2].Value.ToString();
            DataTable dt5 = NghiepVu.DiemThi.Diem_HocPhan_HVKH(Mahv, MaNHP);
            dtgv_Load_DHPKH.DataSource = dt5;

        }
        
        private void dtgv_DSKDT_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = this.dtgv_DSKDT.Rows[e.RowIndex];
                string ma_ldt = row.Cells[0].Value.ToString();
                DataTable dt2 = NghiepVu.HV_KDT.DanhSachHVien(ma_ldt);
                dtgv_Load_DSHV.DataSource = dt2;
            }
        }
        
        private void btn_ThoatPDT_Click(object sender, EventArgs e)
        {
            DangNhap dn = new DangNhap();
            this.Close();
            dn.Show();
        }
     
        private void dtgv_Load_DGHP_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = this.dtgv_Load_DGHP.Rows[e.RowIndex];
                string Mahv = row.Cells[0].Value.ToString();
                string MaNHP = row.Cells[2].Value.ToString();
                DataTable dt = NghiepVu.DiemThi.DIEM_HP_NHP(Mahv, MaNHP);
                dtgv_Load_DHP.DataSource = dt;
            }
           
        }

        private void btn_Load_DSCD_Click(object sender, EventArgs e)
        {
            DataTable dt = NghiepVu.DanhGiaNHP.DS_HV_NHP_CD(namky);
            dtgv_Load_DGHP.DataSource = dt;

            string Mahv = dtgv_Load_DGHP.Rows[0].Cells[0].Value.ToString();
            string MaNHP = dtgv_Load_DGHP.Rows[0].Cells[2].Value.ToString();
            DataTable dt3 = NghiepVu.DiemThi.DIEM_HP_NHP(Mahv, MaNHP);
            dtgv_Load_DHP.DataSource = dt3;
        }
        private void btn_DGKH_Click(object sender, EventArgs e)
        {
            string MaHocVien;
            string MaKH;
            if (dtgv_Load_DGHP.Rows.Count == 1)
            {
                return;
            }
            else
            {
              
                for (int i = 0; i < dtgv_Load_DGKH.RowCount - 1; i++)
                {
                    MaHocVien = dtgv_Load_DGKH.Rows[i].Cells[0].Value.ToString();
                    MaKH = dtgv_Load_DGKH.Rows[i].Cells[2].Value.ToString();
                    NghiepVu.DanhGiaKhoaHoc.UPDATE_DAT_KH(MaHocVien, MaKH);
                }
            }
            DataTable dt = NghiepVu.DanhGiaKhoaHoc.DS_DG_HVKH(namky);
            dtgv_Load_DGKH.DataSource = dt;


        }
        private void btn_Load_DSCCVB_NHP_Click(object sender, EventArgs e)
        {
            DataTable dt = NghiepVu.DanhGiaNHP.DSCCVB_NHP(namky);
            dtgv_Load_DGHP.DataSource = dt;
        }


        private void btn_DSCCCVB_KH_Click(object sender, EventArgs e)
        {
            DataTable dt = NghiepVu.DanhGiaKhoaHoc.DSCCVB_KH(namky);
            dtgv_Load_DGKH.DataSource = dt;
        }

        private void btn_DGNHP_Click(object sender, EventArgs e)
        {
            string MaHocVien;
            string MaNHP;
     

            for (int i = 0; i < dtgv_Load_DGKH.Rows.Count -1; i++)
            {
                MaHocVien = dtgv_Load_DGHP.Rows[i].Cells[0].Value.ToString();
                MaNHP = dtgv_Load_DGHP.Rows[i].Cells[2].Value.ToString();
                NghiepVu.DanhGiaNHP.UPDATE_DGNHP(MaHocVien, MaNHP);
            }
            DataTable dt = NghiepVu.DanhGiaNHP.Danhsach_hocVien_NHP(namky);
            dtgv_Load_DGHP.DataSource = dt;
        }

        private void btn_DSKHCD_Click(object sender, EventArgs e)
        {
            DataTable dt = NghiepVu.DanhGiaKhoaHoc.DS_HV_CHUADAT_KH(namky);
            dtgv_Load_DGKH.DataSource = dt;
        }

        private void button3_Click(object sender, EventArgs e)
        {

        }
    }
}
