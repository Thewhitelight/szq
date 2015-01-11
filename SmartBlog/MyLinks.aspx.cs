using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace SmartBlog
{
    public partial class MyLinks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string linkName=TextBox2.Text;
            string linkUrl = TextBox3.Text;
            using (SqlConnection sqlconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connStr"].ConnectionString))
            {
                sqlconn.Open();
                string sqlText = string.Format("INSERT INTO tb_Links(LinksName,LinksUrl)VALUES('{0}','{1}')",linkName,linkUrl);
                SqlCommand sqlcom = new SqlCommand(sqlText, sqlconn);
                sqlcom.ExecuteNonQuery();
            }
            Response.Redirect("Default.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string linkName = TextBox2.Text;
            string linkUrl = TextBox3.Text;
            using (SqlConnection sqlconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connStr"].ConnectionString))
            {
                sqlconn.Open();
                string sqlText = string.Format("update tb_Links set LinksUrl='{0}' where LinksName='{1}'", linkUrl, linkName);
                SqlCommand sqlcom = new SqlCommand(sqlText, sqlconn);
                sqlcom.ExecuteNonQuery();
            }
            Response.Redirect("Default.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string blogName = TextBox1.Text;
            using (SqlConnection sqlconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connStr"].ConnectionString))
            {
                sqlconn.Open();
                string sqlText = string.Format("update tb_BlogName set BlogName='{0}'", blogName);
                SqlCommand sqlcom = new SqlCommand(sqlText, sqlconn);
                sqlcom.ExecuteNonQuery();
            }
            Response.Redirect("Default.aspx");
        }
    }
}