<%@ Page Language="C#" AutoEventWireup="true" CodeFile="changeMovie.aspx.cs" Inherits="admin_changeMovie" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <title>添加视频</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin: 15px;">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
            <legend>添加视频</legend>
        </fieldset>
        <form class="layui-form">
            <div class="layui-form-item">
                <label class="layui-form-label">
                    视频名称</label>
                <div class="layui-input-block">
                    <input type="text" name="title" autocomplete="off" placeholder="请输入视频标题" class="layui-input"
                        id="movie_name">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">
                    图片链接</label>
                <div class="layui-input-block">
                    
                    <asp:FileUpload ID="FileUpload1" runat="server" />&nbsp;&nbsp;<asp:Button ID="Button2"
                        runat="server" Text="上传" OnClick="Button2_Click" />
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                    <asp:Label ID="Label3" runat="server"></asp:Label>
                    <asp:Image ID="Image1" runat="server" Width="80" Height="120" /></div>
            </div>
            
            <div class="layui-form-item" style="margin-top: 13px;">
                <label class="layui-form-label">
                    选择分类</label>
                <div class="layui-input-block">
                    &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="tname" DataValueField="id">
                    </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:moviesConnectionString %>"
                        SelectCommand="SELECT [tname], [id] FROM [types]"></asp:SqlDataSource>
                    &nbsp;
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">
                    发布日期</label>
                <div class="layui-input-block">
                    <input type="text" name="date" id="date" placeholder="2018-01-01" autocomplete="off"
                        class="layui-input" onclick="layui.laydate({elem: this})">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">
                    影片导演</label>
                <div class="layui-input-block">
                    <input type="text" name="" autocomplete="off" class="layui-input" id="movie_people">
                </div>
            </div>
            
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="addMovie" onclick="updateMovieDetail();">
                        立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
    </form>

    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>

    <script src="../js/jquery.min.js"></script>

    <script type="text/javascript" src="plugins/layui/layui.js"></script>

    <script>
			layui.use(['form', 'layedit', 'laydate'], function() {
				var form = layui.form(),
					layer = layui.layer,
					layedit = layui.layedit,
					laydate = layui.laydate;

				//创建一个编辑器
				var editIndex = layedit.build('LAY_demo_editor');
				//自定义验证规则
				form.verify({
					title: function(value) {
						if(value.length < 5) {
							return '标题至少得5个字符啊';
						}
					},
					pass: [/(.+){6,12}$/, '密码必须6到12位'],
					content: function(value) {
						layedit.sync(editIndex);
					}
				});

				//监听提交
				form.on('submit(addMovie)', function(data) {
//					layer.alert(JSON.stringify(data.field), {
//						title: '最终的提交信息'
//					})
					// 1 先获取文本框的数据
	        var movie_name=$('#movie_name').val();
	        var movie_img=$('#Label3').html();

	        var movie_type=$('#DropDownList1').val();
	        var date=$('#date').val();
	        var movie_people=$('#movie_people').val();

	        
	        // 2 组装好送往后台的json数据
            var _json = jQuery.param({ "movie_name": movie_name, "movie_img": movie_img ,"movie_type": movie_type ,"date": date ,"movie_people": movie_people });  
            
            // 3 指定送向后台哪个处理程序以及传送的方式，并传送
            $.ajax({  
                url: "../admin/api/addMovie.ashx",  
                type: "POST",  
                async: false,  
                data: _json, //不能直接写成 {id:"123",code:"tomcat"}  
                dataType: "json",  
                // contentType: "charset=utf-8",  
                cache: false,  
                
             //4 接受返回过来的数据，同样是json格式的，根据返回过来的数据给出相应的提示或操作
                success: function (data) {  
                    var json=data;
                    
                    //返回过来的是1 表示插入成功了
                     if(json.r=="1")
                     {
                        //提示插入成功
                         //alert(movie_img + movie_url + LAY_demo_editor);
                     }
                     //否则则是插入失败了
                     else
                     {
                         //alert("提交失败！");
                     }
                },  
                error: function (XMLHttpRequest, textStatus, errorThrown) { alert(XMLHttpRequest.readyState); }  
            });
          //  location.reload(true);
//            loadLessonVideo();
				   // alert("fsadfsda");
					return false;
				});
			
			});
			
			
			function loadMovieInfo() {
      var _json = jQuery.param({ "id": GetQueryString("id") });
        var request = $.ajax({
            url: "../admin/api/loadMovieDetail.ashx",
            type: "POST",
            async: false,
            data: _json, //不能直接写成 {id:"123",code:"tomcat"}  
            dataType: "json",
            // contentType: "charset=utf-8",  
            cache: false,

            //4 接受返回过来的数据，同样是json格式的，根据返回过来的数据给出相应的提示或操作
            success: function (data) {
                var json = data;

                //返回过来的是1 表示插入成功了
                if (json.r == "0") {
                    //提示插入成功
                    
                }
                    //否则则是插入失败了
                else {

                    
                    displayMovieInfo(json.data);
//                    displayMovieSearch(json.data);
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) { alert(XMLHttpRequest.readyState); }
        });
    }

    function displayMovieInfo(data) {
        
       
       $.each(data, function (index, item) {
            //循环获取数据  
            $("#movie_name").val(item.mname);
        $("#Label3").html(item.img);
        $("#DropDownList1").val(item.tname);
        $("#date").val(item.onlinetime);
        $("#movie_people").val(item.maker);
            

        });

        //显示在页面上
//        $("#movie_name").val(item.mname);
//        $("#Label3").html(item.img);
//        $("#DropDownList1").val(item.tname);
//        $("#date").val(item.onlinetime);
//        $("#movie_people").val(item.maker);
        

    }
    
    function GetQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return "1";
    }
    
      function updateMovieDetail() {

        // 1 先获取文本框的数据

        var movie_name=$('#movie_name').val();
	        var movie_img=$('#Label3').html();

	        var movie_type=$('#DropDownList1').val();
	        var date=$('#date').val();
	        var movie_people=$('#movie_people').val();
        

        // 2 组装好送往后台的json数据
        var _json = jQuery.param({ "id": GetQueryString("id"),"movie_name": movie_name, "movie_img": movie_img ,"movie_type": movie_type ,"date": date ,"movie_people": movie_people  });

        // 3 指定送向后台哪个处理程序以及传送的方式，并传送
        var request = $.ajax({
            url: "../admin/api/changeMovieInfo.ashx",
            type: "POST",
            async: false,
            data: _json, //不能直接写成 {id:"123",code:"tomcat"}  
            dataType: "json",
            // contentType: "charset=utf-8",  
            cache: false,

            //4 接受返回过来的数据，同样是json格式的，根据返回过来的数据给出相应的提示或操作
            success: function (data) {
                var json = data;

                //返回过来的是1 表示插入成功了
                if (json.r == "1") {
                    //提示插入成功
                    //alert("success!!");
                    
                }
                    //否则则是插入失败了
                else {
                    //alert("fall!!");
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) { alert(XMLHttpRequest.readyState); }
        });
        location.reload(true);
        //            loadLessonVideo();
    }
    
	loadMovieInfo();
    
    </script>
</body>
</html>
