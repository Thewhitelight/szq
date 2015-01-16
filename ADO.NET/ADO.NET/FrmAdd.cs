using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace ADO.NET
{
    public partial class FrmAdd : Form
    {
        public FrmAdd()
        {
            InitializeComponent();
        }

        private void FrmAdd_Load(object sender, EventArgs e)
        {
            this.Text = "添加记录";
            this.Show();
            txtNo.Focus();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            Student.StuName = txtNo.Text;
            if (!Student .CheckUser ())
            {
                MessageBox.Show("学号已经存在，请重新填写！");
                return;
            }
            if (radio1 .Checked )
            {
                Student.StuSex = "男";
            }
            else
            {
                Student.StuSex = "女";
            }
            Student.StuNo = txtNo.Text.Trim();
            Student.StuName = txtName.Text.Trim();
            Student.StuClass = txtClass.Text.Trim();
            Student.StuMath = int.Parse(txtMath.Text.Trim());
            Student.StuChs = int.Parse(txtChs.Text.Trim());
            Student.StuEn = int.Parse(txtEn.Text.Trim());
            string Msg = Student.Add();
            MessageBox.Show(Msg, "系统提示", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void btnBack_Click(object sender, EventArgs e)
        {
            this.Close();
            FrmMain main = new FrmMain();
            main.Show();
        }
    }
}
