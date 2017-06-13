<%@ Page Language="C#" MasterPageFile="~/MasterPageMain.master" AutoEventWireup="true"
    CodeFile="index.aspx.cs" Inherits="index" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row-fluid">
        <div class="camera_wrap pattern_4 camera_emboss" id="camera_wrap_4">
            <div data-src="images/slide1.jpg">
                <div class="camera_caption fadeFromTop">
                    <h1>
                        栀子花开</h1>
                    <span>许诺和言蹊是大学校园里一对令人艳羡的情侣。许诺作为校内闻名的栀子花乐队的主唱和队友为成为职业出道不懈努力着，怀揣舞蹈梦想的言蹊和三位好友有机会获得出国深造的机会，就在梦想似乎触手可及的时候，现实中却遭遇到许多障碍。当言蹊面临崩溃边缘，许诺成为支持她的臂膀；为了让言蹊重新燃起希望，
                        许诺与队友决定为她准备一个意想不到的惊喜。而这个“惊喜”竟然让冲动的年轻人付出了不小的代价。。。 </span>
                </div>
            </div>
            <div data-src="images/slide2.jpg">
                <div class="camera_caption fadeFromRight">
                    <h1>
                        捉妖记</h1>
                    <span>小伙子天荫（井柏然 饰）阴差阳错地怀上了即将降世的小妖王，他被降妖天师小岚（白百何 饰）一路保护着躲过各种妖怪。虽然二人渐渐对小妖产生了感情，小岚却明白她只为把这只惹人眼红的小妖卖个好价钱，在人妖混杂的世界里，他们的命运无疑将牵动人心。
                    </span>
                </div>
            </div>
            <div data-src="images/slide3.jpg">
                <div class="camera_caption fadeFromRight">
                    <h1>
                        财神客栈</h1>
                    <span>在小小的白马城，居住着两个情投意合的好哥们儿龚少爷和巴少爷，二人携手报名当捕快，无奈虽然空有一身本领和远大志向，却只能委身厨房洗衣间，做一名任人驱使任任打骂的实习捕快。这一日，城中大户张员外家进入强梁，全家老小悉被杀害，无一幸免，家中价值连城的白玉观音也不知去向。
                    </span>
                </div>
            </div>
            <div data-src="images/slide4.jpg">
                <div class="camera_caption fadeFromRight">
                    <h1>
                        左耳</h1>
                    <span>十七岁的女孩想变坏。左耳听力不好，如果站在左边说话就听不见，这样一个不起眼而内向的“我”某天突然就暗恋上了男生许弋，而同时许弋却被绿色眼影的长裙放浪女孩黎吧啦追求到手。心碎的“我”在偶然的机会和吧啦成为朋友，也认识了吧啦真正心爱的男生——张漾。随后吧啦在一次意外中去世了，小耳朵与许弋相恋，但最终分手，张漾和蒋皎来到北京，过着极其颓废的生活，当蒋皎改名为蒋雅希走向舞台时，张漾终于与她分手。
                    </span>
                </div>
            </div>
        </div>
    </div>
    <!--111-->
    <div class="row-fluid">
        <div class="span12">
            <div class="titleborder">
                <div>
                    影院热播&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: red; font-size: 10px; font-weight: 100">今日更新<%=todayNew %></span>
                </div>
            </div>
        </div>
    </div>
    <div class="row-fluid recent-posts">
    <!--
        <div class="span3">
            <article>
				<img src="images/movies/xltfn.png" alt="" class="imgOpa">
				<div class="date">
					<span class="day">15</span>
					<span class="month">Jan</span>
				</div>
				<h4><a href="bloghome.html">夏洛特烦恼</a></h4>
				<p>
					昔日校花秋雅的婚礼正在隆重举行，学生时代暗恋秋雅的夏洛看着周围事业成功的老同学，心中泛起酸味，借着七分醉意<a href="bloghome.html" class="read-more">read more <i class="icon-angle-right"></i></a>
				</p>
				</article>
        </div>-->
        <%=hotMovies %>
    </div>
    <!--111-->
    <!--222-->
    <div class="row-fluid">
        <div class="span12">
            <div class="titleborder">
                <div>
                    精彩连轴看&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: red; font-size: 10px; font-weight: 100">今日更新<%=todayNew %></span>
                </div>
            </div>
        </div>
    </div>
    <div class="row-fluid recent-posts">
        <!--<div class="span3">
            <article>
				<img src="images/movies/yznaw.png" alt="" class="imgOpa">
				<div class="date">
					<span class="day">6</span>
					<span class="month">Feb</span>
				</div>
				<h4><a href="#">有种你爱我</a></h4>
				<p>建筑师左小欣渴望拥有一个只有孩子没有男人的“幸福生活”，机缘巧合结识了人气主持人査义。查义对左小欣颇有好感，却未料到“左小欣”只想要个孩子，两人生下非婚子左松松。为科学抚养，在孩子周岁时，左小欣通知了査义，此刻他才明白自己成了。。。 <a href="#" class="read-more">read more <i class="icon-angle-right"></i></a>
				</p>
			  </article>
        </div>-->
        <%=recommendMovies%>
    </div>
    <!--222-->
    <!--333-->
    <div class="row-fluid">
        <div class="span12">
            <div class="titleborder">
                <div>
                    即将上映&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: red; font-size: 10px; font-weight: 100">今日更新<%=todayNew %></span>
                </div>
            </div>
        </div>
    </div>
    <div class="row-fluid recent-posts">
        <!--<div class="span3">
            <article>
				<img src="images/movies/wwnxd.png" alt="" class="imgOpa">
				<div class="date">
					<span class="day">15</span>
					<span class="month">Jan</span>
				</div>
				<h4><a href="#">万万没想到</a></h4>
				<p>
					屌丝小妖王大锤，他生来便与常人不同，两耳尖尖，又有些小法力，总是自诩本地妖王。但让他万万没想到的是，在遇到唐僧师徒四人组后，他的命运发生了逆转，而对于唐僧师徒四人组来说，遇见王大锤也是无比郁闷的第八十二难。双方因此上演了一出相爱相杀，令人捧腹的奇幻冒险。<a href="#" class="read-more">read more <i class="icon-angle-right"></i></a>
				</p>
				</article>
        </div>-->
        <%=newMoveis%>
    </div>
</asp:Content>
