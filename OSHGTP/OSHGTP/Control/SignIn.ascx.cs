using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;
using System.Data;
namespace OSHGTP.Control
{
    public partial class SignIn : System.Web.UI.UserControl
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session == null || Session["UName"] == null)
            {
                UserInfo.Text = "";
                UserInfo.Text = "欢迎您,请登录!";
                WelPanel.Visible = true;
                UserDetails.Visible = false;
            }
            else
            {
                UserInfo.Text = "";
                UserInfo.Text = "欢迎您!" + Session["UName"];
                WelPanel.Visible = false;
                UserDetails.Visible = true;
            }
        }
        protected void LoginButton_Click(object sender, ImageClickEventArgs e)
        {
            DataAccess MarketBase = new DataAccess();
            SqlConnection conn = new SqlConnection(MarketBase.SqlBase);
            if (txtUserName.Text == "" || txtPassword.Text == "")
            {
                Response.Write("<script language='javascript'>alert('请填写完整信息再点击登录')</script>");
                Response.Redirect("default.aspx");
            }
            else
            {
                try
                {
                    conn.Open();
                    DataTable GetUserInfoDt = new DataTable();
                    GetUserInfoDt = MarketBase.DisPlayList_Ds("select * from tb_UserInfo where UName='" + txtUserName.Text + "'and UPwd='" + FormsAuthentication.HashPasswordForStoringInConfigFile(txtPassword.Text, "MD5") + "'", conn);
                    int CheckNum = GetUserInfoDt.Rows.Count;
                    if (CheckNum == 1)
                    {
                        Response.Write("<script language='javascript'>alert('登录成功!')</script>");
                        Session["UName"] = GetUserInfoDt.Rows[0]["UName"].ToString();
                        Session["UId"] = GetUserInfoDt.Rows[0]["UId"].ToString();
                        Response.Redirect("default.aspx");
                    }
                    else
                    {
                        Response.Write("<script language='javascript'>alert('登录失败!请与数据管理员联系!')</script>");
                        Response.Redirect("default.aspx");
                    }
                }
                catch (SqlException err)
                {
                    Response.Write("<script language='javascript'>alert('" + err.Message + "')</script>");
                }
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserGoodsDetail.aspx");
        }
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserChangePwd.aspx");
        }
        protected void RegInfoButton_Click(object sender, ImageClickEventArgs e)
        {
            txtPassword.Text = "";
            txtUserName.Text = "";
            Response.Redirect("SignUp.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["UName"] = null;
            Session["UId"] = null;
            WelPanel.Visible = true;
            UserDetails.Visible = false;
            UserInfo.Text = "欢迎您,请登录!";
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserCenter.aspx");
        }
    }
}