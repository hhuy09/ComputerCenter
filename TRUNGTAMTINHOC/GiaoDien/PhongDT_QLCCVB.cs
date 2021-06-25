using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

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

        private void dataGridView3_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = this.dataGridView3.Rows[e.RowIndex];
                string ma_ldt = row.Cells[0].Value.ToString();
                DataTable dt2 = NghiepVu.HV_KDT.DanhSachHVien(ma_ldt);
                dataGridView1.DataSource = dt2;
            }
        }

        private void PhongDT_QLCCVB_Load(object sender, EventArgs e)
        {
            label2.Text = HoTen;


            DataTable dt = NghiepVu.KhoaHoc.Danhsachkhoahoc(namky);
            dataGridView3.DataSource = dt;
            string ma_ldt = dataGridView3.Rows[0].Cells[0].Value.ToString();
            DataTable dt2 = NghiepVu.HV_KDT.DanhSachHVien(ma_ldt);
            dataGridView1.DataSource = dt2;
            // Trang 2
            DataTable dt1 = NghiepVu.KhoaHoc.DSNHP(namky);
            dataGridView2.DataSource = dt1;
          
          
           


        }

        private void button1_Click(object sender, EventArgs e)
        {
            DangNhap dn = new DangNhap();
            this.Close();
            dn.Show();
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void dataGridView3_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView4_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView2_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            Mahv = dataGridView2.Rows[e.RowIndex].Cells[0].Value.ToString();
            MaNHP = dataGridView2.Rows[e.RowIndex].Cells[2].Value.ToString();
            DataTable dt = NghiepVu.KhoaHoc.DIEMHP(Mahv, MaNHP);
            dataGridView4.DataSource = dt;
        }

        private void tabPage1_Click(object sender, EventArgs e)
        {

        }
    }
}
