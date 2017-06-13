/** index.js By Beginner Emain:zheng_jinfan@126.com HomePage:http://www.zhengjinfan.cn */
layui.config({
	base: 'js/'
}).use(['element', 'layer', 'navbar', 'tab'], function() {
	var element = layui.element(),
		$ = layui.jquery,
		layer = layui.layer,
		navbar = layui.navbar(),
		tab = layui.tab({
			elem: '.admin-nav-card' //璁剧疆閫夐」鍗″鍣?
		});
	//iframe鑷€傚簲
	$(window).on('resize', function() {
		var $content = $('.admin-nav-card .layui-tab-content');
		$content.height($(this).height() - 147);
		$content.find('iframe').each(function() {
			$(this).height($content.height());
		});
	}).resize();

	//璁剧疆navbar
	navbar.set({
		spreadOne: true,
		elem: '#admin-navbar-side',
		cached: true,
		data: navs
			/*cached:true,
			url: 'datas/nav.json'*/
	});
	//娓叉煋navbar
	navbar.render();
	//鐩戝惉鐐瑰嚮浜嬩欢
	navbar.on('click(side)', function(data) {
		tab.tabAdd(data.field);
	});

	$('.admin-side-toggle').on('click', function() {
		var sideWidth = $('#admin-side').width();
		if(sideWidth === 200) {
			$('#admin-body').animate({
				left: '0'
			}); //admin-footer
			$('#admin-footer').animate({
				left: '0'
			});
			$('#admin-side').animate({
				width: '0'
			});
		} else {
			$('#admin-body').animate({
				left: '200px'
			});
			$('#admin-footer').animate({
				left: '200px'
			});
			$('#admin-side').animate({
				width: '200px'
			});
		}
	});

	//閿佸睆
	$(document).on('keydown', function() {
		var e = window.event;
		if(e.keyCode === 76 && e.altKey) {
			//alert("浣犳寜涓嬩簡alt+l");
			lock($, layer);
		}
	});
	$('#lock').on('click', function() {
		lock($, layer);
	});

	//鎵嬫満璁惧鐨勭畝鍗曢€傞厤
	var treeMobile = $('.site-tree-mobile'),
		shadeMobile = $('.site-mobile-shade');
	treeMobile.on('click', function() {
		$('body').addClass('site-mobile');
	});
	shadeMobile.on('click', function() {
		$('body').removeClass('site-mobile');
	});
});

function lock($, layer) {
	//鑷畾椤?
	layer.open({
		title: false,
		type: 1,
		closeBtn: 0,
		anim: 6,
		content: $('#lock-temp').html(),
		shade: [0.9, '#393D49'],
		success: function(layero, lockIndex) {

			//缁欐樉绀虹敤鎴峰悕璧嬪€?
			layero.find('div#lockUserName').text('admin');
			layero.find('input[name=lockPwd]').on('focus', function() {
					var $this = $(this);
					if($this.val() === '杈撳叆瀵嗙爜瑙ｉ攣..') {
						$this.val('').attr('type', 'password');
					}
				})
				.on('blur', function() {
					var $this = $(this);
					if($this.val() === '' || $this.length === 0) {
						$this.attr('type', 'text').val('杈撳叆瀵嗙爜瑙ｉ攣..');
					}
				});
			//鍦ㄦ澶勫彲浠ュ啓涓€涓姹傚埌鏈嶅姟绔垹闄ょ浉鍏宠韩浠借璇侊紝鍥犱负鑰冭檻鍒板鏋滄祻瑙堝櫒琚己鍒跺埛鏂扮殑鏃跺€欙紝韬唤楠岃瘉杩樺瓨鍦ㄧ殑鎯呭喌			
			//do something...
			//e.g. 
			/*
			 $.post(url,params,callback,'json');
			 */
			//缁戝畾瑙ｉ攣鎸夐挳鐨勭偣鍑讳簨浠?
			layero.find('button#unlock').on('click', function() {
				var $lockBox = $('div#lock-box');

				var userName = $lockBox.find('div#lockUserName').text();
				var pwd = $lockBox.find('input[name=lockPwd]').val();
				if(pwd === '杈撳叆瀵嗙爜瑙ｉ攣..' || pwd.length === 0) {
					layer.msg('璇疯緭鍏ュ瘑鐮?.', {
						icon: 2,
						time: 1000
					});
					return;
				}
				unlock(userName, pwd);
			});
			/**
			 * 瑙ｉ攣鎿嶄綔鏂规硶
			 * @param {String} 鐢ㄦ埛鍚?
			 * @param {String} 瀵嗙爜
			 */
			var unlock = function(un, pwd) {
				//杩欓噷鍙互浣跨敤ajax鏂规硶瑙ｉ攣
				/*$.post('api/xx',{username:un,password:pwd}},function(data){
				 	//楠岃瘉鎴愬姛
					if(data.success){
						//鍏抽棴閿佸睆灞?
						layer.close(lockIndex);
					}else{
						layer.msg('瀵嗙爜杈撳叆閿欒..',{icon:2,time:1000});
					}					
				},'json');
				*/

				//婕旂ず锛氶粯璁よ緭鍏ュ瘑鐮侀兘绠楁垚鍔?
				//鍏抽棴閿佸睆灞?
				layer.close(lockIndex);
			};
		}
	});
};