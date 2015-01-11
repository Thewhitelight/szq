using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace SmartBlog
{
    public partial class ValidUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string userName = Request.QueryString["user"].ToString().Trim ();

            using (SqlConnection sqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["connStr"].ConnectionString))
            {
                sqlconn.Open();
                string sqlText = string.Format("SELECT * FROM tb_User WHERE UserName='{0}'",userName);
                SqlCommand sqlcmd = new SqlCommand(sqlText,sqlconn);
                if (sqlcmd.ExecuteScalar() == null)
                {
                    Response.Write("<span style='color: #00FF00;font-size:20px'>恭喜！该账号可以使用！</span>");
                }
                else
                {
                    Response.Write("<span style='color: #FF0000;font-size:20px'>对不起！该账号已注册！</span>");
                }
            }
        }
    }
}