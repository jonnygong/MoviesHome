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
///MyApp 的摘要说明
/// </summary>
public class MyApp
{

    public string app_name;
    public int app_id;
    public string app_icon;
    public string app_dialogicon;
    public string app_url;
    public int app_width;
    public int app_height;
    public int app_type;
    public string app_owner;

    public MyApp() { }

	public MyApp(int id,string n,string i,string d,string u,int w,int h,int t,string o)
	{
        this.app_id = id;
        this.app_name = n;
        this.app_icon = i;
        this.app_dialogicon = d;
        this.app_url = u;
        this.app_width = w;
        this.app_height = h;
        this.app_type = t;
        this.app_owner = o;
	}

    public string getName()
    {
        return app_name;
    }

    public string getIcon()
    {
        return app_icon;
    }

    public string getDialogicon()
    {
        return app_dialogicon;
    }

    public string getUrl()
    {
        return app_url;
    }

    public int getWidth()
    {
        return app_width;
    }

    public int getHeight()
    {
        return app_height;
    }

    public int getType()
    {
        return app_type;
    }
    public string getOwner()
    {
        return app_owner;
    }
}
