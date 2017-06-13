using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class index : System.Web.UI.Page
{
    public string hotMovies = "";
    public string recommendMovies = "";
    public string newMoveis = "";
    public string todayNew = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        DataSet hotMovies_ds = DBHelper.sqlMethod("select top 4 id, mname, img, onlinetime,breif,playtimes from movielist order by playtimes desc");
        hotMovies = videoItem.getIndexList(hotMovies_ds);

        DataSet recommendMovies_ds = DBHelper.sqlMethod("select top 4 id, mname, img, onlinetime,breif,playtimes from movielist where isrecommend=1");
        recommendMovies = videoItem.getIndexList(recommendMovies_ds);

        DataSet newMoveis_ds = DBHelper.sqlMethod("select top 4 id, mname, img, onlinetime,breif from movielist order by onlinetime desc");
        newMoveis = videoItem.getIndexList(newMoveis_ds);

        DataSet todayNew_ds = DBHelper.sqlMethod("select * from movielist Where Convert(varchar(10),[onlinetime],120) = Convert(varchar(10),getDate(),120) ");
        todayNew = todayNew_ds.Tables[0].Rows.Count.ToString();
    }
}
