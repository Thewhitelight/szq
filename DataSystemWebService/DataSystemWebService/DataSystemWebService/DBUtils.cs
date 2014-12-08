using System;
using System.Collections.Generic;
using System.Web;
using System.Data.SqlClient;

namespace DataSystemWebService
{
    public class DBUtils
    {
        public static SqlConnection sqlcon;
        public string sqlstr = @"Server=10.64.130.88;DataBase=Facility;User Id=sa;Password=sqlserver2008??;";
        public DBUtils()
        {
            if (sqlcon == null)
            {
                sqlcon = new SqlConnection();
                sqlcon.ConnectionString = sqlstr;
                sqlcon.Open();
            }
        }
        /// <summary>
        /// 关闭sql连接
        /// </summary>
        public void Dispose()
        {
            if (sqlcon != null)
            {
                sqlcon.Close();
                sqlcon = null;
            }
        }
        /// <summary>
        /// 显示全部信息
        /// </summary>
        /// <returns></returns>
        public List<string> selectAllInfo()
        {
            List<string> list = new List<string>();
            try
            {
                string selectallsql = "select * from tb_instrument";
                SqlCommand sqlcom = new SqlCommand(selectallsql, sqlcon);
                SqlDataReader sqlread = sqlcom.ExecuteReader();
                while (sqlread.Read())
                {
                    list.Add(sqlread[0].ToString());
                    list.Add(sqlread[1].ToString());
                    list.Add(sqlread[2].ToString());
                    list.Add(sqlread[3].ToString());
                    list.Add(sqlread[4].ToString());
                    list.Add(sqlread[5].ToString());
                }
                sqlread.Close();
                sqlcom.Dispose();
            }
            catch
            {
                throw new Exception();
            }
            return list;
        }
        /// <summary>
        /// 插入信息
        /// </summary>
        /// <param name="inst_name"></param>
        /// <param name="inst_id"></param>
        /// <param name="inst_type"></param>
        /// <param name="user_name"></param>
        /// <param name="buy_date"></param>
        /// <returns></returns>
        public bool insertInfo(string inst_id, string inst_name, string inst_type, string user_name, string buy_date)
        {
            try
            {
                string insertsql = "insert into tb_instrument(inst_id,inst_name,inst_type,user_name,buy_date) values('" + inst_id + "','" + inst_name + "','" + inst_type + "','" + user_name + "','" + buy_date + "')";
                SqlCommand sqlcom = new SqlCommand(insertsql, sqlcon);
                sqlcom.ExecuteNonQuery();
                sqlcom.Dispose();
                return true;
            }
            catch (Exception)
            {

                return false;
            }
        }
        /// <summary>
        /// 根据inst_id删除信息 
        /// </summary>
        /// <param name="inst_id"></param>
        /// <returns></returns>
        public bool deleteInfo(string inst_id)
        {
            try
            {
                string deletesql = "delete from tb_instrument where inst_id='" + inst_id + "'";
                SqlCommand sqlcom = new SqlCommand(deletesql, sqlcon);
                sqlcom.ExecuteNonQuery();
                sqlcom.Dispose();
                return true;
            }
            catch (Exception)
            {

                return false;
            }
        }
        /// <summary>
        /// 根据inst_id更新信息
        /// </summary>
        /// <param name="inst_name"></param>
        /// <param name="inst_id"></param>
        /// <param name="inst_type"></param>
        /// <param name="user_name"></param>
        /// <param name="buy_date"></param>
        /// <returns></returns>
        public bool updataInfo(string inst_id, string inst_name, string inst_type, string user_name, string buy_date)
        {
            try
            {
                string updatasql = "update tb_instrument set inst_name='" + inst_name + "'" + ",inst_type='" + inst_type + "'" + ",user_name='" + user_name + "'" + ",buy_date='" + buy_date + "'" + " where inst_id='" + inst_id + "'";
                SqlCommand sqlcom = new SqlCommand(updatasql, sqlcon);
                sqlcom.ExecuteNonQuery();
                sqlcom.Dispose();
                return true;
            }
            catch (Exception)
            {

                return false;
            }
        }
        public List<string> selectInfo(string inst_id)
        {

            List<string> list = new List<string>();
            try
            {
                string selectsql = "select id,inst_id,inst_name,inst_type,user_name,buy_date from tb_instrument where inst_id='" + inst_id + "'";
                SqlCommand sqlcom = new SqlCommand(selectsql, sqlcon);
                SqlDataReader sqlreader = sqlcom.ExecuteReader();
                while (sqlreader.Read())
                {
                    list.Add(sqlreader[0].ToString());
                    list.Add(sqlreader[1].ToString());
                    list.Add(sqlreader[2].ToString());
                    list.Add(sqlreader[3].ToString());
                    list.Add(sqlreader[4].ToString());
                    list.Add(sqlreader[5].ToString());
                }
                sqlreader.Close();
                sqlcom.Dispose();
            }
            catch
            {

                throw new Exception();
            }
            return list;
        }
    }
}