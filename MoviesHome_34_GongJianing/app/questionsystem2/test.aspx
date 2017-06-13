<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>计算机大类问卷调查（第二次）</title>
    <!-- Main Stylesheet -->
    <link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
    
    <style type="text/css">
        #Text1
        {
            width: 214px;
        }
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <%Response.Write(outstr); %>
        <asp:Button ID="btn_pre" runat="server" Text="上一题" onclick="btn_pre_Click" />
        <asp:Button ID="btn_next" runat="server" Text="下一题" onclick="btn_next_Click" />
        <asp:Button ID="btn_submit" runat="server" Text="提交" Visible="false" 
            onclick="btn_submit_Click" />
        <asp:HiddenField ID="q_type" runat="server" />
        <asp:HiddenField ID="q_order" runat="server" />
        <asp:HiddenField ID="t_id" runat="server" />
        <asp:HiddenField ID="t_count" runat="server" />
    </div>
    </form>
</body>
</html>
