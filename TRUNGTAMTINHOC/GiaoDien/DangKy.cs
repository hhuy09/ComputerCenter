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
    public partial class DangKy : Form
    {
        public DangKy()
        {
            InitializeComponent();
        }

        private void DangKy_Load(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            string HoTen = textBox1.Text;
            string GioiTinh = comboBox1.Text;
            string SoDienThoai = textBox2.Text;
            string Email = textBox3.Text;
            string MatKhau = textBox4.Text;
            string MK = textBox5.Text;

            if (HoTen == "" || GioiTinh == "" || SoDienThoai == "" || Email == "" || MatKhau == "" || MK == "")
            {
                MessageBox.Show("Thiếu thông tin. Vui lòng kiểm tra lại.");
            }
            else
            {
                NghiepVu.HocVien.KiemTraTonTaiEmail(Email);

                if (MatKhau == MK)
                {
                    bool result = NghiepVu.HocVien.DangKyHocVien(HoTen, GioiTinh, Email, SoDienThoai, MatKhau);
                    if(result == true)
                    {
                        MessageBox.Show("Đăng ký học viên thành công.\n Tên đăng nhập của bạn là " + Email);
                    }
                    else
                    {
                        MessageBox.Show("Đăng ký học viên không thành công. Vui lòng kiểm tra lại.");
                    }
                }
                else
                {
                    MessageBox.Show("Mật khẩu nhập lại không trùng khớp. Vui lòng kiểm tra lại.");
                }
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            DangNhap dn = new DangNhap();
            this.Hide();
            dn.Show();
        }
    }
}
