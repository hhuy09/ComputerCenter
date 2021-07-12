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
    public partial class DangKyHocVienGUI : Form
    {
        public DangKyHocVienGUI()
        {
            InitializeComponent();
        }

        private void DangKy_Load(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            string HoTen = textBox_HoTen.Text;
            string GioiTinh = comboBox_GioiTinh.Text;
            string SoDienThoai = textBox_SoDienThoai.Text;
            string Email = textBox_Email.Text;
            string MatKhau = textBox_MatKhau.Text;
            string MK = textBox_XacNhanMatKhau.Text;

            if (HoTen == "" || GioiTinh == "" || SoDienThoai == "" || Email == "" || MatKhau == "" || MK == "")
            {
                MessageBox.Show("Thiếu thông tin. Vui lòng kiểm tra lại.");
            }
            else
            {
                NghiepVu.HocVien hocvien = new NghiepVu.HocVien();
                hocvien.Email = Email;
                NghiepVu.HocVien.KiemTraTonTaiEmail(hocvien);

                if (MatKhau == MK)
                {
                    hocvien.HoTen = HoTen;
                    hocvien.GioiTinh = GioiTinh;
                    hocvien.Email = Email;
                    hocvien.SoDienThoai = SoDienThoai;
                    hocvien.MatKhau = MatKhau;

                    bool result = NghiepVu.HocVien.DangKyHocVien(hocvien);
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
