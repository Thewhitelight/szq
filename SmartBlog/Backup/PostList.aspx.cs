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
    public partial class PostList : System.Web.UI.Page
    {
        protected  string outputStream = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            outputStream = "";
            /*
             * 注意DataSet对象
             * 注意SqlDataAdapter
             
             */
            DataSet ds = new DataSet();

            using (SqlConnection sqlconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connStr"].ConnectionString))
            {
                string sqlText = "SELECT * FROM tb_Post";
                SqlDataAdapter da = new SqlDataAdapter(sqlText, sqlconn);
                da.Fill(ds, "Post");
            }

            #region Response输出
            //Response.Write(" <table>");
            //Response.Write("  <tr><th>标题</th><th>作者</th><th>发表时间</th></tr>");
            //for (int i = 0; i < ds.Tables["Post"].Rows.Count; i++)
            //{
            //    Response.Write("<tr>");
            //    Response.Write(string.Format("<td>{0}</td><td>{1}</td><td>{2}</td>", ds.Tables["Post"].Rows[i]["PostTitle"].ToString(), ds.Tables["Post"].Rows[i]["Author"].ToString(), ds.Tables["Post"].Rows[i]["AddDateTime"].ToString()));
            //    Response.Write("</tr>");
            //}
            //Response.Write(" </table>"); 
            #endregion


            #region 指定位置输出
            outputStream = " <table>";
            outputStream += "  <tr><th>标题</th><th>作者</th><th>发表时间</th><th>编辑</th><th>删除</th></tr>";
            for (int i = 0; i < ds.Tables["Post"].Rows.Count; i++)
            {
                outputStream += "<tr>";
                outputStream += string.Format("<td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td><td>{4}</td>", "<a href=PostDetail.aspx?ID=" + ds.Tables["Post"].Rows[i]["BID"].ToString() + ">" + ds.Tables["Post"].Rows[i]["PostTitle"].ToString() + "</a>", 
                    ds.Tables["Post"].Rows[i]["Author"].ToString(), 
                    ds.Tables["Post"].Rows[i]["AddDateTime"].ToString(),
                   "<a href=EditPost.aspx?id=" + ds.Tables["Post"].Rows[i]["BID"].ToString() + ">编辑</a>",
                   "<a href=DelPost.aspx?id=" + ds.Tables["Post"].Rows[i]["BID"].ToString() + " onclick=\"return confirm('是否真的删除[" + ds.Tables["Post"].Rows[i]["PostTitle"].ToString() + "]') ;\">删除</a>"

                    );
                outputStream += "</tr>";
            }
            outputStream += " </table>"; 
            #endregion
        }
    }
}