using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Common;
using System.Data;

namespace SmartBlog
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DbHelper db = new DbHelper();
            DbCommand cmd = db.GetSqlStringCommond("SELECT * FROM tb_Post");
            DataTable dt = db.ExecuteDataTable(cmd);
            this.Repeater1.DataSource = dt;
            this.Repeater1.DataBind();
        }

 
    }
}