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
    public partial class PhongTaiVu_QLHP : Form
    {
        
        public PhongTaiVu_QLHP()
        {
            InitializeComponent();
            Load_NamKy();
            //lb_TenNV.Text = PhongTaiVu.HoTen;
        }

        private string namKy;
        private string hocVien;
        private string hocPhi;

        public string NamKy { get => namKy; set => namKy = value; }
        public string HocVien { get => hocVien; set => hocVien = value; }
        public string HocPhi { get => hocPhi; set => hocPhi = value; }

        void Load_NamKy()
        {
            List<NamKy> listNamKy = NamKy_DB_H.Instance.GetListNamKy();
            cbx_NamKy_DKHP.DataSource = listNamKy;
            cbx_NamKy_DKHP.DisplayMember = "NamKy";
        }

        void Load_DSDKHP_NamKy(string namky)
        {
           // List<DSDKHocPhan> listDSDKHocPhan = DSDKHocPhanDB.Instance.GetListDSDK(namky);
            dtgv_dsdkHocPhan.DataSource = DSDKHocPhanDB.Instance.GetListDSDK_NamKy(namky);

        }

        void Load_DSChuaNopHocPhi_NamKy(string namky)
        {
            dtgv_DSHocPhi.DataSource = DSHocPhiDB.Instance.GetList_ChuaNopHocPhi(namky);

        }

        void Load_DSHocPhi_NamKy(string namky)
        {
            dtgv_DSHocPhi.DataSource = DSHocPhiDB.Instance.GetListDSHocPhi_NamKy(namky);
        }

        private void cbx_NamKy_DKHP_SelectedIndexChanged(object sender, EventArgs e)
        {

            ComboBox cb = sender as ComboBox;
            NamKy selected = cb.SelectedItem as NamKy;

            if (cb.SelectedItem == null)
                return;

            NamKy = selected.Namky;

            Load_DSDKHP_NamKy(NamKy);
            Load_DSHocPhi_NamKy(NamKy);
        }

        

        private void btn_DSChuaNop_Click(object sender, EventArgs e)
        {

            Load_DSChuaNopHocPhi_NamKy(NamKy);
        }

        private void btn_TinhHocPhi_Click(object sender, EventArgs e)
        {
            DSHocPhiDB.Instance.TinhHocPhi(NamKy);

            Load_DSHocPhi_NamKy(NamKy);

        }

       
        private void dtgv_DSHocPhi_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dtgv_DSHocPhi.Rows[e.RowIndex].Cells[e.ColumnIndex].Value != null)
            {
                dtgv_DSHocPhi.CurrentRow.Selected = true;
                lb_MaHocVien.Text = dtgv_DSHocPhi.Rows[e.RowIndex].Cells["HocVien"].FormattedValue.ToString();
                lb_HocPhi.Text = dtgv_DSHocPhi.Rows[e.RowIndex].Cells["HocPhi"].FormattedValue.ToString();

                HocVien = lb_MaHocVien.Text;
            }           
        }

       

        private void btn_Nop_Click(object sender, EventArgs e)
        {

            DSHocPhiDB.Instance.NopHocPhi(HocVien);
            Load_DSChuaNopHocPhi_NamKy(NamKy);
        }

        private void btn_Huy_Click(object sender, EventArgs e)
        {
            DSHocPhiDB.Instance.HuyNopHocPhi(HocVien);
            Load_DSChuaNopHocPhi_NamKy(NamKy);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void PhongTaiVu_QLHP_Load(object sender, EventArgs e)
        {

        }
    }
}
