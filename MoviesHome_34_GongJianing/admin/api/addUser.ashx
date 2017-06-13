<%@ WebHandler Language="C#" Class="addUser" %>

using System;
using System.Web;
using System.Data.OleDb;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web.Security;
using System.Xml.Linq;
using System.Web.Script.Serialization;
using System.Text;
using System.IO;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;

public class addUser : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        //指定接收数据的类型
        context.Response.ContentType = "application/json";
        //接收数据
        string username = context.Request["username"];
        string pwd = context.Request["pwd"];
        string limit = context.Request["limit"];

        //准备回送的字符串
        string outstr = "";

        //执行写入操作
        outstr = addUserIn(username,pwd,limit);

        //回送结果
        context.Response.Write(outstr);
    }

    public string addUserIn(string username,string pwd,string limit)
    {
        //执行插入操作，并获得影响的行数
        int i = DBHelper.sqlMethodNoDataset(" insert into admins(username,password,limit) values('"+username+"','"+pwd+"',"+limit+");");

        StringBuilder Builder = new StringBuilder();
        Builder.Append("{");
        Builder.Append("\"r\":" + i + "");
        Builder.Append("}");
        return Builder.ToString();
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}