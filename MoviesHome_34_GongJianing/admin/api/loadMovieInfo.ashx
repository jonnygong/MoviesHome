<%@ WebHandler Language="C#" Class="loadMovieInfo" %>

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

public class loadMovieInfo : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        //指定接收数据的类型
        context.Response.ContentType = "application/json";
        //接收数据
        //string movie_name = context.Request["movie_name"];
        
        //准备回送的字符串
        string outstr = "";

        //执行写入操作
        outstr = loadMovieDetail();

        //回送结果
        context.Response.Write(outstr);
    }

    public string loadMovieDetail()
    {

        //执行查询操作，并获得返回的行数
        DataSet ds = DBHelper.sqlMethod(" select movielist.id,tname,mname,onlinetime,img,maker,playtimes " +
        " from movielist,types " +
        " where movielist.tid = types.id");
        int i = ds.Tables[0].Rows.Count;


        StringBuilder Builder = new StringBuilder();
        Builder.Append("{");
        Builder.Append("\"r\":" + i + "");

        if (i > 0)
        {
            List<MovieInfo> list = new List<MovieInfo>();

            for (int j = 0; j < i; j++)
            {
                MovieInfo temp = new MovieInfo(int.Parse(ds.Tables[0].Rows[j][0].ToString()), ds.Tables[0].Rows[j][1].ToString(), ds.Tables[0].Rows[j][2].ToString(), ds.Tables[0].Rows[j][3].ToString(), ds.Tables[0].Rows[j][4].ToString(), ds.Tables[0].Rows[j][5].ToString(), int.Parse(ds.Tables[0].Rows[j][6].ToString()));
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