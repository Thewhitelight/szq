using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace ADO.NET
{
    class Student
    {
        public static string ConnStr = @"server=.;database=master;user id=sa;password=123456";
        public static SqlConnection Conn = new SqlConnection(ConnStr);
        static string _no, _name, _sex, _class;
        static int _math, _chs, _en;
        public static string StuNo
        {
            get { return _no; }
            set { _no = value; }
        }
        public static string StuName
        {
            get { return _name; }
            set { _name = value; }
        }
        public static string StuSex
        {
            get { return _sex; }
            set { _sex = value; }
        }
        public static string StuClass
        {
            get { return _class; }
            set { _class = value; }
        }
        public static int StuMath
        {
            get { return _math; }
            set { _math = value; }
        }
        public static int StuChs
        {
            get { return _chs; }
            set { _chs = value; }
        }
        public static int StuEn
        {
            get { return _en; }
            set { _en = value; }
        }
        public static DataTable FillDataTable(string select)
        {
            try
            {
                Conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(select, Conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
            finally
            {
                Conn.Close();
            }
        }
        public static bool CheckUser()
        {
            try
            {
                Conn.Open();
                string SqlStr = "Select * From Grade Where StuNo='" + StuNo + "'";
                SqlCommand cmd = new SqlCommand(SqlStr, Conn);
                SqlDataReader dr = cmd.ExecuteReader();
                if (!dr.Read())
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            finally
            {
                Conn.Close();
            }
        }
        public static string Add()
        {
            string InsVal = "'" + StuNo + "','" + StuName + "','" + StuSex + "','" + StuClass + "'," + StuMath.ToString() + "," + StuChs.ToString() +","+ StuEn.ToString();
            string SqlIns = "insert into Grade(StuNo,StuName,StuSex,StuClass,Math,Chs,En)Values(" + InsVal + ")";
            string msg;
            try
            {
                Conn.Open();
                SqlCommand InsCon = new SqlCommand(SqlIns, Conn);
                SqlDataAdapter da = new SqlDataAdapter();
                da.InsertCommand = InsCon;
                da.InsertCommand.ExecuteNonQuery();
                msg = "记录添加成功！";
            }
            catch (Exception ex)
            {

                msg = ex.Message;
            }
            finally
            {
                Conn.Close();
            }
            return msg; 
        }
        public static string Update()
        {
            string msg;
            try
            {
                Conn.Open();
                string StrSel = "select * from Grade where StuNo='" + StuNo + "'";
                SqlDataAdapter da = new SqlDataAdapter(StrSel, Conn);
                DataTable dt = new DataTable();
                SqlCommandBuilder builder = new SqlCommandBuilder(da);
                da.Fill(dt);
                DataRow CurrentRow = dt.Rows[0];
                CurrentRow[1] = StuName;
                CurrentRow[2] = StuSex;
                CurrentRow[3] = StuClass;
                CurrentRow[4] = StuMath;
                CurrentRow[5] = StuChs;
                CurrentRow[6] = StuEn;
                da.Update(dt);
                msg = "数据更新成功";
            }
            catch (Exception ex)
            {
                msg = ex.Message;
            }
            finally 
            {
                Conn.Close();
            }
            return msg;
        }
        public static string Del()
        {
            string msg;
            try
            {
                string SqlDel = "delete from Grade where StuNo='" + StuNo + "'";
                SqlCommand DelCom = new SqlCommand(SqlDel, Conn);
                SqlDataAdapter da = new SqlDataAdapter();
                Conn.Open();
                da.DeleteCommand = DelCom;
                da.DeleteCommand.ExecuteNonQuery();
                msg = "数据删除成功";
            }
            catch (Exception ex)
            {
                msg = ex.Message;
            }
            finally
            {
                Conn.Close();
            }
            return msg;
        }
    }
}
