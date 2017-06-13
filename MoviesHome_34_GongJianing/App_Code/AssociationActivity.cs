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
///AssociationActivity 的摘要说明
/// </summary>
public class AssociationActivity
{
    public string ptitle;
    public string pdate;
    public string padmin;
    public string pclassroom;
    public string asso;

	public AssociationActivity()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}

    public AssociationActivity(string t,string d,string a,string c,string asso)
    {
        this.ptitle = t;
        this.pdate = d;
        this.padmin = a;
        this.pclassroom = c;
        this.asso = asso;
    }
}
