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
/// UserInfo 的摘要说明
/// </summary>
public class UserInfo
{
    public int id;
    public string username;
    public int limit;

	public UserInfo()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    public UserInfo(int id,string username, int limit)
    {
        this.id = id;
        this.username = username;
        this.limit = limit;

    }

    public int getId()
    {
        return this.id;
    }
    public string getUserName()
    {
        return this.username;
    }
    public int getLimit()
    {
        return this.limit;
    }

}
