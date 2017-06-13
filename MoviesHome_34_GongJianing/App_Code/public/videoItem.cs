using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// videoItem 的摘要说明
/// </summary>
public class videoItem
{
    /// <summary>
    /// 视频列表项目渲染
    /// </summary>
	public videoItem()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    
    public static string getIndexList(DataSet ds)
    {
        string content = "";
        int rows = ds.Tables[0].Rows.Count;

        for (int i = 0; i < rows; i++)
        {
            string id = ds.Tables[0].Rows[i][0].ToString();
            string name = ds.Tables[0].Rows[i][1].ToString();
            string img = ds.Tables[0].Rows[i][2].ToString();
            string time = ds.Tables[0].Rows[i][3].ToString();
            string desc = ds.Tables[0].Rows[i][4].ToString();
            // 分割 日期 和 时间
            string[] tempTime = time.Split(' ');
            // 分割 年月日
            string[] tempTime1 = tempTime[0].Split('-');
            // 日期对应的英文
            string[] monthList = { "Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sept","Oct","Nov","Dec" };
            string day = tempTime1[2];
            string month = monthList[int.Parse(tempTime1[1]) -1];
            content += 
                "<div class=\"span3\">"+
            "<article>"+
                "<a href=\"video.aspx?id=" + id + "\"><img src=\"" + img + "\" alt=\"\" class=\"imgOpa\"></a>" +
				"<div class=\"date\">"+
                    "<span class=\"day\">" + day + "</span>" +
                    "<span class=\"month\">" + month + "</span>" +
				"</div>"+
                "<h4><a href=\"video.aspx?id=" + id + "\">" + name + "</a></h4>" +
				"<p>"+ desc +
                        "<a href=\"video.aspx?id="+id+"\" class=\"read-more\">read more <i class=\"icon-angle-right\"></i></a>"+
				"</p>"+
				"</article>"+
        "</div>";
        }
        return content;
    }

    public static string getList(DataSet ds)
    {
        string content = "";
        int rows = ds.Tables[0].Rows.Count;

        for (int i = 0; i < rows; i++)
        {
            string id = ds.Tables[0].Rows[i][0].ToString();
            string name = ds.Tables[0].Rows[i][1].ToString();
            string img = ds.Tables[0].Rows[i][2].ToString();
            string times = ds.Tables[0].Rows[i][3].ToString();
            string recommend = ds.Tables[0].Rows[i][4].ToString() == "False" ? "" : "推荐";
            string maker = ds.Tables[0].Rows[i][5].ToString();

            content +=
                "<div class=\"movie left\">"+
                "<a href=\"video.aspx?id=" + id + "\"><img src=\"" + img + "\" width=\"170\" height=\"130\"/></a><br/><a href=\"video.aspx?id=" + id + "\">" + name + "</a><span class=\"right\" style=\"margin-right:20px; color: #F63\">" + recommend + "</span><br>" +
"制作人：" + maker + "<span style=\"margin-top:10px; margin-left:10px; font-size:12px\">播放次数<small style=\"color:red\">" + times + "</small></span></div>";
        }
        return content;
    }
}
