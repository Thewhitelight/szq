using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data .SqlClient;
using System.ComponentModel;
using System.Collections;
using System.Diagnostics;
//51-a-s-px

/// <summary>
/// database 的摘要说明
/// </summary>
public class DataAccess : IDisposable
{
    public string SqlBase = ConfigurationManager.AppSettings["DBConnectionString"];
	

    public DataTable DisPlay_DT(string sql, SqlConnection conn)
    {
        DataTable Dt = new DataTable();
        SqlDataAdapter ShowAdapter = new SqlDataAdapter(sql ,conn);
        ShowAdapter.Fill(Dt);
        conn.Close();
        return Dt;
    }

    public DataTable DisPlayList_Ds(string sql, SqlConnection conn)
    {
        DataTable Dt = new DataTable();
        SqlDataAdapter ShowAdapter = new SqlDataAdapter(sql ,conn);
        ShowAdapter.Fill(Dt);
        conn.Close();
        return Dt;        
    }

    public int AddInfo(string sql, SqlConnection conn)
    {
        int State;
        try
        {
            SqlCommand AddInfoCmd = new SqlCommand(sql,conn);
            AddInfoCmd.ExecuteNonQuery();
            conn.Close();
            State = 1;
        }
        catch
        {
            State = 0;
            conn.Close();
        }
        return State;
    }

    public int DeleteInfo(string sql, SqlConnection conn)
    {
        int State;
        try
        {
            SqlCommand DeleteInfoCmd = new SqlCommand(sql,conn);
            DeleteInfoCmd.ExecuteNonQuery();
            conn.Close();
            State = 1;
        }
        catch
        {
            State = 0;
            conn.Close();
        }
        return State;
    }

    public int ModInfo(string sql, SqlConnection conn)
    {
        int State;
        try
        {
            SqlCommand ModInfoCmd = new SqlCommand(sql, conn);
            ModInfoCmd.ExecuteNonQuery();
            conn.Close();
            State = 1;
        }
        catch
        {
            State = 0;
            conn.Close();
        }
        return State;
    }












    
    /// <summary>
    /// 保护变量，数据库连接。
    /// </summary>
    protected SqlConnection Connection;

    /// <summary>
    /// 保护变量，数据库连接串。
    /// </summary>
    protected String ConnectionString;

    /// <summary>
    /// 系统日志对象，日志来源为“MyOA.Database”
    /// </summary>
    //protected MyEventsLog log = new MyEventsLog("MyOA.Database");

    /// <summary>
    /// 构造函数。
    /// </summary>
    /// <param name="DatabaseConnectionString">数据库连接串</param>
    public DataAccess()
    {
        ConnectionString = ConfigurationManager.AppSettings["DBConnectionString"];
    }

    /// <summary>
    /// 析构函数，释放非托管资源
    /// </summary>
    ~DataAccess()
    {
        //try
        //{
        //    if (Connection != null)
        //        Connection.Close();
        //}
        //catch (Exception e)
        //{
        //    log.WriteLog(EventLogEntryType.Warning, "Close失败，系统异常信息：" + e.Message);
        //}
        //try
        //{
        //    Dispose();
        //}
        //catch { }
    }

    /// <summary>
    /// 保护方法，打开数据库连接。
    /// </summary>
    protected void Open()
    {
        if (Connection == null)
        {
            try
            {
                Connection = new SqlConnection(ConnectionString);
            }
            catch (Exception e)
            {
                //log.WriteLog(EventLogEntryType.Error, "创建数据库连接失败，系统异常信息：" + e.Message);
            }
        }
        if (Connection.State.Equals(ConnectionState.Closed))
        {
            try
            {
                Connection.Open();
            }
            catch (Exception e)
            {
                //log.WriteLog(EventLogEntryType.Error, "打开数据库连接失败，系统异常信息：" + e.Message);
            }
        }
    }

    /// <summary>
    /// 公有方法，关闭数据库连接。
    /// </summary>
    public void Close()
    {
        try
        {
            if (Connection != null)
                Connection.Close();
        }
        catch (Exception e)
        {
            //log.WriteLog(EventLogEntryType.Warning, "Close失败，系统异常信息：" + e.Message);
        }
    }

