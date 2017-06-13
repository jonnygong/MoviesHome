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
///ForumBBS 的摘要说明
/// </summary>
public class ForumBBSList
{
    public string bbs_author;
    public string bbs_title;
    public string bbs_date;
    public string bbs_url;

	public ForumBBSList()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
    public ForumBBSList(string a,string t,string d,string u)
    {
        this.bbs_author = a;
        this.bbs_date = d;
        this.bbs_title = t;
        this.bbs_url = u;
    }
}
