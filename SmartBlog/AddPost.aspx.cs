using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Common;

namespace SmartBlog
{
    public partial class AddPost : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /*
         用户在页面上提交表单到服务器时，服务器会检测到一些潜在的输入风险，例如使用富文本编辑器控件（RichTextBox、FreeTextBox、CuteEditor等）编辑的内容中包含有HTML标记或脚本标记，ASP.NET页面会抛出一个"A potentially dangerous Request.Form value was deceted from the client"的异常。这个是ASP.NET页面为了防范页面注入功能的一种保护机制，要取消这种保护，常规的做法是在.aspx文件的<%@Page %>部分加入ValidateRequest="false"属性。但是从.NET 4.0开始你可能需要多修改一个地方，在网站的web.config文件中加入这行配置：
        <system.web>
            <compilation debug="true" targetFramework="4.0"/>
            <httpRuntime requestValidationMode="2.0"/>
        </system.web>
         */

        protected void btnPost_Click(object sender, EventArgs e)
        {
            string title = this.txtTitle.Text;
            string content = this.txtContent.Text;
            //string[] tags = this.txtTag.Text.Split(',');

            string tag = this.txtTag.Text;


            //SqlConnection sqlconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connStr"].ConnectionString);

            //sqlconn.Open();
            // FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5")
            string sqlText = string.Format("INSERT INTO tb_Post(PostTitle,Author,BContent,Tag)VALUES('{0}','{1}','{2}','{3}')", title, Session["UserInfo"].ToString(), content, tag);
            //SqlCommand sqlcmd = new SqlCommand(sqlText, sqlconn);

            DbHelper db = new DbHelper();
            DbCommand cmd = db.GetSqlStringCommond(sqlText);
            int result = db.ExecuteNonQuery(cmd);
            if (result > 0)
            {
                Response.Write("<script type='text/javascript'>alert('修改成功！');</script>");
            }
            //sqlconn.Close();

            Response.Redirect("PostList.aspx");
        }
    }
}