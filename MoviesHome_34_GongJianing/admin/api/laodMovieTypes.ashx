﻿<%@ WebHandler Language="C#" Class="laodMovieTypes" %>

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


public class laodMovieTypes : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        //指定接收数据的类型
        context.Response.ContentType = "application/json";
        //接收数据
        //string movie_name = context.Request["movie_name"];

        //准备回送的字符串
        string outstr = "";

        //执行写入操作
        outstr = loadMovietypes();

        //回送结果
        context.Response.Write(outstr);
    }

    public string loadMovietypes()
    {

        //执行查询操作，并获得返回的行数
        DataSet ds = DBHelper.sqlMethod(" select * from types");
        int i = ds.Tables[0].Rows.Count;


        StringBuilder Builder = new StringBuilder();
        Builder.Append("{");
        Builder.Append("\"r\":" + i + "");

        if (i > 0)
        {
            List<MovieTypes> list = new List<MovieTypes>();

            for (int j = 0; j < i; j++)
            {
                MovieTypes temp = new MovieTypes(int.Parse(ds.Tables[0].Rows[j][0].ToString()), ds.Tables[0].Rows[j][1].ToString());
                list.Add(temp);
            }

            string json = new JavaScriptSerializer().Serialize(list);//这个很关键，否则error 

            Builder.Append(",\"data\":");
            Builder.Append(json);
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