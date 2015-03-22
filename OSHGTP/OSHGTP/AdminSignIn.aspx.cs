using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace OSHGTP
{
    public partial class AdminSignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            string userName = txtUserName.Text;
            string passWord = txtPassWord.Text;
            SqlConnection sqlcon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connStr"].ConnectionString);
            sqlcon.Open();


            string sqlText = string.Format("SELECT * FROM tb_Admin WHERE AName='{0}' AND APwd='{1}'", userName,passWord);
            SqlCommand sqlcmd = new SqlCommand(sqlText, sqlcon);
            object result = sqlcmd.ExecuteScalar();
            if (result != null)
            {
                Session["AName"] = userName;
                //Response.Write("<script type='text/javascript'>alert('登录成功！');</script>");
                 Response.Redirect("Admin_Default.aspx");
                 return;
            }
            else
            {
                //ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('请正确用户名与密码！');</script>");
                Response.Write("<script>alert('请正确用户名与密码！');</script>");
            }
            sqlcon.Close();
        }
    }
}