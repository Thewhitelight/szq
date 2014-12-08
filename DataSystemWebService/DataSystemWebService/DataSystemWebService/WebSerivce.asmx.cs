using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Services;

namespace DataSystemWebService
{
    /// <summary>
    /// Service1 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    public class Service1 : System.Web.Services.WebService
    {
        DBUtils dbUtils = new DBUtils();
        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod(Description = "查询所有信息")]
        public string[] selectAllInfo()
        {
            return dbUtils.selectAllInfo().ToArray();
        }
        [WebMethod(Description = "插入信息")]
        public bool insertInfo(string inst_id, string inst_name, string inst_type, string user_name, string buy_date)
        {
            return dbUtils.insertInfo(inst_id, inst_name, inst_type, user_name, buy_date);
        }
        [WebMethod(Description = "删除信息")]
        public bool deleteInfo(string inst_id)
        {
            return dbUtils.deleteInfo(inst_id);
        }
        [WebMethod(Description = "更新信息")]
        public bool updataInfo(string inst_id, string inst_name, string inst_type, string user_name, string buy_date)
        {
            return dbUtils.updataInfo(inst_id, inst_name, inst_type, user_name, buy_date);
        }
        [WebMethod(Description = "查询信息")]
        public string[] selectInfo(string inst_id)
        {
            return dbUtils.selectInfo(inst_id).ToArray();
        }
    }
}