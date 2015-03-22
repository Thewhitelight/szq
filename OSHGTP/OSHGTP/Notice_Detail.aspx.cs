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
    public partial class Notice_Detail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request["NId"];

            DataAccess MarketBase = new DataAccess();
            SqlConnection conn = new SqlConnection(MarketBase.SqlBase);
            conn.Open();

            DataTable MarketDt = new DataTable();
            MarketDt = MarketBase.DisPlayList_Ds("select * from tb_Notice where NId='"+id+"'", conn);
            MarketDetailDl.DataSource = MarketDt.DefaultView;
            MarketDetailDl.DataBind();



        }
    }
}