    /// <summary>
    /// 公有方法，释放资源。
    /// </summary>
    public void Dispose()
    {
        // 确保连接被关闭
        try
        {
            if (Connection != null)
            {
                Connection.Dispose();
                Connection = null;
            }
        }
        catch (Exception e)
        {
            //log.WriteLog(EventLogEntryType.Warning, "Dispose失败，系统异常信息：" + e.Message);
        }
    }

    /// <summary>
    /// 公有方法，获取数据，返回一个SqlDataReader （调用后主意调用SqlDataReader.Close()）。
    /// </summary>
    /// <param name="SqlString">Sql语句</param>
    /// <returns>SqlDataReader</returns>
    public SqlDataReader GetDataReader(String SqlString)
    {
        Open();
        try
        {
            SqlCommand cmd = new SqlCommand(SqlString, Connection);
            return cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
        }
        catch (Exception e)
        {
            //log.WriteLog(EventLogEntryType.Error, "GetDataReader失败，SqlString=" + SqlString + ",系统异常信息：" + e.Message);
            return null;
        }
    }

    /// <summary>
    /// 公有方法，获取数据，返回一个DataSet。
    /// </summary>
    /// <param name="SqlString">Sql语句</param>
    /// <returns>DataSet</returns>
    public DataSet GetDataSet(String SqlString)
    {
        DataSet dataset = new DataSet();
        Open();
        try
        {
            SqlDataAdapter adapter = new SqlDataAdapter(SqlString, Connection);
            adapter.Fill(dataset);
        }
        catch (Exception e)
        {
            //log.WriteLog(EventLogEntryType.Warning, "GetDataSet失败，SqlString=" + SqlString + ",系统异常信息：" + e.Message);
        }
        finally
        {
            Close();
        }
        return dataset;
    }

    /// <summary>
    /// 公有方法，获取数据，返回一个DataTable。
    /// </summary>
    /// <param name="SqlString">Sql语句</param>
    /// <returns>DataTable</returns>
    public DataTable GetDataTable(String SqlString)
    {
        DataSet dataset = GetDataSet(SqlString);
        dataset.CaseSensitive = false;
        return dataset.Tables[0];
    }

    /// <summary>
    /// 公有方法，获取数据，返回一个DataRow。
    /// </summary>
    /// <param name="SqlString">Sql语句</param>
    /// <returns>DataRow</returns>
    public DataRow GetDataRow(String SqlString)
    {
        DataSet dataset = GetDataSet(SqlString);
        dataset.CaseSensitive = false;
        if (dataset.Tables[0].Rows.Count > 0)
        {
            return dataset.Tables[0].Rows[0];
        }
        else
        {
            return null;
        }
    }

    /// <summary>
    /// 公有方法，执行Sql语句。
    /// </summary>
    /// <param name="SqlString">Sql语句</param>
    /// <returns>对Update、Insert、Delete为影响到的行数，其他情况为-1</returns>
    public int ExecuteSQL(String SqlString)
    {
        int count = -1;
        Open();
        try
        {
            SqlCommand cmd = new SqlCommand(SqlString, Connection);
            count = cmd.ExecuteNonQuery();
        }
        catch (Exception e)
        {
            //log.WriteLog(EventLogEntryType.Error, "ExecuteSQL失败，SqlString=" + SqlString + ",系统异常信息：" + e.Message);
            count = -1;
        }
        finally
        {
            Close();
        }
        return count;
    }

    /// <summary>
    /// 公有方法，执行一组Sql语句。
    /// </summary>
    /// <param name="SqlStrings">Sql语句组</param>
    /// <returns>是否成功</returns>
    public bool ExecuteSQL(String[] SqlStrings)
    {
        bool success = true;
        Open();
        SqlCommand cmd = new SqlCommand();
        SqlTransaction trans = Connection.BeginTransaction();
        cmd.Connection = Connection;
        cmd.Transaction = trans;

        int i = 0;
        try
        {
            foreach (String str in SqlStrings)
            {
                cmd.CommandText = str;
                cmd.ExecuteNonQuery();
                i++;
            }
            trans.Commit();
        }
        catch (Exception e)
        {
            //log.WriteLog(EventLogEntryType.Error, "ExecuteSQL失败，SqlString=" + SqlStrings[i] + ",系统异常信息：" + e.Message);
            success = false;
            trans.Rollback();
        }
        finally
        {
            Close();
        }
        return success;
    }

