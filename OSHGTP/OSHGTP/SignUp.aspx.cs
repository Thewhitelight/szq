using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;
namespace OSHGTP
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataAccess MarketBase = new DataAccess();
            int State;
            string time;
            if (txtName.Value == "" || txtPassword.Value == "")
            {
                //Response.Write("<script language='javascript'>alert('')</script>");
                lbInfo.Text = "请你务必填写必要的项!";
            }
            if (txtPassword.Value != txtConfirmPassword.Value)
                lbInfo.Text = "两次密码不一致,请核实!";
            SqlConnection conn = new SqlConnection(MarketBase.SqlBase);
            try
            {
                conn.Open();
                if (MarketBase.DisPlayList_Ds("select * from tb_UserInfo where UName='" + txtName.Value + "'", conn).Rows.Count != 0)
                    lbInfo.Text = "你注册的用户名已经被别人注册,请改其它的名字注册";
                else if (MarketBase.DisPlayList_Ds("select * from tb_UserInfo where UEmail='" + txtEMail.Value + "'", conn).Rows.Count != 0)
                    lbInfo.Text = "你注册的EMail已经被别人注册,请改其它的EMail注册";
                else
                {
                    conn.Open();

                    string connString = "insert into tb_UserInfo(UName,UPwd,UEmail,UPhone)values('" + txtName.Value + "','" + FormsAuthentication.HashPasswordForStoringInConfigFile(txtPassword.Value, "MD5") + "','" + txtEMail.Value + "','" + txtPhone.Value + "')";
                    State = MarketBase.AddInfo(connString, conn);
                    if (State == 1)
                    {
                        // Response.Write("<script language='javascript'>alert('操作成功!')</script>");
                        // Response.Redirect("regsucess.aspx");
                        lbInfo.Text = "操作成功!";
                    }
                    else
                        lbInfo.Text = "操作失败!请与数据管理员联系!";
                }
            }
            catch (SqlException err)
            {
                lbInfo.Text = err.Message.ToString();
            }
        }
    }
}