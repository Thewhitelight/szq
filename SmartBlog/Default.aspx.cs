using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Common;
using System.Data;
using System.Data.SqlClient;

namespace SmartBlog
{
    public partial class Default : System.Web.UI.Page
    {
        public string name = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserInfo"] != null)
            {
                Login1.Visible = false;
                this.UserMessage.Visible = false;
                this.AdminMessage.Visible = true;
            }
            DbHelper db = new DbHelper();
            DbCommand cmd = db.GetSqlStringCommond("SELECT * FROM tb_Post");
            DataTable dt = db.ExecuteDataTable(cmd);
            this.Repeater1.DataSource = dt;
            this.Repeater1.DataBind();

            DataSet ds = new DataSet();
            using (SqlConnection sqlconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connStr"].ConnectionString))
            {
                string sqlText = "select * from tb_BlogName";
                SqlDataAdapter da = new SqlDataAdapter(sqlText, sqlconn);
                da.Fill(ds, "Post1");
            }
            #region 指定位置输出博客名称
            for (int i = 0; i < ds.Tables["Post1"].Rows.Count; i++)
            {
                name += string.Format(ds.Tables["Post1"].Rows[i]["BlogName"].ToString());
            }
            #endregion
        }
    }
}