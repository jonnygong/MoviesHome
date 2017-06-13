using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.OleDb;
using System.Data.Sql;
using System.Data.SqlClient;

/// <summary>
///DBHelper 的摘要说明
/// </summary>
public class DBHelper
{
    /// <summary>
    /// 获取 SQL Server 的连接和数据集
    /// </summary>
    public DBHelper()
    {
        //
        //TODO: 在此处添加构造函数逻辑
        //
    }

    public static DataSet sqlMethod(string sql)
    {
        System.Web.HttpServerUtility Server = System.Web.HttpContext.Current.Server;
        string connStr = ConfigurationManager.ConnectionStrings["conn1"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);
        SqlDataAdapter da = new SqlDataAdapter(sql, conn);
        DataSet ds = new DataSet();
        conn.Open();
        da.Fill(ds);
        conn.Close();
        return ds;
    }


    public static int sqlMethodNoDataset(string sql)
    {
        System.Web.HttpServerUtility Server = System.Web.HttpContext.Current.Server;
        string connStr = ConfigurationManager.ConnectionStrings["conn1"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandText = sql;
        int result = cmd.ExecuteNonQuery();
        conn.Close();
        return result;
    }

    public static SqlConnection getSqlConn()
    {
        string connStr = ConfigurationManager.ConnectionStrings["conn1"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);
        return conn;
    }

    public static int exeDML(string sql)
    {
        SqlConnection conn = getSqlConn();
        try
        {
            SqlCommand cmd = new SqlCommand(sql, conn);
            conn.Open();
            int n = cmd.ExecuteNonQuery();
            return n;
        }
        finally
        {
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
        }
    }

    private static SqlConnection sqlMethod()
    {
        throw new Exception("The method or operation is not implemented.");
    }

}
