<%@ Page Language="C#" MasterPageFile="~/MasterPageVideo.master" AutoEventWireup="true"
    CodeFile="video.aspx.cs" Inherits="video" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row-nav navbar" style="float: right; margin-top: -20px">
        <div class="navbar-inner">
            <form id="search" action="#" method="GET">
                <input type="text" placeholder="Enter search keywords here..." 
                    name="s">
                <a href="#"></a>
            </form>
        </div>
    </div>
    <br>
    <br>
    <div class="video_v">
        <video width="960" height="497" controls="controls" class="fl">
          <source src="<%=url %>"  type="video/mp4">
        </video>
        <div class="video_p">
            <div class="video_pin">
                <a href="">目录</a></div>
            <div class="sidehide">
            </div>
            <div class="overlay" style="display: none;">
            </div>
            <div class="video_pin">
                <a href="">笔记</a></div>
            <div class="sidehide">
            </div>
            <div class="overlay" style="display: none;">
            </div>
            <div class="video_pin">
                <a href="">收藏</a></div>
            <div class="sidehide">
            </div>
            <div class="overlay" style="display: none;">
            </div>
        </div>
    </div>
</asp:Content>
