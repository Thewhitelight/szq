using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Common;

namespace SmartBlog
{
    public partial class ViewCount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string bid = Request.QueryString["BID"].ToString();
            if (StrIsInt(bid))
            {
                DbHelper db = new DbHelper();
                string sqlText = string.Format("UPDATE tb_Post SET ViewCount=COALESCE(ViewCount,0)+1 WHERE BID='{0}'", bid);

                //coalesce(字段,0)+1 coalesce函数，返回一个参数中非空的值。
                DbCommand cmd = db.GetSqlStringCommond(sqlText);
                db.ExecuteNonQuery(cmd);
            }
            //Response.Clear();
            //Response.Write(VCount(bid));
        }

        private int VCount(string bid)
        {
            int count = 0;
            DbHelper db = new DbHelper();
            DbCommand cmd = db.GetSqlStringCommond(string.Format("SELECT ViewCount FROM tb_Post WHERE BID='{0}'",bid));
            DbDataReader dr= db.ExecuteReader(cmd);
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    count = Convert.ToInt32(dr["ViewCount"]);
                }
            }
            return count;
        }

        #region 判断是否为数字
        static bool StrIsInt(string Str)
        {
            bool flag = true;
            if (Str != "")
            {
                for (int i = 0; i < Str.Length; i++)
                {
                    if (!Char.IsNumber(Str, i))
                    {
                        flag = false;
                        break;
                    }
                }
            }
            else
            {
                flag = false;
            }
            return flag;
        } 
        #endregion
    }
}