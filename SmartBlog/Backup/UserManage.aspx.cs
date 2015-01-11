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
    public partial class UserManage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DbHelper db = new DbHelper();
            DbCommand cmd = db.GetSqlStringCommond("SELECT * FROM tb_User WHERE isAlive='1'");
            DataSet ds = db.ExecuteDataSet(cmd);
            this.Repeater1.DataSource=ds.Tables[0];
            this.Repeater1.DataBind();
        }
    }
}