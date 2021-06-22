using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TRUNGTAMTINHOC
{
    public partial class PhongTaiVu : Form
    {
        public string MaNV;
        public string HoTen;

        public PhongTaiVu()
        {
            InitializeComponent();
        }

        private void PhongTaiVu_Load(object sender, EventArgs e)
        {
            label2.Text = HoTen;
        }
    }
}
