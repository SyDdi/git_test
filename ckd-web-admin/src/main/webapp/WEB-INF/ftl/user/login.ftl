<!DOCTYPE html>
<html lang="zh-cn">
    <head>
        <meta charset="utf-8">
        <title>Shiro Demo | 登录</title>
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />

        <!-- CSS -->
        <link rel="stylesheet" href="${basePath}/css/common/reset.css">
        <link rel="stylesheet" href="${basePath}/css/common/supersized.css">
        <link rel="stylesheet" href="${basePath}/css/common/style.css"/>
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://static.supportfolios.com/js/www/html5shiv.js"></script>
        <![endif]-->
		<style>
			canvas{position: fixed; top: 0px; left: 0px; }
		</style>
    </head>

    <body id="body">
        <div class="page-container">
            <h1>登录</h1>
            <form id="_form" action="" method="post">
                <input type="text" name="account" class="username" placeholder="用户名">
                <input type="password" name="password" class="password" placeholder="密码">
                <div style="text-align: left; margin-left: 10px;">
                <label><input type="checkbox" checked="checked"  id="rememberMe"style="width: 10px; height: 10px;">记住我</label>
                </div>
                <button type="button" id="login">登录</button>
                <#--<button type="button" id="register" class="register">Register</button>-->

                <div class="error"><span>+</span></div>
            </form>
        </div>
        <!-- Javascript -->
       <script  src="${basePath}/js/common/jquery/jquery.min.js"></script>
        <script src="${basePath}/js/common/MD5.js"></script>
        <script src="${basePath}/js/common/supersized.3.2.7.min.js"></script>
        <script src="${basePath}/js/supersized-init.js"></script>
		<script  src="${basePath}/js/common/layer/layer.js"></script>
        <script >
			jQuery(document).ready(function() {
				try{
					var _href = window.location.href+"";
					if(_href && _href.indexOf('?kickout')!=-1){
						layer.msg('您已经被踢出，请重新登录！');
					}
				}catch(e){
					
				}
				//回车事件绑定
				document.onkeydown=function(event){
					var e = event || window.event || arguments.callee.caller.arguments[0];
					if(e && e.keyCode==13){ 
						$('#login').click();
					}
				}; 
			
				//登录操作
			    $('#login').click(function(){
			    	
			        var username = $('.username').val();
			        var password = $('.password').val();
			        if(username == '') {
			            $('.error').fadeOut('fast', function(){
			                $('.error').css('top', '27px').show();
			            });
			            $('.error').fadeIn('fast', function(){
			                $('.username').focus();
			            });
			            return false;
			        }
			        if(password == '') {
			            $('.error').fadeOut('fast', function(){
			                $('.error').css('top', '96px').show();
			            });
			            $(this).find('.error').fadeIn('fast', function(){
			                $('.password').focus();
			            });
			            return false;
			        }
			        var pswd = MD5(username +"#" + password),
			        	data = {pswd:pswd,email:username,rememberMe:$("#rememberMe").is(':checked')};
			        var load = layer.load();
			        $.post("${basePath}/u/submitLogin.shtml",data ,function(result){
			        	layer.close(load);
			    		if(result && result.status != 200){
			    			layer.msg(result.message,function(){});
			    			$('.password').val('');
			    			return;
			    		}else{
			    			layer.msg('登录成功！');
			    			setTimeout(function(){
			    				//登录返回
				    			window.location.href= result.back_url || "${basePath}/";
			    			},1000)
			    		}
			    	},"json");
			        
			    });
			    $('.page-container form .username, .page-container form .password').keyup(function(){
			        $(this).parent().find('.error').fadeOut('fast');
			    });
			    //注册
			    $("#register").click(function(){
			    	window.location.href="register.shtml";
			    });
			});
        </script>
    </body>

</html>

