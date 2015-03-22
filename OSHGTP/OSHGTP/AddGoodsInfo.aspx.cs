using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace OSHGTP
{
    public partial class AddGoodsInfo : System.Web.UI.Page
    {
        DataAccess MarketBase = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["UName"] == null)
            //{
            //    Response.Write("<script type='text/javascript'>alert('请先登录，再发布信息！');</script>");
            //}
            //SqlConnection conn = new SqlConnection(MarketBase.SqlBase);
            //conn.Open();
            //DataTable dt1 = new DataTable();
            //dt1 = MarketBase.DisPlayList_Ds("select * from tb_GoodType", conn);
            //firstKind.DataTextField = "GTypeName";
            //firstKind.DataValueField = "GTypeId";
            //firstKind.DataSource = dt1.DefaultView;
            //firstKind.DataBind();
        }

        protected void btSave_Click(object sender, EventArgs e)
        {

            string id = null;
            if (Session["UName"] == null)
                lbinforn.Text = "请先登录再发表新的信息";
            else
            {
                string uname = Session["UName"] as string;
                DataSet ds = new DataSet();
                using (SqlConnection sqlconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connStr"].ConnectionString))
                {
                    string sqlText = "select * from tb_UserInfo where UName='" + uname + "'";
                    SqlDataAdapter da = new SqlDataAdapter(sqlText, sqlconn);
                    da.Fill(ds, "Info");
                }


                for (int i = 0; i < ds.Tables["Info"].Rows.Count; i++)
                {
                    id += string.Format(ds.Tables["Info"].Rows[i]["UId"].ToString());

                }


                int state;
                string picpath;
                string markeddate = DateTime.Now.ToString("yyyy-MM-dd");
                string BDate = txtBDate.Value;
                string SDate = txtSDate.Value;
                string gName = txtGName.Value;
                string address = txtAddress.Value;
                string bsd = dropBuySell.Value;

                string CheckFlag;
                string Pic;
                SqlConnection conn = new SqlConnection(MarketBase.SqlBase);
                conn.Open();
                HttpPostedFile httpup = FileUp.PostedFile;
                if (httpup.ContentLength != 0)
                {
                    string PathFileName = httpup.FileName;
                    int i = PathFileName.LastIndexOf("\\");
                    string filename = PathFileName.Substring(i + 1);
                    httpup.SaveAs(Server.MapPath("Images/Pic/" + filename));
                    picpath = "Images/Pic/" + filename;
                    Pic = "1";
                    CheckFlag = "1";
                }
                else
                {
                    picpath = null;
                    Pic = "0";
                    CheckFlag = "0";
                }
                string test = "insert into tb_Goods(GName,GPic,GContent,GAddress,GBSD,GPPrice,GRPrice,GSDate,GBDate,GLevel,GTypeId,GPicPath,UId)"
                + "values('" + txtGName.Value + " ','" + Pic + "','" + txtContent.Value + "' ,'" + txtAddress.Value + " ','" + dropBuySell.Value + "',' " + txtPPrice.Value + "','" + txtRPrice.Value + "','" + txtSDate.Value + "','" + txtBDate.Value + "','" + txtLevel.Value + "','" + txtGTypeId.Value + "','" + picpath + "','" + id + "')";
                state = MarketBase.AddInfo(test, conn);
                if (state == 1)
                {
                    lbinforn.Text = "添加成功!";

                    txtGName.Value = "";
                    txtPPrice.Value = "";
                    txtRPrice.Value = "";
                    txtLevel.Value = "";
                    txtAddress.Value = "";
                    txtContent.Value = "";

                }
                else
                    lbinforn.Text = "操作失败!";

            }
        }
    }
}