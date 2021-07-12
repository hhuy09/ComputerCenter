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
    public partial class TroLy_QLLHGUI : Form
    {
        public string MaNV;
        public string HoTen;

        public TroLy_QLLHGUI()
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
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = this.dataGridView2.Rows[e.RowIndex];
                textBox5.Text = row.Cells[1].Value.ToString();
                comboBox4.Text = row.Cells[2].Value.ToString();
                dateTimePicker1.Text = row.Cells[4].Value.ToString();
                textBox2.Text = row.Cells[5].Value.ToString();

            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            NghiepVu.KhoaDaoTao kdt = new NghiepVu.KhoaDaoTao();
            kdt.MaLopDT = textBox5.Text;
            string makh = comboBox4.Text;
            if(makh.Length > 6)
            {
                makh = makh.Substring(0, makh.IndexOf(" "));
            }        
            kdt.KhoaHoc = makh;
            kdt.NamKy = comboBox1.Text;
            kdt.NVTroLy = MaNV;
            kdt.SiSo = int.Parse(textBox2.Text);
            kdt.NgayKhaiGiang = dateTimePicker1.Text;

            NghiepVu.KhoaDaoTao.ThemLopDaoTao(kdt);

            TroLy_QLLH_Load(sender, e);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            NghiepVu.KhoaDaoTao kdt = new NghiepVu.KhoaDaoTao();
            kdt.MaLopDT = textBox5.Text;

            NghiepVu.KhoaDaoTao.XoaLopDaoTao(kdt);

            TroLy_QLLH_Load(sender, e);
        }

        private void button4_Click(object sender, EventArgs e)
        {
            NghiepVu.KhoaDaoTao kdt = new NghiepVu.KhoaDaoTao();
            kdt.MaLopDT = textBox5.Text;
            string makh = comboBox4.Text;
            if (makh.Length > 6)
            {
                makh = makh.Substring(0, makh.IndexOf(" "));
            }
            kdt.KhoaHoc = makh;
            kdt.NamKy = comboBox1.Text;
            kdt.SiSo = int.Parse(textBox2.Text);
            kdt.NgayKhaiGiang = dateTimePicker1.Text;

            NghiepVu.KhoaDaoTao.CapNhatLopDaoTao(kdt);

            TroLy_QLLH_Load(sender, e);
        }

        private void button5_Click(object sender, EventArgs e)
        {
            textBox5.Text = null;
            comboBox4.Text = null;
            textBox2.Text = null;
            dateTimePicker1.Value = DateTime.Today;

            TroLy_QLLH_Load(sender, e);
        }

        private void button9_Click(object sender, EventArgs e)
        {
            NghiepVu.LopHoc lophoc = new NghiepVu.LopHoc();
            lophoc.MaLopHoc = textBox6.Text;
            lophoc.NamKy = comboBox1.Text;
            string hocphan = comboBox3.Text;
            if (hocphan.Length > 6)
            {
                hocphan = hocphan.Substring(0, hocphan.IndexOf(" "));
            }
            lophoc.HocPhan = hocphan;
            string nvcm = comboBox2.Text;
            if (nvcm.Length > 6)
            {
                nvcm = nvcm.Substring(0, nvcm.IndexOf(" "));
            }
            lophoc.NVChuyenMon = nvcm;
            lophoc.LichHoc = textBox3.Text;
            lophoc.SiSo = int.Parse(textBox1.Text);

            NghiepVu.LopHoc.ThemLopHoc(lophoc);
            TroLy_QLLH_Load(sender, e);
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if(e.RowIndex >= 0)
            {
                DataGridViewRow row = this.dataGridView1.Rows[e.RowIndex];
                textBox6.Text = row.Cells[1].Value.ToString();
                comboBox3.Text = row.Cells[2].Value.ToString();
                comboBox2.Text = row.Cells[3].Value.ToString();
                textBox3.Text = row.Cells[4].Value.ToString();
                textBox1.Text = row.Cells[5].Value.ToString(); ;

            }
        }

        private void button8_Click(object sender, EventArgs e)
        {
            NghiepVu.LopHoc lophoc = new NghiepVu.LopHoc();
            lophoc.MaLopHoc = textBox6.Text;

            NghiepVu.LopHoc.XoaLopHoc(lophoc);
            TroLy_QLLH_Load(sender, e);
        }

        private void button7_Click(object sender, EventArgs e)
        {
            NghiepVu.LopHoc lophoc = new NghiepVu.LopHoc();
            lophoc.MaLopHoc = textBox6.Text;
            lophoc.NamKy = comboBox1.Text;
            string hocphan = comboBox3.Text;
            if (hocphan.Length > 6)
            {
                hocphan = hocphan.Substring(0, hocphan.IndexOf(" "));
            }
            lophoc.HocPhan = hocphan;
            string nvcm = comboBox2.Text;
            if (nvcm.Length > 6)
            {
                nvcm = nvcm.Substring(0, nvcm.IndexOf(" "));
            }
            lophoc.NVChuyenMon = nvcm;
            lophoc.LichHoc = textBox3.Text;
            lophoc.SiSo = int.Parse(textBox1.Text);

            NghiepVu.LopHoc.CapNhatLopHoc(lophoc);
            TroLy_QLLH_Load(sender, e);
        }

        private void button13_Click(object sender, EventArgs e)
        {
            NghiepVu.LopChuyenDe lcd = new NghiepVu.LopChuyenDe();
            lcd.MaLopCD = textBox7.Text;
            lcd.SiSo = int.Parse(textBox4.Text);
            string cd = comboBox5.Text;
            if (cd.Length > 6)
            {
                cd = cd.Substring(0, cd.IndexOf(" "));
            }
            lcd.ChuyenDe = cd;
            lcd.NamKy = comboBox1.Text;
            lcd.NgayHoc = dateTimePicker2.Text;
            lcd.NVTroLy = MaNV;

            NghiepVu.LopChuyenDe.ThemLopChuyenDe(lcd);
            TroLy_QLLH_Load(sender, e);
        }

        private void button6_Click(object sender, EventArgs e)
        {
            textBox6.Text = null;
            comboBox3.Text = null;
            comboBox2.Text = null;
            textBox3.Text = null;
            textBox1.Text = null;
        }

        private void dataGridView3_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = this.dataGridView3.Rows[e.RowIndex];
                textBox7.Text = row.Cells[1].Value.ToString();
                textBox4.Text = row.Cells[5].Value.ToString();
                comboBox5.Text = row.Cells[2].Value.ToString();
                dateTimePicker2.Text = row.Cells[4].Value.ToString();

            }
            
        }

        private void button12_Click(object sender, EventArgs e)
        {
            NghiepVu.LopChuyenDe lcd = new NghiepVu.LopChuyenDe();
            lcd.MaLopCD = textBox7.Text;

            NghiepVu.LopChuyenDe.XoaLopChuyenDe(lcd);
            TroLy_QLLH_Load(sender, e);
        }

        private void button11_Click(object sender, EventArgs e)
        {
            NghiepVu.LopChuyenDe lcd = new NghiepVu.LopChuyenDe();
            lcd.MaLopCD = textBox7.Text;
            lcd.SiSo = int.Parse(textBox4.Text);
            string cd = comboBox5.Text;
            if (cd.Length > 6)
            {
                cd = cd.Substring(0, cd.IndexOf(" "));
            }
            lcd.ChuyenDe = cd;
            lcd.NamKy = comboBox1.Text;
            lcd.NgayHoc = dateTimePicker2.Text;
            lcd.NVTroLy = MaNV;

            NghiepVu.LopChuyenDe.CapNhatLopChuyenDe(lcd);
            TroLy_QLLH_Load(sender, e);
        }

        private void button10_Click(object sender, EventArgs e)
        {
            textBox7.Text = null;
            textBox4.Text = null;
            comboBox5.Text = null;
            dateTimePicker2.Value = DateTime.Today;
        }
    }
}
