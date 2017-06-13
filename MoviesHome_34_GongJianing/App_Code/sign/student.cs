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
/// student 的摘要说明
/// </summary>
public class student
{
    public Label sName;
    public Label sNo;
    public DropDownList sStatus;
    Image head;
    Label blank;

    public student(string sname, string sno, string status)
    {
        blank = new Label();
        blank.Width = 25;
        sName = new Label();
        sNo = new Label();
        sStatus = new DropDownList(); ;
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
        sStatus.Items.Add(status);
        sStatus.Items.Add("未签到");
        sStatus.Items.Add("请假");
        sStatus.Items.Add("已签到");
        sStatus.Items.Add("迟到");
        sStatus.Width = 65;

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
            head.ImageUrl = "~/images/arr_small.jpg";
        }
        else
        {
            head.ImageUrl = "~/images/arr2_small.jpg";
        }
    }
}
