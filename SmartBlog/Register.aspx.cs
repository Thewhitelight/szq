using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;

namespace SmartBlog
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.txtUserName.Attributes.Add("onblur", "showHint(this.value)");
            this.txtConfirm.Attributes.Add("onblur", "ConfirmPassword()");
            this.Image1.Attributes.Add("onclick", "ChangeValidCode()");
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string validCode = Session["CheckCode"].ToString();

            if (txtValidCode.Text != validCode)
            {
                Response.Write("<script type='text/javascript'>alert('验证码输入错误');</script>");
                return;
            }

            string userName = txtUserName.Text;
            string password = txtPassword.Text;
            string email = txtEmail.Text;

            SqlConnection sqlconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connStr"].ConnectionString);

            sqlconn.Open();
            // FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5")
            string sqlText = string.Format("INSERT INTO tb_User(UserName,Password,Email)VALUES('{0}','{1}','{2}')", userName, FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5"), email);
            SqlCommand sqlcmd = new SqlCommand(sqlText, sqlconn);
            int result= sqlcmd.ExecuteNonQuery();
            if (result>0)
            {
                 Response.Write("<script type='text/javascript'>alert('注册成功！');</script>");
            }
            sqlconn.Close();
            Response.Redirect("Default.aspx");
        }
    }
}