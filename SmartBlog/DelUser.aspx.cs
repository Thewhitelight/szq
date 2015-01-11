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
    public partial class DelUser : System.Web.UI.Page
    {
        string id = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                id = Request.QueryString["ID"].ToString();
                DelData();
                Response.Redirect("UserList.aspx");
            }
        }

        private void DelData()
        {
            SqlConnection sqlconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connStr"].ConnectionString);

            sqlconn.Open();

            string sqlText = string.Format("DELETE FROM tb_User WHERE UID='{0}'", id);
            SqlCommand sqlcmd = new SqlCommand(sqlText, sqlconn);
            int result = sqlcmd.ExecuteNonQuery();
            if (result > 0)
            {
                Response.Write("<script type='text/javascript'>alert('删除成功！');</script>");
            }
            sqlconn.Close();
        }
    }
}