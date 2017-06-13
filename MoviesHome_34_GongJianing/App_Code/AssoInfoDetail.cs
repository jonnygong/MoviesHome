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
///AssoInfoDetail 的摘要说明
/// </summary>
public class AssoInfoDetail
{
    public string name;
    public string value;
    public string group;
    public string editor;
	public AssoInfoDetail()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
    public AssoInfoDetail(string n,string v,string g,string e)
    {
        this.name = n;
        this.value = v;
        this.group = g;
        this.editor = e;
    }
}
