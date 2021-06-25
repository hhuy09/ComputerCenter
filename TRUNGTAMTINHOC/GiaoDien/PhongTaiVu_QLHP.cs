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
            DataProvider provider = new DataProvider();
            string query = "exec USP_DS_ChuaNop_HocPhi @namky";

            dtgv_DSHocPhi.DataSource = DataProvider.Instance.ExecuteQuery(query, new object[] { NamKy });
        }

        private void btn_TinhHocPhi_Click(object sender, EventArgs e)
        {
            DataProvider provider = new DataProvider();
            string query = "exec USP_TinhHocPhi @namky";

            dtgv_DSHocPhi.DataSource = DataProvider.Instance.ExecuteNonQuery(query, new object[] { NamKy });

            string query2 = "exec USP_DS_ChuaNop_HocPhi @namky";

            dtgv_DSHocPhi.DataSource = DataProvider.Instance.ExecuteQuery(query2, new object[] { NamKy });

            }

        //void Add_HocPhi_Binding()
        //{
        //    lb_MaHocVien.DataBindings.Add(new Binding("Text", dtgv_DSHocPhi.DataSource, "HocVien"));
        //}

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

        void NopHocPhi(string mahocvien)
        {
            string query = "exec USP_NopHocPhi @mahocvien ";
            DataProvider.Instance.ExecuteNonQuery(query, new object[] { mahocvien });
        }

        void HuyNopHocPhi(string mahocvien)
        {
            string query = "exec USP_HuyNopHocPhi @mahocvien ";
            DataProvider.Instance.ExecuteNonQuery(query, new object[] { mahocvien });
        }

        private void btn_Nop_Click(object sender, EventArgs e)
        {

            NopHocPhi(HocVien);
        }

        private void btn_Huy_Click(object sender, EventArgs e)
        {
            HuyNopHocPhi(HocVien);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
