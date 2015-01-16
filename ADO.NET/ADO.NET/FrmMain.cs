using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace ADO.NET
{
    public partial class FrmMain : Form
    {
        public FrmMain()
        {
            InitializeComponent();
        }

        private void FrmMain_Load(object sender, EventArgs e)
        {
            this.Text = "DataAdapter应用示例";
            comKeyType.Text = comKeyType.Items[0].ToString();
            string sql = "Select * From Grade";
            dataGridGrade.DataSource = Student.FillDataTable(sql);
            dataGridGrade.Columns[0].HeaderText = "学号";
            dataGridGrade.Columns[1].HeaderText = "姓名";
            dataGridGrade.Columns[2].HeaderText = "性别";
            dataGridGrade.Columns[3].HeaderText = "班级";
            dataGridGrade.Columns[4].HeaderText = "数学";
            dataGridGrade.Columns[5].HeaderText = "语文";
            dataGridGrade.Columns[6].HeaderText = "英语";
            dataGridGrade.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataGridGrade.MultiSelect = false;
            dataGridGrade.Columns[0].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            for (int i = 0; i < 7; i++)
            {
                if (i != 3)
                {
                    dataGridGrade.Columns[i].Width = 60;
                }
                else
                {
                    dataGridGrade.Columns[i].Width = 90;
                }
            }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            this.Hide();
            FrmAdd add = new FrmAdd();
            add.Show();
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            Student.StuNo = dataGridGrade.CurrentRow.Cells[0].Value.ToString();
            Student.StuName = dataGridGrade.CurrentRow.Cells[1].Value.ToString();
            Student.StuClass = dataGridGrade.CurrentRow.Cells[2].Value.ToString();
            Student.StuSex = dataGridGrade.CurrentRow.Cells[3].Value.ToString();
            Student.StuMath = int.Parse(dataGridGrade.CurrentRow.Cells[4].Value.ToString());
            Student.StuChs = int.Parse(dataGridGrade.CurrentRow.Cells[5].Value.ToString());
            Student.StuEn = int.Parse(dataGridGrade.CurrentRow.Cells[6].Value.ToString());
            this.Hide();
            FrmEdit edit = new FrmEdit();
            edit.Show();
        }

        private void btnQuery_Click(object sender, EventArgs e)
        {
            string sql = "";
            switch (comKeyType .Text )
            {
                case"学号":
                    sql="Select * From Grade Where StuNo Like'%"+txtKey .Text .Trim ()+"%'";
                    break;
                case"姓名":
                    sql="Select * From Grade Where StuName Like'%"+txtKey .Text .Trim ()+"%'";
                    break;
                case "班级":
                    sql="Select * From Grade Where StuClass Like'%"+txtKey .Text .Trim ()+"%'";
                    break;
            }
            dataGridGrade.DataSource = Student.FillDataTable(sql);
        }

        private void FrmMain_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }
    }
}
