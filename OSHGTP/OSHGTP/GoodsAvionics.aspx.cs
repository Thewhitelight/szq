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
    public partial class GoodsAvionics : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataAccess MarketBase = new DataAccess();
            SqlConnection conn = new SqlConnection(MarketBase.SqlBase);
            conn.Open();
            DataTable GetGoods = new DataTable();
            GetGoods = MarketBase.DisPlayList_Ds("select GName,GId,GBSD from tb_Goods where GTypeId='4' order by GSDate desc", conn);
            HotProDl.DataSource = GetGoods.DefaultView;
            HotProDl.DataBind();
        }

        public string Limit(string ValContent, string Flag)
        {
            string Result_Limit = null;

            string Result_Flag = null;

            if (Flag == "求")
            {

                Result_Flag = "<font color=red>【求】</font>";
            }
            if (Flag == "供")
            {

                Result_Flag = "<font color=#FF00CC>【供】</font>";
            }
            if (Flag == "捐")
            {
                Result_Flag = "<font color=##006400>【捐】</font>";
            }

            if (ValContent.Length <= 7)
            {


                Result_Limit = ValContent;

                return Result_Flag + Result_Limit;

            }

            else
            {

                Result_Limit = ValContent.Substring(0, 7);

                return Result_Flag + Result_Limit + "..";
            }
        }
    }
}