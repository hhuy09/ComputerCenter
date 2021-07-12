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

namespace TRUNGTAMTINHOC
{
    public partial class HocVien_DKKHCD : Form
    {
       public string MaHV;
       public string HoTen;
       

        public HocVien_DKKHCD()
        {
            InitializeComponent();
        }

        private void HocVien_DKKHCD_Load(object sender, EventArgs e)
        {
            label2.Text = HoTen;
            HV_KDT hv_kdt = new HV_KDT();
            hv_kdt.HocVien = MaHV;

            DataTable dt1 = NghiepVu.HV_KDT.DanhSachDKKH(hv_kdt);
            dt1.Columns.Add(new DataColumn("HuyDK", typeof(bool)));
            dataGridView_DSKHDK.DataSource = dt1;
            dataGridView_DSKHDK.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView_DSKHDK.AutoResizeColumns();
            int count1 = dataGridView_DSKHDK.Rows.Count - 1;

            HocVien hv = new HocVien();
            hv.MaHocVien = MaHV;
            DataTable dt2 = NghiepVu.HV_LCD.DanhSachDKCD(hv);
            dt2.Columns.Add(new DataColumn("HuyDK", typeof(bool)));
            dataGridView_DSCDDK.DataSource = dt2;
            dataGridView_DSCDDK.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView_DSCDDK.AutoResizeColumns();
            int count2 = dataGridView_DSCDDK.Rows.Count - 1;


            NamKy namky = new NamKy();
            namky.Namky = "2021-1";
            DataTable dt3 = NghiepVu.KhoaDaoTao.DanhSachLopDaoTao(namky);
            dt3.Columns.Add(new DataColumn("DangKy", typeof(bool)));
            dataGridView_DSKH.DataSource = dt3;
            dataGridView_DSKH.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView_DSKH.AutoResizeColumns();

            DataTable dt4 = NghiepVu.LopChuyenDe.DanhSachLopChuyenDe(namky);
            dt4.Columns.Add(new DataColumn("DangKy", typeof(bool)));
            dataGridView_DDCD.DataSource = dt4;
            dataGridView_DDCD.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView_DDCD.AutoResizeColumns();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            int rows = dataGridView_DSKH.Rows.Count - 1;
            for (int i = 0; i < rows; i++)
            {
                string dk = dataGridView_DSKH.Rows[i].Cells[7].Value.ToString();
                if (dk == "True")
                {
                    string MaLDT = dataGridView_DSKH.Rows[i].Cells[1].Value.ToString();

                    NghiepVu.HV_KDT hvlcd = new HV_KDT();
                    hvlcd.HocVien = MaHV;
                    hvlcd.LopDT = MaLDT;


                    NghiepVu.HV_KDT.DangKyKhoaHoc(hvlcd);
                }
            }

            HocVien_DKKHCD_Load(sender, e);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }



        private void button3_Click(object sender, EventArgs e)
        {
            int rows = dataGridView_DSKHDK.Rows.Count - 1;
            for (int i = 0; i < rows; i++)
            {
                string dk = dataGridView_DSKHDK.Rows[i].Cells[6].Value.ToString();
                if (dk == "True")
                {
                    string MaLDT = dataGridView_DSKHDK.Rows[i].Cells[1].Value.ToString();

                    NghiepVu.HV_KDT hvldt = new HV_KDT();
                    hvldt.HocVien = MaHV;
                    hvldt.LopDT = MaLDT;

                    NghiepVu.HV_KDT.HuyDangKyKhoaHoc(hvldt);
                }
            }

            HocVien_DKKHCD_Load(sender, e);
        }

        private void button4_Click(object sender, EventArgs e)
        {     
            int rows = dataGridView_DDCD.Rows.Count - 1;
            for (int i = 0; i < rows; i++)
            {
                string dk = dataGridView_DDCD.Rows[i].Cells[6].Value.ToString();
                if (dk == "True")
                {
                    string MaLCD = dataGridView_DDCD.Rows[i].Cells[1].Value.ToString();

                    NghiepVu.HV_LCD hvlcd = new HV_LCD();
                    hvlcd.HocVien = MaHV;
                    hvlcd.LopChuyenDe = MaLCD;


                    NghiepVu.HV_LCD.DangKyChuyenDe(hvlcd);
                }
            }

            HocVien_DKKHCD_Load(sender, e);
        }


        private void button5_Click(object sender, EventArgs e)
        {
            int rows = dataGridView_DSCDDK.Rows.Count - 1;
            for (int i = 0; i < rows; i++)
            {
                string dk = dataGridView_DSCDDK.Rows[i].Cells[5].Value.ToString();
                if (dk == "True")
                {
                    string MaLCD = dataGridView_DSCDDK.Rows[i].Cells[1].Value.ToString();

                    NghiepVu.HV_LCD hvlcd = new HV_LCD();
                    hvlcd.HocVien = MaHV;
                    hvlcd.LopChuyenDe = MaLCD;

                    NghiepVu.HV_LCD.HuyDangKyChuyenDe(hvlcd);
                }
            }

            HocVien_DKKHCD_Load(sender, e);
        }

    }
}
