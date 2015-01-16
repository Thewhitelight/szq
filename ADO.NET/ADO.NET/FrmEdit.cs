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
    public partial class FrmEdit : Form
    {
        public FrmEdit()
        {
            InitializeComponent();
        }

        private void FrmEdit_Load(object sender, EventArgs e)
        {
            this.Text = "修改和删除记录";
            string sql = "Select * From Grade";
            DataTable dt = Student.FillDataTable(sql);
            comNo.DataSource = dt;
            comNo.DisplayMember = dt.Columns[0].ToString();
            comNo.Text = Student.StuNo;
            txtName.DataBindings.Add("Text", dt, "StuName");
            txtSex.DataBindings.Add("Text", dt, "StuSex");
            txtClass.DataBindings.Add("Text", dt, "StuClass");
            txtMath.DataBindings.Add("Text", dt, "Math");
            txtChs.DataBindings.Add("Text", dt, "Chs");
            txtEn.DataBindings.Add("Text", dt, "En");
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            Student.StuNo = comNo.Text;
            Student.StuName = txtName.Text;
            Student.StuSex = txtSex.Text;
            Student.StuClass = txtClass.Text;
            Student.StuMath = int.Parse(txtMath.Text);
            Student.StuChs = int.Parse(txtChs.Text);
            Student.StuEn = int.Parse(txtEn.Text);
            string Msg = Student.Update();
            MessageBox.Show(Msg, "系统提示", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void btnDel_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("学号为：" + comNo.Text + "的记录将被删除", "提示", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
            if (result ==DialogResult .OK )
            {
                Student.StuNo = comNo.Text;
                string Msg = Student.Del();
                MessageBox.Show(Msg, "系统提示", MessageBoxButtons.OK, MessageBoxIcon.Information);
                this.Close();
                FrmMain main = new FrmMain();
                main.Show();
            }
        }

        private void btnBack_Click(object sender, EventArgs e)
        {
            this.Close();
            FrmMain main = new FrmMain();
            main.Show();
        }
    }
}
