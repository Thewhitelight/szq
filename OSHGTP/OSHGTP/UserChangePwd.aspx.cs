using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;
namespace OSHGTP
{
    public partial class UserChangePwd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string pwd = FormsAuthentication.HashPasswordForStoringInConfigFile(TextBox1.Text, "MD5");
            string pwd1 = TextBox2.Text;
            string pwd2 = TextBox3.Text;
            if (pwd1 != pwd2)
            {
                Response.Write("<script language='javascript'>alert('请输入相同的新密码！')</script>");
            }
            else
            {
                pwd1 = FormsAuthentication.HashPasswordForStoringInConfigFile(pwd1, "MD5");
                using (SqlConnection sqlconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connStr"].ConnectionString))
                {
                    sqlconn.Open();
                    string sqlText = "update tb_UserInfo set UPwd='" + pwd1 + "' where UPwd='" + pwd + "'";
                    SqlCommand sqlcom = new SqlCommand(sqlText, sqlconn);
                    sqlcom.ExecuteNonQuery();
                    sqlconn.Close();
                }
                Response.Redirect("Default.aspx");
            }
        }
    }
}