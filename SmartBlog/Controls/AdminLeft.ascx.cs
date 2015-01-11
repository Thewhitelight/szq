using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace SmartBlog.Controls
{
    public partial class AdminLeft : System.Web.UI.UserControl
    {
        public string outputStream = "";
        public string outputTime = "";
        public string outputLinks = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();

            #region 指定位置输出博文标题
            using (SqlConnection sqlconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connStr"].ConnectionString))
            {
                string sqlText = "SELECT BID,PostTitle FROM tb_Post";
                SqlDataAdapter da = new SqlDataAdapter(sqlText, sqlconn);
                da.Fill(ds, "Post");
            }
           
            outputStream = " <table>";
            //outputStream += "  <tr><th>标题</th><th>作者</th><th>发表时间</th><th>编辑</th><th>删除</th></tr>";
            for (int i = 0; i < ds.Tables["Post"].Rows.Count; i++)
            {
                outputStream += "<tr>";
                outputStream += string.Format("<td>{0}</td>", "<a href=PostDetail.aspx?ID=" + ds.Tables["Post"].Rows[i]["BID"].ToString() + ">" + ds.Tables["Post"].Rows[i]["PostTitle"].ToString() + "</a><hr>");
                outputStream += "</tr>";
            }
            outputStream += " </table>";
            #endregion

            #region 指定位置输出博文时间
            using (SqlConnection sqlconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connStr"].ConnectionString))
            {
                string sqlText = "SELECT AddDateTime,BID FROM tb_Post";
                SqlDataAdapter da = new SqlDataAdapter(sqlText, sqlconn);
                da.Fill(ds, "PostTime");
            }
            outputTime = " <table>";
            for (int i = 0; i < ds.Tables["PostTime"].Rows.Count; i++)
            {
                outputTime += "<tr>";
                outputTime += string.Format("<td>{0}</td>", "<a href=PostDetail.aspx?id=" + ds.Tables["PostTime"].Rows[i]["BID"].ToString() + ">" + ds.Tables["PostTime"].Rows[i]["AddDateTime"].ToString() + "</a><hr>");
                outputTime += "</tr>";
            }
            outputTime += " </table>";
            #endregion

            #region 指定位置输出友情链接
            using (SqlConnection sqlconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connStr"].ConnectionString))
            {
                string sqlText = "SELECT * FROM tb_Links";
                SqlDataAdapter da = new SqlDataAdapter(sqlText, sqlconn);
                da.Fill(ds, "Links");
            }
            
            outputLinks = " <table>";
            for (int i = 0; i < ds.Tables["Links"].Rows.Count; i++)
            {
                outputLinks += "<tr>";
                outputLinks += string.Format("<td>{0}</td>", "<a href=" + ds.Tables["Links"].Rows[i]["LinksUrl"].ToString() + ">" + ds.Tables["Links"].Rows[i]["LinksName"].ToString() + "</a><hr>");
                outputLinks += "</tr>";
            }
            outputLinks += " </table>";
            #endregion
        }

    }
}