    /// <summary>
    /// 公有方法，在一个数据表中插入一条记录。
    /// </summary>
    /// <param name="TableName">表名</param>
    /// <param name="Cols">哈西表，键值为字段名，值为字段值</param>
    /// <returns>是否成功</returns>
    public bool Insert(String TableName, Hashtable Cols)
    {
        int Count = 0;

        if (Cols.Count <= 0)
        {
            return true;
        }

        String Fields = " (";
        String Values = " Values(";
        foreach (DictionaryEntry item in Cols)
        {
            if (Count != 0)
            {
                Fields += ",";
                Values += ",";
            }
            Fields += "[" + item.Key.ToString() + "]";
            Values += "'"+item.Value.ToString()+"'";
            Count++;
        }
        Fields += ")";
        Values += ")";

        String SqlString = "Insert into " + TableName + Fields + Values;

        String[] Sqls = { SqlString };
        return ExecuteSQL(Sqls);
    }


    /// <summary>
    /// 公有方法，更新一个数据表。
    /// </summary>
    /// <param name="TableName">表名</param>
    /// <param name="Cols">哈西表，键值为字段名，值为字段值</param>
    /// <param name="Where">Where子句</param>
    /// <returns>是否成功</returns>
    public bool Update(String TableName, Hashtable Cols, String Where)
    {
        int Count = 0;
        if (Cols.Count <= 0)
        {
            return true;
        }
        String Fields = " ";
        foreach (DictionaryEntry item in Cols)
        {
            if (Count != 0)
            {
                Fields += ",";
            }
            Fields += "[" + item.Key.ToString() + "]";
            Fields += "=";
            Fields =Fields+"'"+ item.Value.ToString()+"'";
            Count++;
        }
        Fields += " ";

        String SqlString = "Update " + TableName + " Set " + Fields + Where;

        String[] Sqls = { SqlString };
        return ExecuteSQL(Sqls);
    }

    //***************************************************************************************//
    
    private SqlCommand CreateCommand(string ProcName, SqlParameter[] Parms)
    {
        Open();
        SqlCommand Cmd = new SqlCommand(ProcName, Connection);
        Cmd.CommandType = CommandType.StoredProcedure;
        if(Parms!=null)
        {
            foreach (SqlParameter Parameter in Parms)
                Cmd.Parameters.Add(Parameter);
        }
        return Cmd;
    }

    public SqlParameter MakeParam(string ParamName, SqlDbType DbType, Int32 Size, ParameterDirection Direction, object Value)
    {
        SqlParameter Param;
        if (Size > 0)
            Param = new SqlParameter(ParamName, DbType, Size);
        else
            Param = new SqlParameter(ParamName,DbType);
        Param.Direction = Direction;
        if (Value != null)
            Param.Value = Value;
        return Param;
    }

    public SqlParameter MakeInParam(string ParamName,SqlDbType DbType,int Size,object Value)
    {
        return MakeParam(ParamName, DbType, Size, ParameterDirection.Input, Value);  
    }

    public int RunProc(string ProcName)
    {
        int Count = -1;
        SqlCommand Cmd = CreateCommand(ProcName,null);
        Count = Cmd.ExecuteNonQuery();
        Close();
        return Count;
    }
    
    public int RunProc(string ProcName,SqlParameter[] Params)
    {
        int Count = -1;
        SqlCommand Cmd = CreateCommand(ProcName, Params);
        Count = Cmd.ExecuteNonQuery();
        Close();
        return Count;
    }

    public SqlDataReader RunProcGetReader(string ProcName, SqlParameter[] Params)
    {
        SqlCommand Cmd = CreateCommand(ProcName, Params);
        return Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
    }
    
    public SqlDataReader RunProcGetReader(string ProcName)
    {
        SqlCommand Cmd = CreateCommand(ProcName, null);
        return Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
    }

    public int RunProcGetCount(string ProcName, SqlParameter[] Params)
    {
        SqlCommand Cmd = CreateCommand(ProcName,Params);
        string SCount;
        SCount = Cmd.ExecuteScalar().ToString().Trim();
        if (SCount == "")
            SCount = "0";
        Close();
        return Convert.ToInt32(SCount);
    }

    public DataTable GetDataTable(string ProcName, SqlParameter[] Params)
    {
        Open();
        SqlCommand Cmd = CreateCommand(ProcName, Params);
        SqlDataAdapter adapter = new SqlDataAdapter(Cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        Close();
        return ds.Tables[0];
    }
}
