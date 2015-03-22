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
    public partial class GoodsDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request["GId"];

            DataAccess MarketBase = new DataAccess();
            SqlConnection conn = new SqlConnection(MarketBase.SqlBase);
            conn.Open();
            //if (!IsPostBack)
            //{
            //    int state = MarketBase.ModInfo("update goods set downcount=downcount+1 where goodsid='" + id + "'", conn);
            //}
            DataTable MarketDt = new DataTable();
            MarketDt = MarketBase.DisPlayList_Ds("select * from tb_Goods,tb_UserInfo,tb_GoodType where tb_Goods.UId=tb_UserInfo.UId and tb_Goods.GTypeId=tb_GoodType.GTypeId and tb_Goods.GId='" + id + "'", conn);
            MarketDetailDl.DataSource = MarketDt.DefaultView;
            MarketDetailDl.DataBind();

        }
        public string Checked(string path)
        {
            string Result;
            if (path == null || path == "")
                Result = "images/pic/yunnan.gif";
            else
                Result = path;
            // Result = "upload/" + path;
            return Result;
        }
    }
}