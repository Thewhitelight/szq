using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
 

namespace SmartBlog
{
    public partial class EditPost : System.Web.UI.Page
    {
        string id = "";
        string title = "";
        string content = "";
        string tag = "";
 
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                id = Request.QueryString["id"].ToString();
                ShowInfo();
                this.HiddenField1.Value = id;
            }
            

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
                    }
                }
                this.txtTitle.Text = title;
                this.txtContent.Text = Server.HtmlDecode(content);
                this.txtTag.Text = tag;
            }
        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
            //string title = this.txtTitle.Text;
            //string content = this.txtContent.Text;
            //string tag = this.txtTag.Text;


            UpdateData();
        }

        private void UpdateData()
        {
            SqlConnection sqlconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connStr"].ConnectionString);

            sqlconn.Open();
            // FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5")
            //string sqlText = string.Format("INSERT INTO tb_Post(PostTitle,Author,BContent,Tag)VALUES('{0}','{1}','{2}','{3}')", title, Session["UserInfo"].ToString(), content, tag);

            string sqlText = string.Format("UPDATE tb_Post SET PostTitle='{0}' , BContent='{1}' , Tag='{2}' , LastEditTime=GETDATE() WHERE BID='{3}'", 
                txtTitle.Text,
                //txtContent.Text,
                Server.HtmlEncode(txtContent.Text),
           
                txtTag.Text,
                this.HiddenField1.Value
                );
            SqlCommand sqlcmd = new SqlCommand(sqlText, sqlconn);
            int result = sqlcmd.ExecuteNonQuery();
            if (result > 0)
            {
                Response.Write("<script type='text/javascript'>alert('修改成功！');</script>");
            }
            sqlconn.Close();
        }
    }
}