<%@ WebHandler Language="C#" Class="addMovie" %>

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



public class addMovie : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        //指定接收数据的类型
        context.Response.ContentType = "application/json";
        //接收数据
        string movie_name = context.Request["movie_name"];
        string movie_img = context.Request["movie_img"];
        string movie_url = context.Request["movie_url"];
        string movie_type= context.Request["movie_type"];
        string date = context.Request["date"];
        string movie_people = context.Request["movie_people"];
        string LAY_demo_editor = context.Request["LAY_demo_editor"];
        //准备回送的字符串
        string outstr = "";

        //执行写入操作
        outstr = addVideo(movie_name, movie_img, movie_url, movie_type,date, movie_people, LAY_demo_editor);

        //回送结果
        context.Response.Write(outstr);
    }

    public string addVideo(string movie_name, string movie_img, string movie_url, string movie_type,string date, string movie_people, string LAY_demo_editor)
    {
        //执行插入操作，并获得影响的行数
        int i = DBHelper.sqlMethodNoDataset("insert into movielist (mname,img,url,tid,onlinetime,maker,breif) values ('" + movie_name + "','" + movie_img + "','" + movie_url + "','"+ movie_type +"','" + date + "','" + movie_people + "','" + LAY_demo_editor + "')");

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