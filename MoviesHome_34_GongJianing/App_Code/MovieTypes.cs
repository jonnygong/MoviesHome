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
/// MovieTypes 的摘要说明
/// </summary>
public class MovieTypes
{
    public int id;
    public string tname;

	public MovieTypes()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    public MovieTypes(int id, string tname)
    {
        this.id = id;
        this.tname = tname;

    }

    public int getId()
    {
        return this.id;
    }
    public string getTname()
    {
        return this.tname;
    }

}
