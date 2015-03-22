using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace OSHGTP
{
    public partial class Admin_UserInfo : System.Web.UI.Page
    {
        DataAccess db = new DataAccess();
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["AName"] == null)
                {
                    Response.Redirect("AdminSignIn.aspx");
                    return;
                }
                dt = db.GetDataTable("select * from tb_UserInfo order by UId desc");
                GridView1.DataSource = dt.DefaultView;
                GridView1.DataBind();
            }
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int num = e.RowIndex;
            string uid = GridView1.Rows[num].Cells[0].Text.ToString();
            int result = db.ExecuteSQL("delete from tb_UserInfo where UId='" + uid + "'");
            dt = db.GetDataTable("select * from tb_UserInfo order by UId desc");
            GridView1.DataSource = dt.DefaultView;
            GridView1.DataBind();
            if (result == 1)
                Response.Write("<script language='javascript'>alert('删除成功!')</script>");
            else
                Response.Write("<script language='javascript'>alert('删除失败!')</script>");

        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            dt = db.GetDataTable("select * from tb_UserInfo order by UId desc");
            GridView1.DataSource = dt.DefaultView;
            GridView1.DataBind();
        }
    }
}