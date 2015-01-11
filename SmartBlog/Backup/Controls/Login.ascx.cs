using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;

namespace SmartBlog.Controls
{
    public partial class Login : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
                        string validCode = Session["CheckCode"].ToString();

            if (txtValidCode.Text != validCode)
            {
                Response.Write("<script type='text/javascript'>alert('验证码输入错误');</script>");
                return;
            }


            string userName = txtUserName.Text;
            string password = txtPassword.Text;

            SqlConnection sqlconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connStr"].ConnectionString);

            sqlconn.Open();
            // FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5")
            //string sqlText = string.Format("INSERT INTO tb_User(UserName,Password,Email)VALUES('{0}','{1}','{2}')", userName, FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5"), email);
            string sqlText = string.Format("SELECT * FROM tb_User WHERE UserName='{0}' AND Password='{1}'", userName, FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5"));
            SqlCommand sqlcmd = new SqlCommand(sqlText, sqlconn);
            object result = sqlcmd.ExecuteScalar();
            if (result !=null)
            {
                Session["UserInfo"] = userName;
                //Response.Write("<script type='text/javascript'>alert('登录成功！');</script>");
                Response.Redirect("Default.aspx");
            }
            else
            {
                //ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('请正确用户名与密码！');</script>");
                Response.Write("<script>alert('请正确用户名与密码！');</script>");
            }
            sqlconn.Close();
            
        
        }
    }
}