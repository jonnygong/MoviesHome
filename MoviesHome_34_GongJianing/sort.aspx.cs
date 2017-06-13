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

public partial class sort : System.Web.UI.Page
{
    public string list = "";
    public string type_name = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Write(System.Web.HttpContext.Current.Request.QueryString["id"]);
        string tid = System.Web.HttpContext.Current.Request.QueryString["id"];
        string typename = "";
        string sql = "";
        if (tid != null)
        {
            try
            {
                sql = "select id, mname, img, playtimes, isrecommend, maker from movielist where tid = " + tid + "";

                string type_sql = "select tname from types where id = " + tid + "";
                DataSet type_ds = DBHelper.sqlMethod(type_sql);

                typename = ">>" + type_ds.Tables[0].Rows[0][0].ToString();
            }
            catch (Exception err)
            {
                sql = "select id, mname, img, playtimes, isrecommend, maker from movielist";
            }
        }
        else
        {
            sql = "select id, mname, img, playtimes, isrecommend, maker from movielist";
        }


        DataSet list_ds = DBHelper.sqlMethod(sql);
        list = videoItem.getList(list_ds);

        type_name = "全部电影" + typename;

    }
}
