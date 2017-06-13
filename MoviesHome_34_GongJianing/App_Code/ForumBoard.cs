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

/// <summary>
///ForumBoard 的摘要说明
/// </summary>
public class ForumBoard
{
    public string boardname;
    public string boarddes;
    public string boardadmin;
    public string boarddate;
    public string url="进入";

	public ForumBoard()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}

    public ForumBoard(string n,string des,string a,string d,string u)
    {
        this.boardadmin = a;
        this.boarddate = d;
        this.boarddes = des;
        this.boardname = n;
        this.url = u;

    }
}
