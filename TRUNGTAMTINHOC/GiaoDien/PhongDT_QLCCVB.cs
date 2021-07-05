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

        public PhongDT_QLCCVB()
        {
            InitializeComponent();
        }

       
        private void btn_ThoatPDT_Click(object sender, EventArgs e)
        {
            DangNhap dn = new DangNhap();
            this.Close();
        }
     
        private void dtgv_Load_DGHP_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = this.dtgv_Load_DGHP.Rows[e.RowIndex];
                string mahv = row.Cells[0].Value.ToString();
                string manhp = row.Cells[2].Value.ToString();
                HocVien hv = new HocVien();
                hv.MaHocVien = mahv;
                NhomHocPhan nhp = new NhomHocPhan();
                nhp.MaNHP = manhp;

                DataTable dt3 = NghiepVu.DiemThi.DiemNhomHocPhan(hv, nhp);
                dtgv_Load_DHP.DataSource = dt3;
                dtgv_Load_DHP.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                dtgv_Load_DHP.AutoResizeColumns();
            }
           
        }

        private void btn_DGKH_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < dtgv_Load_DGKH.Rows.Count - 1; i++)
            {
                string MaHocVien = dtgv_Load_DGKH.Rows[i].Cells[0].Value.ToString();
                string KhoaHoc = dtgv_Load_DGKH.Rows[i].Cells[2].Value.ToString();

                NghiepVu.DanhGiaKhoaHoc dg = new DanhGiaKhoaHoc();
                dg.HocVien = MaHocVien;
                dg.KhoaHoc = KhoaHoc;
                NghiepVu.DanhGiaKhoaHoc.DanhGiaKhoaHocHV(dg);
            }

            PhongDT_QLCCVB_Load(sender, e);
        }

        private void btn_Load_DSCCVB_NHP_Click(object sender, EventArgs e)
        {
            DataTable dt2 = NghiepVu.DanhGiaNHP.DSCapChungChi();
            dtgv_Load_DGHP.DataSource = dt2;
            dtgv_Load_DGHP.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dtgv_Load_DGHP.AutoResizeColumns();

            string mahv = dtgv_Load_DGHP.Rows[0].Cells[0].Value.ToString();
            string manhp = dtgv_Load_DGHP.Rows[0].Cells[2].Value.ToString();
            HocVien hv = new HocVien();
            hv.MaHocVien = mahv;
            NhomHocPhan nhp = new NhomHocPhan();
            nhp.MaNHP = manhp;
            DataTable dt3 = NghiepVu.DiemThi.DiemNhomHocPhan(hv, nhp);
            dtgv_Load_DHP.DataSource = dt3;
            dtgv_Load_DHP.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dtgv_Load_DHP.AutoResizeColumns();
        }

        private void btn_DGNHP_Click(object sender, EventArgs e)
        {

            for (int i = 0; i < dtgv_Load_DGHP.Rows.Count - 1; i++)
            {
                string MaHocVien = dtgv_Load_DGHP.Rows[i].Cells[0].Value.ToString();
                string MaNHP = dtgv_Load_DGHP.Rows[i].Cells[2].Value.ToString();

                NghiepVu.DanhGiaNHP dg = new DanhGiaNHP();
                dg.HocVien = MaHocVien;
                dg.NhomHocPhan = MaNHP;
                NghiepVu.DanhGiaNHP.DanhGiaNhomHocPhan(dg);
            }

            PhongDT_QLCCVB_Load(sender, e);

        }

        private void btn_DSKHCD_Click(object sender, EventArgs e)
        {
            DataTable dt4 = NghiepVu.DanhGiaKhoaHoc.DSCapVanBang();
            dtgv_Load_DGKH.DataSource = dt4;
            dtgv_Load_DGKH.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dtgv_Load_DGKH.AutoResizeColumns();

            string hocvien = dtgv_Load_DGKH.Rows[0].Cells[0].Value.ToString();
            string makh = dtgv_Load_DGKH.Rows[0].Cells[2].Value.ToString();
            HocVien hv = new HocVien();
            hv.MaHocVien = hocvien;
            KhoaHoc kh = new KhoaHoc();
            kh.MaKhoaHoc = makh;
            DataTable dt5 = NghiepVu.DiemThi.DiemKhoaHoc(hv, kh);
            dataGridView1.DataSource = dt5;
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView1.AutoResizeColumns();
        }


        private void PhongDT_QLCCVB_Load(object sender, EventArgs e)
        {
            label2.Text = HoTen;
            
            string NamKy = cbx_Namky.Text;
            NghiepVu.NamKy namky = new NamKy();
            namky.Namky = NamKy;

            DataTable dt = NghiepVu.KhoaDaoTao.DanhSachTatCaLopDaoTao(namky);
            dtgv_DSKDT.DataSource = dt;
            dtgv_DSKDT.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dtgv_DSKDT.AutoResizeColumns();

            string malopdt = dtgv_DSKDT.Rows[0].Cells[1].Value.ToString();
            NghiepVu.HV_KDT ldt = new HV_KDT();
            ldt.LopDT = malopdt;
            DataTable dt1 = NghiepVu.HV_KDT.DanhSachHocVien(ldt);
            dtgv_Load_DSHV.DataSource = dt1;
            dtgv_Load_DSHV.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dtgv_Load_DSHV.AutoResizeColumns();

            DataTable dt2 = NghiepVu.DanhGiaNHP.Danhsach_hocVien_NHP();
            dtgv_Load_DGHP.DataSource = dt2;
            dtgv_Load_DGHP.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dtgv_Load_DGHP.AutoResizeColumns();
            string mahv=null;
            string manhp=null;
            if (dtgv_Load_DGHP.Rows.Count > 1)
            {
                mahv = dtgv_Load_DGHP.Rows[0].Cells[0].Value.ToString();
                manhp = dtgv_Load_DGHP.Rows[0].Cells[2].Value.ToString();
            }          
            HocVien hv = new HocVien();
            hv.MaHocVien = mahv;
            NhomHocPhan nhp = new NhomHocPhan();
            nhp.MaNHP = manhp;

            DataTable dt3 = NghiepVu.DiemThi.DiemNhomHocPhan(hv, nhp);
            dtgv_Load_DHP.DataSource = dt3;
            dtgv_Load_DHP.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dtgv_Load_DHP.AutoResizeColumns();

            DataTable dt4 = NghiepVu.DanhGiaKhoaHoc.DS_DG_HVKH();
            dtgv_Load_DGKH.DataSource = dt4;
            dtgv_Load_DGKH.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dtgv_Load_DGKH.AutoResizeColumns();
            string hocvien=null;
            string makh=null;
            if (dtgv_Load_DGKH.Rows.Count > 1)
            {
                hocvien = dtgv_Load_DGKH.Rows[0].Cells[0].Value.ToString();
                makh = dtgv_Load_DGKH.Rows[0].Cells[2].Value.ToString();
            }                
            hv.MaHocVien = hocvien;
            KhoaHoc kh = new KhoaHoc();
            kh.MaKhoaHoc = makh;
            DataTable dt5 = NghiepVu.DiemThi.DiemKhoaHoc(hv, kh);
            dataGridView1.DataSource = dt5;
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView1.AutoResizeColumns();


        }

        private void dtgv_DSKDT_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = this.dtgv_DSKDT.Rows[e.RowIndex];
                string malopdt = row.Cells[1].Value.ToString();
                NghiepVu.HV_KDT ldt = new HV_KDT();
                ldt.LopDT = malopdt;
                DataTable dt1 = NghiepVu.HV_KDT.DanhSachHocVien(ldt);
                dtgv_Load_DSHV.DataSource = dt1;
                dtgv_Load_DSHV.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                dtgv_Load_DSHV.AutoResizeColumns();
            }
        }

        private void dtgv_Load_DGKH_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = this.dtgv_Load_DGKH.Rows[e.RowIndex];
                string hocvien = row.Cells[0].Value.ToString();
                string makh = row.Cells[2].Value.ToString();
                HocVien hv = new HocVien();
                hv.MaHocVien = hocvien;
                KhoaHoc kh = new KhoaHoc();
                kh.MaKhoaHoc = makh;
                DataTable dt5 = NghiepVu.DiemThi.DiemKhoaHoc(hv, kh);
                dataGridView1.DataSource = dt5;
                dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                dataGridView1.AutoResizeColumns();
            }
        }
    }
}
