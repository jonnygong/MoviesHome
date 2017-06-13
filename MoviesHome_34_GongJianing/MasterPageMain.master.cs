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

public partial class MasterPageMain : System.Web.UI.MasterPage
{
    // 电影类别渲染
    public string types = "";
    protected void Page_Load(object sender, EventArgs e)
    { 
        if(!IsPostBack){
            DataSet ds = DBHelper.sqlMethod("select id, tname from types");
            int rows = ds.Tables[0].Rows.Count;

            for (int i = 0; i < rows; i++)
            {
                string id = ds.Tables[0].Rows[i][0].ToString();
                string name = ds.Tables[0].Rows[i][1].ToString();
                types += "<li><a href=\"sort.aspx?id=" + id + "\">" + name + "</a></li>";
            }
        }
    }
}
