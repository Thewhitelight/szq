using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace OSHGTP
{
    public partial class UserCenter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string name = Session["UName"].ToString();

            DataAccess MarketBase = new DataAccess();
            SqlConnection conn = new SqlConnection(MarketBase.SqlBase);
            conn.Open();

            DataTable MarketDt = new DataTable();
            MarketDt = MarketBase.DisPlayList_Ds("select * from tb_UserInfo where UName='" + name + "'", conn);
            MarketDetailDl.DataSource = MarketDt.DefaultView;
            MarketDetailDl.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataAccess MarketBase = new DataAccess();
            SqlConnection conn = new SqlConnection(MarketBase.SqlBase);
            if (TextBox1.Text == "")
            {
                Response.Write("<script language='javascript'>alert('请填写完整信息再发布')</script>");

            }
            else
            {
                conn.Open();

                string connString = "update tb_UserInfo set UPhone='"+TextBox1.Text+"' where UName='"+Session["UName"].ToString()+"'";
                MarketBase.AddInfo(connString, conn);
                conn.Close();
                Response.Redirect("UserCenter.aspx");
            }
        }
    }
}