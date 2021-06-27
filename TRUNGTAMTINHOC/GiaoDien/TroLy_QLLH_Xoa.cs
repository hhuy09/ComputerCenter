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
    public partial class TroLy_QLLH_Xoa : Form
    {
        public string MaLopHoc;
        public TroLy_QLLH_Xoa()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            NghiepVu.LichHoc.XoaLichHoc(MaLopHoc);
            this.Close();
        }

        private void TroLy_QLLH_Xoa_Load(object sender, EventArgs e)
        {
            label3.Text = MaLopHoc; 
        }
    }
}
