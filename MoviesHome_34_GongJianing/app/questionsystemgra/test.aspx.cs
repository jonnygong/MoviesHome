using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.OleDb;

public partial class test : System.Web.UI.Page
{
    public string outstr="";
    int pid = 1;
    int tid, tcount,qtype;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if(!IsPostBack)
        {
            if(Request.QueryString["pid"]!=null)
            {
                pid = int.Parse(Request.QueryString["pid"]);
                q_order.Value = pid.ToString();
                t_id.Value = Request.QueryString["t"];
                t_count.Value = Request.QueryString["c"];
                tid = int.Parse(t_id.Value);
                tcount = int.Parse(t_count.Value);

                HttpCookie cok = Request.Cookies["u_id"];
                int id=int.Parse(cok.Value);

                if(id!=15252)
                {
                    pid = 5;
                    q_order.Value = "5";
                }

                initQuestions(pid);
            }
        }
        else
        {
            pid = int.Parse(q_order.Value);
            tid = int.Parse(t_id.Value);
            qtype = int.Parse(q_type.Value);
            tcount = int.Parse(t_count.Value);
        }
        
    }

    private void initQuestions(int i)
    {
        DataSet ds = DBHelper.sqlMethod("select * from t_毕业生问卷题 where q_orderid=" + i.ToString() + " and test_id=" + tid.ToString());

        HttpCookie hc = Request.Cookies["u_id"];
        string uid = hc.Value;
        DataSet ds_finish = DBHelper.sqlMethod("select * from t_毕业生问卷结果 where user_id=" + uid + " and q_id=" + i.ToString());

        if(ds.Tables[0].Rows.Count>0)
        {
            //加题面
            outstr += "<div class=\"ks_mid_xzyiwaikuang\"><div class=\"ks_mid_xzyiquestion\"><a style=\"color:#e20000; font-size: 14px;\">Q"+i.ToString()+"：" + "</a>&nbsp;&nbsp;" + ds.Tables[0].Rows[0]["q_name"].ToString() + "</br></div><div id=\"ks_mid_xzyianswer\"><ul>";
            string s_answer = "";

            //获取题目类型
            int q_t = int.Parse(ds.Tables[0].Rows[0]["q_type"].ToString());
            q_type.Value = q_t.ToString();
            char tip = 'A'; string choise = ""; string[] choises;

            //根据题目类型初始化题目
            switch(q_t){
                //单选
                case 0:
                    choise = ds.Tables[0].Rows[0]["q_choise"].ToString();
                    choises = choise.Split('|');
                    for(int j=0;j<choises.Length;j++)
                    {
                        if (ds_finish.Tables[0].Rows.Count > 0)
                        {
                            int pos = ds_finish.Tables[0].Rows[0]["choises"].ToString().IndexOf((char)(tip + j));
                            if(pos >= 0)
                            {
                                s_answer += "<li><input id=\"dan\" name=\"dan\" type=\"radio\" checked=\"checked\" class=\"\" value=\"" + ((char)(tip + j)).ToString() + "\"/>" + (char)(tip + j) + ".&nbsp;&nbsp;" + choises[j] + "</li>";
                            }
                            else
                            {
                                s_answer += "<li><input id=\"dan\" name=\"dan\" type=\"radio\" class=\"\" value=\"" + ((char)(tip + j)).ToString() + "\"/>" + (char)(tip + j) + ".&nbsp;&nbsp;" + choises[j] + "</li>";
                            }
                        }
                        else
                        {
                            s_answer += "<li><input id=\"dan\" name=\"dan\" type=\"radio\" class=\"\" value=\"" + ((char)(tip + j)).ToString() + "\"/>" + (char)(tip + j) + ".&nbsp;&nbsp;" + choises[j] + "</li>";
                        }
                    }
                    break;

                //填空
                case 1:
                    if (ds_finish.Tables[0].Rows.Count > 0)
                    {
                        s_answer += "<li><input id=\"tk\" name=\"tk\" type=\"text\" class=\"\" value=\"" + ds_finish.Tables[0].Rows[0]["blank"].ToString() + "\" size=\"50\"  maxlength=\"60\" /></li>";
                    }
                    else
                    {
                        s_answer += "<li><input id=\"tk\" name=\"tk\" type=\"text\" class=\"\" value=\"\" size=\"50\"  maxlength=\"60\" /></li>";
                    }
                    break;

                //单选+填空
                case 2:
                    choise = ds.Tables[0].Rows[0]["q_choise"].ToString();
                    choises = choise.Split('|');
                    for (int j = 0; j < choises.Length; j++)
                    {
                        if (ds_finish.Tables[0].Rows.Count > 0)
                        {
                            int pos = ds_finish.Tables[0].Rows[0]["choises"].ToString().IndexOf((char)(tip + j));
                            if (pos >= 0)
                            {
                                s_answer += "<li><input id=\"dan\" name=\"dan\" type=\"radio\" checked=\"checked\" class=\"\" value=\"" + ((char)(tip + j)).ToString() + "\"/>" + (char)(tip + j) + ".&nbsp;&nbsp;" + choises[j] + "</li>";
                            }
                            else
                            {
                                s_answer += "<li><input id=\"dan\" name=\"dan\" type=\"radio\" class=\"\" value=\"" + ((char)(tip + j)).ToString() + "\"/>" + (char)(tip + j) + ".&nbsp;&nbsp;" + choises[j] + "</li>";
                            }
                        }
                        else
                        {
                            s_answer += "<li><input id=\"dan\" name=\"dan\" type=\"radio\" class=\"\" value=\"" + ((char)(tip + j)).ToString() + "\"/>" + (char)(tip + j) + ".&nbsp;&nbsp;" + choises[j] + "</li>";
                        }
                    }
                    if (ds_finish.Tables[0].Rows.Count > 0)
                    {
                        s_answer += "<li><input id=\"tk\" name=\"tk\" type=\"text\" class=\"\" value=\"" + ds_finish.Tables[0].Rows[0]["blank"].ToString() + "\" size=\"50\"  maxlength=\"60\" /></li>";
                    }
                    else
                    {
                        s_answer += "<li><input id=\"tk\" name=\"tk\" type=\"text\" class=\"\" value=\"\" size=\"50\"  maxlength=\"60\" /></li>";
                    }
                    break;

                //多选
                case 3:
                    choise = ds.Tables[0].Rows[0]["q_choise"].ToString();
                    choises = choise.Split('|');
                    for (int j = 0; j < choises.Length; j++)
                    {
                        if (ds_finish.Tables[0].Rows.Count > 0)
                        {
                            int pos = ds_finish.Tables[0].Rows[0]["choises"].ToString().IndexOf((char)(tip + j));
                            if (pos >= 0)
                            {
                                s_answer += "<li><input id=\"duo\" name=\"duo\" type=\"checkbox\" checked=\"checked\" class=\"\" value=\"" + ((char)(tip + j)).ToString() + "\"/>" + (char)(tip + j) + ".&nbsp;&nbsp;" + choises[j] + "</li>";
                            }
                            else
                            {
                                s_answer += "<li><input id=\"duo\" name=\"duo\" type=\"checkbox\" class=\"\" value=\"" + ((char)(tip + j)).ToString() + "\"/>" + (char)(tip + j) + ".&nbsp;&nbsp;" + choises[j] + "</li>";
                            }
                        }
                        else
                        {
                            s_answer += "<li><input id=\"duo\" name=\"duo\" type=\"checkbox\" class=\"\" value=\"" + ((char)(tip + j)).ToString() + "\"/>" + (char)(tip + j) + ".&nbsp;&nbsp;" + choises[j] + "</li>";
                        }
                    }
                    break;

                //多选+填空
                case 4:
                    choise = ds.Tables[0].Rows[0]["q_choise"].ToString();
                    choises = choise.Split('|');
                    for (int j = 0; j < choises.Length; j++)
                    {
                        if (ds_finish.Tables[0].Rows.Count > 0)
                        {
                            int pos = ds_finish.Tables[0].Rows[0]["choises"].ToString().IndexOf((char)(tip + j));
                            if (pos >= 0)
                            {
                                s_answer += "<li><input id=\"duo\" name=\"duo\" type=\"checkbox\" checked=\"checked\" class=\"\" value=\"" + ((char)(tip + j)).ToString() + "\"/>" + (char)(tip + j) + ".&nbsp;&nbsp;" + choises[j] + "</li>";
                            }
                            else
                            {
                                s_answer += "<li><input id=\"duo\" name=\"duo\" type=\"checkbox\" class=\"\" value=\"" + ((char)(tip + j)).ToString() + "\"/>" + (char)(tip + j) + ".&nbsp;&nbsp;" + choises[j] + "</li>";
                            }
                        }
                        else
                        {
                            s_answer += "<li><input id=\"duo\" name=\"duo\" type=\"checkbox\" class=\"\" value=\"" + ((char)(tip + j)).ToString() + "\"/>" + (char)(tip + j) + ".&nbsp;&nbsp;" + choises[j] + "</li>";
                        }
                    }
                    if (ds_finish.Tables[0].Rows.Count > 0)
                    {
                        s_answer += "<li><input id=\"tk\" name=\"tk\" type=\"text\" class=\"\" value=\"" + ds_finish.Tables[0].Rows[0]["blank"].ToString() + "\" size=\"50\"  maxlength=\"60\" /></li>";
                    }
                    else
                    {
                        s_answer += "<li><input id=\"tk\" name=\"tk\" type=\"text\" class=\"\" value=\"\" size=\"50\"  maxlength=\"60\" /></li>";
                    }
                    break;

                //多行填空
                case 5:
                    if (ds_finish.Tables[0].Rows.Count > 0)
                    {
                        s_answer += "<li><textarea id=\"dtk\" name=\"dtk\" cols=\"50\" rows=\"5\">" + ds_finish.Tables[0].Rows[0]["blank"].ToString() + "</textarea></li>";
                    }
                    else
                    {
                        s_answer += "<li><textarea id=\"dtk\" name=\"dtk\" cols=\"50\" rows=\"5\"></textarea></li>";
                    }
                    break;

                //填空+收集
                case 6:
                    if (ds_finish.Tables[0].Rows.Count > 0)
                    {
                        s_answer += "<li><input id=\"tk\" name=\"tk\" type=\"text\" class=\"\" value=\"" + ds_finish.Tables[0].Rows[0]["blank"].ToString() + "\" size=\"50\"  maxlength=\"60\" /></li>";
                    }
                    else
                    {
                        s_answer += "<li><input id=\"tk\" name=\"tk\" type=\"text\" class=\"\" value=\"\" size=\"50\"  maxlength=\"60\" /></li>";
                    }
                    break;
                //填空+写入
                case 7:
                    if (ds_finish.Tables[0].Rows.Count > 0)
                    {
                        s_answer += "<li><input id=\"tk\" name=\"tk\" type=\"text\" class=\"\" value=\"" + ds_finish.Tables[0].Rows[0]["blank"].ToString() + "\" size=\"50\"  maxlength=\"60\" /></li>";
                    }
                    else
                    {
                        s_answer += "<li><input id=\"tk\" name=\"tk\" type=\"text\" class=\"\" value=\"\" size=\"50\"  maxlength=\"60\" /></li>";
                    }
                    break;

                default: break;
            }

            outstr += s_answer;
            outstr += "</ul></div></div>";

            btn_submit.Visible = false;
            btn_submit.Enabled = true;
            if(i>=tcount)
            {
                btn_next.Visible = false;
                btn_submit.Visible = true;
            }
            else
            {
                btn_next.Visible = true;
            }

            if (i <= 1)
            {
                btn_pre.Visible = false;
            }
            else
            {
                btn_pre.Visible = true;                
            }
        }
     }

    protected void btn_pre_Click(object sender, EventArgs e)
    {
        save_answer();
        initQuestions(pid - 1);
        q_order.Value = (pid - 1).ToString();
    }
    protected void btn_next_Click(object sender, EventArgs e)
    {
        save_answer();
        initQuestions(pid+1);
        q_order.Value = (pid + 1).ToString();
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        save_answer();
        initQuestions(pid);
        q_order.Value = pid.ToString();
        btn_submit.Text = "已提交";
        btn_submit.Enabled = false;
    }

    public void save_answer()
    {
        //先检查该题是否已做
        HttpCookie hc = Request.Cookies["u_id"];
        string uid = hc.Value;
        DataSet ds_finish = DBHelper.sqlMethod("select * from t_毕业生问卷结果 where user_id=" + uid + " and q_id=" + pid.ToString());

        string sql="";
        bool eSQL = true;

        if (ds_finish.Tables[0].Rows.Count > 0)
        {
            switch (qtype)
            {
                case 0:
                    sql = "update t_毕业生问卷结果 set choises='" + Request.Form["dan"] + "' where user_id=" + uid + " and q_id=" + pid.ToString();
                    break;
                case 1:
                    sql = "update t_毕业生问卷结果 set blank='" + Request.Form["tk"] + "' where user_id=" + uid + " and q_id=" + pid.ToString();
                    break;
                case 2:
                    sql = "update t_毕业生问卷结果 set blank='" + Request.Form["tk"] + "',choises='" + Request.Form["dan"] + "' where user_id=" + uid + " and q_id=" + pid.ToString();
                    break;
                case 3:
                    if(Request.Form["duo"]!=null)
                    {
                        sql = "update t_毕业生问卷结果 set choises='" + Request.Form["duo"].Replace(',', '|') + "' where user_id=" + uid + " and q_id=" + pid.ToString();
                    }
                    else
                    {
                        sql = "update t_毕业生问卷结果 set choises='' where user_id=" + uid + " and q_id=" + pid.ToString();
                    }
                    break;
                case 4:
                    if (Request.Form["duo"] != null)
                    {
                        sql = "update t_毕业生问卷结果 set blank='" + Request.Form["tk"] + "',choises='" + Request.Form["duo"].Replace(',', '|') + "' where user_id=" + uid + " and q_id=" + pid.ToString();
                    }
                    else
                    {
                        sql = "update t_毕业生问卷结果 set blank='" + Request.Form["tk"] + "',choises='' where user_id=" + uid + " and q_id=" + pid.ToString();
                    }
                    break;
                case 5:
                    sql = "update t_毕业生问卷结果 set blank='" + Request.Form["dtk"] + "' where user_id=" + uid + " and q_id=" + pid.ToString();
                    break;
                case 6:
                    HttpCookie cok = Request.Cookies["u_c"];
                    cok.Value += "|" + Request.Form["tk"];
                    Response.AppendCookie(cok);
                    eSQL = false;
                    break;
                case 7:
                    //sql = "insert into t_问卷结果(user_id,q_id,blank) values(" + uid + "," + pid.ToString() + ",'" + Request.Form["dtk"] + "')";
                    break;
                default: break;
            }
        }
        else
        {
            switch (qtype)
            {
                case 0:
                    sql = "insert into t_毕业生问卷结果(user_id,q_id,choises) values(" + uid + "," + pid.ToString() + ",'" + Request.Form["dan"] + "')";
                    break;
                case 1:
                    sql = "insert into t_毕业生问卷结果(user_id,q_id,blank) values(" + uid + "," + pid.ToString() + ",'" + Request.Form["tk"] + "')";
                    break;
                case 2:
                    sql = "insert into t_毕业生问卷结果(user_id,q_id,choises,blank) values(" + uid + "," + pid.ToString() + ",'" + Request.Form["dan"] + "','" + Request.Form["tk"] + "')";
                    break;
                case 3:
                    if (Request.Form["duo"] != null)
                    {
                        sql = "insert into t_毕业生问卷结果(user_id,q_id,choises) values(" + uid + "," + pid.ToString() + ",'" + Request.Form["duo"].Replace(',', '|') + "')";
                    }
                    else
                    {
                        sql = "insert into t_毕业生问卷结果(user_id,q_id,choises) values(" + uid + "," + pid.ToString() + ",'')";
                    }                    
                    break;
                case 4:
                    if (Request.Form["duo"] != null)
                    {
                        sql = "insert into t_毕业生问卷结果(user_id,q_id,choises,blank) values(" + uid + "," + pid.ToString() + ",'" + Request.Form["duo"].Replace(',', '|') + "','" + Request.Form["tk"] + "')";
                    }
                    else
                    {
                        sql = "insert into t_毕业生问卷结果(user_id,q_id,choises,blank) values(" + uid + "," + pid.ToString() + ",'','" + Request.Form["tk"] + "')";
                    }
                    break;
                case 6:
                    HttpCookie cok = Request.Cookies["u_c"];
                    cok.Value += "|" + Request.Form["tk"];
                    Response.AppendCookie(cok);
                    eSQL = false;
                    break;
                case 7:
                    HttpCookie c = Request.Cookies["u_c"];
                    string str_cook = c.Value;
                    string[] s_c = str_cook.Split('|');
                    sql = "insert into t_stu(user_name,user_sno,user_pass,user_classid,user_professional,user_college,user_app)";
                    sql += " values('" + s_c[1] + "','" + s_c[2] + "','" + MD5.getMD5(s_c[2]) + "',89,'" + s_c[3] + Request.Form["tk"] + "','信息工程学院',18)";
                    int y = DBHelper.sqlMethodNoDataset(sql);
                    sql="select * from t_stu where user_name='"+s_c[1]+"'";
                    string z = DBHelper.sqlMethod(sql).Tables[0].Rows[0]["user_id"].ToString();
                    HttpCookie c2 = Request.Cookies["u_id"];
                    c2.Value = z;
                    Response.AppendCookie(c2);
                    //Response.Write("<script>alert('" + z.ToString() + "');</script>");
                    eSQL = false;
                    break;
                default: break;
            }
        }
        if(eSQL)
        {
            int x = DBHelper.sqlMethodNoDataset(sql);
        }
    }
    
}
