using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.Common;

namespace SmartBlog
{
    public partial class PostDetail : System.Web.UI.Page
    {
        protected string title="";
        protected string content="";
        protected string tag="";
        protected string id = "";
        protected string author = "";
        protected string datetime="";

        //浏览次数
        protected int vCount = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!this.IsPostBack)
            //{
                id = Request.QueryString["ID"].ToString();
                
            //}
            ShowInfo();
            this.BlogComment1.BlogID = id;
        }


        private void ShowInfo()
        {
            using (SqlConnection sqlconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connStr"].ConnectionString))
            {
                sqlconn.Open();
                string sqlText = string.Format("SELECT * FROM tb_Post WHERE BID='{0}'", id);
                SqlCommand sqlcmd = new SqlCommand(sqlText, sqlconn);
                SqlDataReader dr = sqlcmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        title = dr["PostTitle"].ToString();
                        content = dr["BContent"].ToString();
                        tag = dr["Tag"].ToString();
                        author = dr["Author"].ToString();
                        datetime = dr["AddDateTime"].ToString();
                        vCount = Convert.ToInt32(dr["ViewCount"]);
                    }
                }
                //this.txtTitle.Text = title;
                //this.txtContent.Text = Server.HtmlDecode(content);
                //this.txtTag.Text = tag;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            if (Page.IsPostBack)
            {
            DbHelper db = new DbHelper();
            DbCommand cmd = db.GetSqlStringCommond(string.Format("INSERT INTO tb_Comment(BID,CContent,IPAdrr,UserID,Layer)VALUES('{0}','{1}','{2}','{3}','{4}')", 
                id,
                this.txtContent.Text,
                //获取用户ip地址
                Request.ServerVariables["REMOTE_ADDR"],
                Session["UserInfo"] == null ? "匿名" : Session["UserInfo"].ToString (),
                GetLayers(Request.QueryString["ID"].ToString()) + 1
                ));
          int r=  db.ExecuteNonQuery(cmd);
          if (r>0)
          {
              Response.Write("<script type='text/javascript'>alert('谢谢评论！^_^');</script>");
          }
            }
        }

        /// <summary>
        /// 获取最高楼层
        /// </summary>
        /// <param name="bid">博客ID</param>
        /// <returns>层数</returns>
        private int GetLayers(string bid)
        {
            int layer = 0;
            DbHelper db = new DbHelper();
            DbCommand cmd = db.GetSqlStringCommond(string.Format("SELECT MAX(Layer) AS LCount FROM tb_Comment WHERE BID='{0}'", bid));
            DbDataReader dr = db.ExecuteReader(cmd);
            if (dr.HasRows)
            {
                while (dr.Read() && !dr["LCount"].Equals(System.DBNull.Value))
                {
                    layer = Convert.ToInt32(dr["LCount"]);
                }
            }
            return layer;
        }
    }
}