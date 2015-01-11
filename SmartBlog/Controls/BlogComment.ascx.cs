using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Common;
using System.Data;

namespace SmartBlog.Controls
{
    public partial class BlogComment : System.Web.UI.UserControl
    {
        string _bid="1";

        public string BlogID
        {
            get { return _bid; }
            set { _bid = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            DbHelper db = new DbHelper();
            DbCommand cmd = db.GetSqlStringCommond(string.Format("SELECT * FROM tb_Comment WHERE BID='{0}'", _bid));
            DataTable dt = db.ExecuteDataTable(cmd);
            this.Repeater1.DataSource = dt;
            this.Repeater1.DataBind();
        }
    }
}