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
/// Login 的摘要说明
/// </summary>
public class Login
{
	public int id;
    public string username;
    public string pwd;
    public int limit;

	public Login()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    public Login(int id , string username,string pwd,int limit)
    {
        this.id = id;
        this.username = username;
        this.pwd = pwd;
        this.limit = limit;


    }

    public int getId()
    {
        return this.id;
    }

    public string getUsername()
    {
        return this.username;
    }
    public string getPwd()
    {
        return this.pwd;
    }
    public int getLimit()
    {
        return this.limit;
    }
}
