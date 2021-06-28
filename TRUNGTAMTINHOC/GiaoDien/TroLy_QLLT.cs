using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using TRUNGTAMTINHOC.NghiepVu;

namespace TRUNGTAMTINHOC.GiaoDien
{
    public partial class TroLy_QLLT : Form
    {
        public string MaNV;
        public string HoTen;

        public TroLy_QLLT()
        {
            InitializeComponent();
        }

        private void TroLy_QLLT_Load(object sender, EventArgs e)
        {
            label2.Text = HoTen;

            string NamKy = comboBox1.Text;
            NghiepVu.KhoaDaoTao kdt = new KhoaDaoTao();
            kdt.NVTroLy = MaNV;
            kdt.NamKy = NamKy;

            DataTable dt1 = NghiepVu.LichThi.LichThiHP(kdt);
            dataGridView1.DataSource = dt1;
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView1.AutoResizeColumns();

            DataTable dt2 = NghiepVu.KhoaDaoTao.DanhSachLichThiTNTroLy(kdt);
            dataGridView2.DataSource = dt2;
            dataGridView2.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView2.AutoResizeColumns();

            DataTable dt3 = NghiepVu.LopHoc.DanhSachLopHoc(kdt);
            dataGridView3.DataSource = dt3;
            dataGridView3.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView3.AutoResizeColumns();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            string MaLH = label12.Text;
            string NgayThi = dateTimePicker1.Text;

            NghiepVu.LichThi lt = new LichThi();
            lt.LopHoc = MaLH;
            lt.NgayThi = NgayThi;

            NghiepVu.LichThi.ThemLichThiHP(lt);

            string NamKy = comboBox1.Text;
            NghiepVu.KhoaDaoTao kdt = new KhoaDaoTao();
            kdt.NVTroLy = MaNV;
            kdt.NamKy = NamKy;

            DataTable dt1 = NghiepVu.LichThi.LichThiLopHP(kdt, MaLH);
            dataGridView1.DataSource = dt1;
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView1.AutoResizeColumns();
        }

        private void dataGridView3_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = this.dataGridView3.Rows[e.RowIndex];
                string MaLH = row.Cells[1].Value.ToString();
                label12.Text = MaLH;
                string NamKy = comboBox1.Text;
                NghiepVu.KhoaDaoTao kdt = new KhoaDaoTao();
                kdt.NVTroLy = MaNV;
                kdt.NamKy = NamKy;

                DataTable dt1 = NghiepVu.LichThi.LichThiLopHP(kdt, MaLH);
                dataGridView1.DataSource = dt1;
                dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                dataGridView1.AutoResizeColumns();
            }
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = this.dataGridView1.Rows[e.RowIndex];
                string MaLT = row.Cells[1].Value.ToString();
                label4.Text = MaLT;
                string NgThi = row.Cells[4].Value.ToString();
                NgThi = NgThi.Substring(0, NgThi.IndexOf(" "));
                DateTime NgayThi = DateTime.Parse(NgThi);

                dateTimePicker3.Value = NgayThi;
            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
            string NamKy = comboBox1.Text;
            NghiepVu.KhoaDaoTao kdt = new KhoaDaoTao();
            kdt.NVTroLy = MaNV;
            kdt.NamKy = NamKy;

            DataTable dt1 = NghiepVu.LichThi.LichThiHP(kdt);
            dataGridView1.DataSource = dt1;
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView1.AutoResizeColumns();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            NghiepVu.LichThi lt = new LichThi();
            lt.MaLichThi = label4.Text;

            NghiepVu.LichThi.XoaLichThiHP(lt);

            int row = dataGridView1.Rows.Count - 1;
            string NamKy = comboBox1.Text;
            NghiepVu.KhoaDaoTao kdt = new KhoaDaoTao();
            kdt.NVTroLy = MaNV;
            kdt.NamKy = NamKy;

            if (row <= 3)
            {
                string MaLH = dataGridView1.Rows[0].Cells[2].Value.ToString();         

                DataTable dt1 = NghiepVu.LichThi.LichThiLopHP(kdt, MaLH);
                dataGridView1.DataSource = dt1;
                dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                dataGridView1.AutoResizeColumns();
            }
            else
            {
                DataTable dt1 = NghiepVu.LichThi.LichThiHP(kdt);
                dataGridView1.DataSource = dt1;
                dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                dataGridView1.AutoResizeColumns();
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            string MaLT = label4.Text;
            string NgThi = dateTimePicker3.Text;
            NghiepVu.LichThi lt = new LichThi();
            lt.MaLichThi = MaLT;
            lt.NgayThi = NgThi;

            NghiepVu.LichThi.CapNhatLichThiHP(lt);

            int row = dataGridView1.Rows.Count - 1;
            string NamKy = comboBox1.Text;
            NghiepVu.KhoaDaoTao kdt = new KhoaDaoTao();
            kdt.NVTroLy = MaNV;
            kdt.NamKy = NamKy;

            if (row <= 3)
            {
                string MaLH = dataGridView1.Rows[0].Cells[2].Value.ToString();

                DataTable dt1 = NghiepVu.LichThi.LichThiLopHP(kdt, MaLH);
                dataGridView1.DataSource = dt1;
                dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                dataGridView1.AutoResizeColumns();
            }
            else
            {
                DataTable dt1 = NghiepVu.LichThi.LichThiHP(kdt);
                dataGridView1.DataSource = dt1;
                dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                dataGridView1.AutoResizeColumns();
            }
        }

        private void dataGridView2_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = this.dataGridView2.Rows[e.RowIndex];
                string MaLT = row.Cells[1].Value.ToString();
                label10.Text = MaLT;
                string NgThi = row.Cells[3].Value.ToString();
                NgThi = NgThi.Substring(0, NgThi.IndexOf(" "));
                DateTime NgayThi = DateTime.Parse(NgThi);
                dateTimePicker2.Value = NgayThi;
            }
        }

        private void button6_Click(object sender, EventArgs e)
        {
            string MaLDT = label10.Text;
            string NgThi = dateTimePicker2.Text;
            NghiepVu.KhoaDaoTao kdt = new KhoaDaoTao();
            kdt.MaLopDT = MaLDT;
            kdt.NgayThiTN = NgThi;

            NghiepVu.KhoaDaoTao.CapNhatLichThiTNTroLy(kdt);

            TroLy_QLLT_Load(sender, e);
        }
    }
}
