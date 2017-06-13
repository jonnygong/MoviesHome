<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addMovie.aspx.cs" Inherits="admin_addMovie" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
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
                    <!--<input type="tel" name="url" autocomplete="off" class="layui-input" id="movie_img">
                    <button class="layui-btn layui-btn-primary">
                        上传图片</button>-->
                    <asp:FileUpload ID="FileUpload1" runat="server" />&nbsp;
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="上传" />
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                    <asp:Label ID="Label3" runat="server"></asp:Label>
                    <asp:Image ID="Image1" runat="server" Width="80" Height="120" /></div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">
                    视频链接</label>
                <div class="layui-input-block">
                    <!--<input type="tel" name="url" autocomplete="off" class="layui-input" id="movie_url">-->
                    <!--<button class="layui-btn layui-btn-primary" >
                        上传视频</button>-->
                    <asp:FileUpload ID="FileUpload2" runat="server" />
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="上传" />
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                    <asp:Label ID="Label4" runat="server"></asp:Label>
                    </div>
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
            <!-- <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">
                        播放次数</label>
                    <div class="layui-input-inline">
                        <input type="number" name="number" lay-verify="number" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
						<label class="layui-form-label">验证日期</label>
						<div class="layui-input-block">
							<input type="text" name="date" id="date" lay-verify="date" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this})">
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">验证链接</label>
						<div class="layui-input-block">
							<input type="tel" name="url" lay-verify="url" autocomplete="off" class="layui-input">
						</div>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">验证身份证</label>
					<div class="layui-input-block">
						<input type="text" name="identity" lay-verify="identity" placeholder="" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">自定义验证</label>
					<div class="layui-input-inline">
						<input type="password" name="password" lay-verify="pass" placeholder="请输入密码" autocomplete="off" class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
				</div>

				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">范围</label>
						<div class="layui-input-inline" style="width: 100px;">
							<input type="text" name="price_min" placeholder="￥" autocomplete="off" class="layui-input">
						</div>
						<div class="layui-form-mid">-</div>
						<div class="layui-input-inline" style="width: 100px;">
							<input type="text" name="price_max" placeholder="￥" autocomplete="off" class="layui-input">
						</div>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">单行选择框</label>
					<div class="layui-input-block">
						<select name="interest" lay-filter="aihao">
							<option value=""></option>
							<option value="0">写作</option>
							<option value="1" selected="">阅读</option>
							<option value="2">游戏</option>
							<option value="3">音乐</option>
							<option value="4">旅行</option>
						</select>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">分组选择框</label>
					<div class="layui-input-inline">
						<select name="quiz">
							<option value="">请选择问题</option>
							<optgroup label="城市记忆">
								<option value="你工作的第一个城市">你工作的第一个城市</option>
							</optgroup>
							<optgroup label="学生时代">
								<option value="你的工号">你的工号</option>
								<option value="你最喜欢的老师">你最喜欢的老师</option>
							</optgroup>
						</select>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">行内选择框</label>
					<div class="layui-input-inline">
						<select name="quiz1">
							<option value="">请选择省</option>
							<option value="浙江" selected="">浙江省</option>
							<option value="你的工号">江西省</option>
							<option value="你最喜欢的老师">福建省</option>
						</select>
					</div>
					<div class="layui-input-inline">
						<select name="quiz2">
							<option value="">请选择市</option>
							<option value="杭州">杭州</option>
							<option value="宁波" disabled="">宁波</option>
							<option value="温州">温州</option>
							<option value="温州">台州</option>
							<option value="温州">绍兴</option>
						</select>
					</div>
					<div class="layui-input-inline">
						<select name="quiz3">
							<option value="">请选择县/区</option>
							<option value="西湖区">西湖区</option>
							<option value="余杭区">余杭区</option>
							<option value="拱墅区">临安市</option>
						</select>
					</div>
				</div> -->
            <!-- <div class="layui-form-item">
					<label class="layui-form-label">开关-关</label>
					<div class="layui-input-block">
						<input type="checkbox" name="close" lay-skin="switch" title="开关">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">开关-开</label>
					<div class="layui-input-block">
						<input type="checkbox" checked="" name="open" lay-skin="switch" lay-filter="switchTest" title="开关">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">单选框</label>
					<div class="layui-input-block">
						<input type="radio" name="sex" value="男" title="男" checked="">
						<input type="radio" name="sex" value="女" title="女">
						<input type="radio" name="sex" value="禁" title="禁用" disabled="">
					</div>
				</div>
				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">普通文本域</label>
					<div class="layui-input-block">
						<textarea placeholder="请输入内容" class="layui-textarea"></textarea>
					</div>
				</div>-->
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">
                    编辑器</label>
                <div class="layui-input-block">
                    <textarea class="layui-textarea layui-hide" name="content" lay-submit="" id="LAY_demo_editor"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="addMovie">
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
	        var movie_url=$('#Label4').html();
	        var movie_type=$('#DropDownList1').val();
	        var date=$('#date').val();
	        var movie_people=$('#movie_people').val();
	        var LAY_demo_editor=layedit.getText(editIndex);
	        
	        // 2 组装好送往后台的json数据
            var _json = jQuery.param({ "movie_name": movie_name, "movie_img": movie_img ,"movie_url": movie_url ,"movie_type": movie_type ,"date": date ,"movie_people": movie_people ,"LAY_demo_editor": LAY_demo_editor });  
            
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
			
	
    
    </script>
</body>
</html>
