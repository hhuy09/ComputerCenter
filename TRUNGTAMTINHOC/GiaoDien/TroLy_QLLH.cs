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
    public partial class TroLy_QLLH : Form
    {
        public string MaNV;
        public string HoTen;
        public string MaLopHoc;
        public string NamKy;
        public string HocPhan;
        public string NVChuyenMon;

        public TroLy_QLLH()
        {
            InitializeComponent();
        }
    
        private void TroLy_QLLH_Load(object sender, EventArgs e)
        {
            label2.Text = HoTen;
            DataTable dt1 = NghiepVu.LichHoc.DanhSachLichHoc();
            dataGridView1.DataSource = dt1;
            MaLopHoc = dataGridView1.Rows[0].Cells[0].Value.ToString();
            NamKy = dataGridView1.Rows[0].Cells[1].Value.ToString();
            HocPhan = dataGridView1.Rows[0].Cells[2].Value.ToString();
            NVChuyenMon = dataGridView1.Rows[0].Cells[3].Value.ToString();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = this.dataGridView1.Rows[e.RowIndex];
                MaLopHoc = row.Cells[0].Value.ToString();
                NamKy = row.Cells[1].Value.ToString();
                HocPhan = row.Cells[2].Value.ToString();
                NVChuyenMon = row.Cells[3].Value.ToString();
               
            }
        }
        private void button1_Click(object sender, EventArgs e)
        {
            DangNhap dn = new DangNhap();
            this.Close();
            dn.Show();
        }
       
        private void button2_Click(object sender, EventArgs e)
        {
            GiaoDien.TroLy_QLLH_Them them = new GiaoDien.TroLy_QLLH_Them();
            them.Show();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            DataTable dt1 = NghiepVu.LichHoc.DanhSachLichHoc();
            dataGridView1.DataSource = dt1;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            GiaoDien.TroLy_QLLH_Xoa xoa = new GiaoDien.TroLy_QLLH_Xoa();
            xoa.MaLopHoc = MaLopHoc;
            xoa.Show();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {
            GiaoDien.TroLy_QLLH_CapNhat sua = new GiaoDien.TroLy_QLLH_CapNhat();
            sua.MaLopHoc = MaLopHoc;
            sua.NamKy = NamKy;
            sua.HocPhan = HocPhan;
            sua.NVChuyenMon = NVChuyenMon;
            sua.Show();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            MaLopHoc = textBox1.Text;
            NVChuyenMon = textBox2.Text;
            HocPhan = textBox3.Text;
            DataTable dt1 = NghiepVu.LichHoc.TimKiemLichHoc(MaLopHoc, HocPhan, NVChuyenMon);
            dataGridView1.DataSource = dt1;
        }
    }
}
