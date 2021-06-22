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
    public partial class PhongDaoTao : Form
    {
        public string MaNV;
        public string HoTen;

        public PhongDaoTao()
        {
            InitializeComponent();
        }

        private void PhongDaoTao_Load(object sender, EventArgs e)
        {
            label2.Text = HoTen;
        }
    }
}
