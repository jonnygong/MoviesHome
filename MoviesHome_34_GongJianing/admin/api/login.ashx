<%@ WebHandler Language="C#" Class="login" %>

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
using System.Web.SessionState;


public class login : IHttpHandler, IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        //string name = context.Request.Form["name"];
        //string pwd = context.Request.Form["pwd"];
        //DataSet ds = DBHelper.sqlMethod("select * from admins where name = "+ name +" and pwd = "+pwd+"");
        //int cnt = ds.Tables[0].Rows.Count;

        //if (cnt > 0)
        //{
        //    context.Session["adminId"] = ds.Tables[0].Rows[0]["id"].ToString();
        //    context.Session["adminName"] = ds.Tables[0].Rows[0]["username"].ToString();
        //    context.Session["adminLimit"] = ds.Tables[0].Rows[0]["limit"].ToString();
        //    //成功，跳转至后台主界面
        //    context.Response.Redirect("index.aspx");

        //}
        //else {
        //    context.Response.Redirect("login.html");
        //}




        //指定回送数据的类型
        context.Response.ContentType = "application/json";
        string username = context.Request["username"];
        string password = context.Request["password"];
        //准备回送的字符串
        string outstr = "";

        //执行写入操作
        outstr = loadLogin(username, password, context);

        //回送结果
        context.Response.Write(outstr);
    }


    public string loadLogin(string username, string password, HttpContext context)
    {

        //执行查询操作，并获得返回的行数
        DataSet ds = DBHelper.sqlMethod(" select id,username,password,limit from admins where username ='" + username + "' and password ='" + password + "'");
        int i = ds.Tables[0].Rows.Count;


        StringBuilder Builder = new StringBuilder();
        Builder.Append("{");
        Builder.Append("\"r\":" + i + "");

        if (i > 0)
        {
            List<Login> list = new List<Login>();

            for (int j = 0; j < i; j++)
            {
                Login temp = new Login(int.Parse(ds.Tables[0].Rows[j][0].ToString()), ds.Tables[0].Rows[j][1].ToString(), ds.Tables[0].Rows[j][2].ToString(), int.Parse(ds.Tables[0].Rows[j][3].ToString()));
                list.Add(temp);
            }

            context.Session["adminId"] = ds.Tables[0].Rows[0]["id"].ToString();
            context.Session["adminName"] = ds.Tables[0].Rows[0]["username"].ToString();
            context.Session["adminLimit"] = ds.Tables[0].Rows[0]["limit"].ToString();
            //成功，跳转至后台主界面
            context.Response.Redirect("../index.aspx");
            
            string json = new JavaScriptSerializer().Serialize(list);//这个很关键，否则error 

            Builder.Append(",\"data\":");
            Builder.Append(json);
        }
        else {
            context.Response.Redirect("../login.html");
        }


        Builder.Append("}");
        return Builder.ToString();
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}