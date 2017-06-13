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
/// MyClass 的摘要说明
/// </summary>
public class MyClass
{
    public string a;
    public int b;

	public MyClass()
	{
		
	}

    public MyClass(string x, int y)
    {
        this.a = x;
        this.b = y;
    }

    public string getA()
    {
        return this.a;
    }

    public int getB()
    {
        return this.b;
    }
}
