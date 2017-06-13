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
/// MovieInfo 的摘要说明
/// </summary>
public class MovieInfo
{
    public int id;
    public string tname;
    public string mname;
    public string onlinetime;
    public string img;
    public string maker;
    public int playtimes;

	public MovieInfo()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    public MovieInfo(int id,string tname, string mname, string onlinetime, string img,string maker,int playtimes)
    {
        this.id = id;
        this.tname = tname;
        this.mname = mname;
        this.onlinetime = onlinetime;
        this.img = img;
        this.maker = maker;
        this.playtimes = playtimes;


    }

    public int getId()
    {
        return this.id;
    }
    public string getTname()
    {
        return this.tname;
    }

    public string getMname()
    {
        return this.mname;
    }
    public string getOnlinetime()
    {
        return this.onlinetime;
    }
    public string getImg()
    {
        return this.img;
    }
    public string getMaker()
    {
        return this.maker;
    }
    public int getPlayTimes()
    {
        return this.playtimes;
    }
}
