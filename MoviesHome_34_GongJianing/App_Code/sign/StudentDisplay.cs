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
/// StudentDisplay 的摘要说明
/// </summary>
public class StudentDisplay
{
	
	public Label sName;
    public Label sNo;
    public Label sStatus;
    Image head;
    Label blank;

    public StudentDisplay(string sname, string sno, string status)
    {
        blank = new Label();
        blank.Width = 25;
        sName = new Label();
        sNo = new Label();
        sStatus = new Label(); ;
        sNo.Text = sno;
        sNo.Font.Size = 10;
        sNo.Width = 80;
        sNo.Height = 25;
        sNo.CssClass = "sno";
        sName.Text = sname;
        sName.Font.Size = 10;
        sName.Width = 60;
        sName.Height = 25;
        sName.CssClass = "sno";
        sStatus.Text=status;
        sStatus.Width = 65;
        sStatus.Font.Size = 10;
        sStatus.Height = 25;
        sStatus.CssClass = "sno";

        head = new Image();
        setHead();
    }

    public void addControl(Panel p)
    {
        p.Controls.Add(blank);
        p.Controls.Add(head);
        p.Controls.Add(sNo);
        p.Controls.Add(sName);
        p.Controls.Add(sStatus);
    }

    public string getName()
    {
        return sName.Text;
    }

    public string getNo()
    {
        return sNo.Text;
    }

    public string getStatus()
    {
        return sStatus.Text;
    }

    public void setHead()
    {
        if (sStatus.Text == "已签到")
        {
            head.ImageUrl = "~/app/sign/images/arr_small.jpg";
        }
        else
        {
            head.ImageUrl = "~/app/sign/images/arr2_small.jpg";
        }
    }
}
