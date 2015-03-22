using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace OSHGTP.Control
{
    public partial class Right : System.Web.UI.UserControl
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            DataAccess MarketBase = new DataAccess();
            SqlConnection conn = new SqlConnection(MarketBase.SqlBase);
            conn.Open();
            DataTable GetGoods = new DataTable();
            GetGoods = MarketBase.DisPlayList_Ds("select * from tb_Notice order by Ndate desc", conn);
            HotProDl.DataSource = GetGoods.DefaultView;
            HotProDl.DataBind();
        }
        public string Limit(string ValContent, string Flag)
        {
            string Result_Limit = null;

            string Result_Flag = Flag;



            if (ValContent.Length <= 20)
            {


                Result_Limit = ValContent;
                Result_Flag = Flag.Substring(0, 10);
                return Result_Limit + "  " + Result_Flag;

            }

            else
            {

                Result_Limit = ValContent.Substring(0, 20);
                Result_Flag = Flag.Substring(0, 10);
                return Result_Limit + ".." + "  " + Result_Flag;
            }
        }
    }
}