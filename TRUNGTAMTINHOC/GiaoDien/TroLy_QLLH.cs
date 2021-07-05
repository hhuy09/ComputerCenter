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

        public TroLy_QLLH()
        {
            InitializeComponent();
        }

        private void TroLy_QLLH_Load(object sender, EventArgs e)
        {
            label2.Text = HoTen;

            string NamKy = comboBox1.Text;
            NghiepVu.KhoaDaoTao kdt = new NghiepVu.KhoaDaoTao();
            kdt.NVTroLy = MaNV;
            kdt.NamKy = NamKy;
            NghiepVu.LopChuyenDe lcd = new NghiepVu.LopChuyenDe();
            lcd.NVTroLy = MaNV;
            lcd.NamKy = NamKy;

            DataTable dt1 = NghiepVu.LopHoc.DanhSachLichHocHP(kdt);
            dataGridView1.DataSource = dt1;
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView1.AutoResizeColumns();

            DataTable dt2 = NghiepVu.KhoaDaoTao.DanhSachLopDaoTao(kdt);
            dataGridView2.DataSource = dt2;
            dataGridView2.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView2.AutoResizeColumns();

            DataTable dt3 = NghiepVu.LopChuyenDe.DanhSachLopChuyenDe(lcd);
            dataGridView3.DataSource = dt3;
            dataGridView3.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView3.AutoResizeColumns();

        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void dataGridView2_CellClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
