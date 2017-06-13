<%@ WebHandler Language="C#" Class="deleteUser" %>

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

public class deleteUser : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        //指定接收数据的类型
        context.Response.ContentType = "application/json";
        //接收数据

        string id = context.Request["id"];

        //准备回送的字符串
        string outstr = "";

        //执行写入操作
        outstr = deleteUserIn(id);

        //回送结果
        context.Response.Write(outstr);
    }

    public string deleteUserIn(string id)
    {
        //执行插入操作，并获得影响的行数
        int i = DBHelper.sqlMethodNoDataset("delete from admins where id=" + id);

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