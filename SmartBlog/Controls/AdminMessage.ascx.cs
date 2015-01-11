using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace SmartBlog.Controls
{
    public partial class AdminMessage : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyLinks.aspx");
        }
    }
}