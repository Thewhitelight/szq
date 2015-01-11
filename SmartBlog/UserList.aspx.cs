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
    public partial class UserList : System.Web.UI.Page
    {
        public string outputStream = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            outputStream = "";
            DataSet ds = new DataSet();

            using (SqlConnection sqlconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connStr"].ConnectionString))
            {
                string sqlText = "SELECT * FROM tb_User WHERE isAlive='1'";
                SqlDataAdapter da = new SqlDataAdapter(sqlText, sqlconn);
                da.Fill(ds, "user");
            }

            #region 指定位置输出
            outputStream = " <br><table>";
            outputStream += "  <tr><th>用户名</th><th>邮箱</th><th>注册时间</th><th>删除</th></tr>";
            for (int i = 0; i < ds.Tables["user"].Rows.Count; i++)
            {
                outputStream += "<tr>";
                outputStream += string.Format("<td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td>", ds.Tables["user"].Rows[i]["UserName"].ToString(), ds.Tables["user"].Rows[i]["Email"].ToString(),
                    ds.Tables["user"].Rows[i]["AddDateTime"].ToString(),
                    "<a href=DelUser.aspx?id=" + ds.Tables["user"].Rows[i]["UID"].ToString() + " onclick=\"return confirm('是否真的删除[" + ds.Tables["user"].Rows[i]["UserName"].ToString() + "]') ;\">删除</a>"
                    );
                outputStream += "</tr>";
            }
            outputStream += " </table>";
            #endregion
        }
    }
}