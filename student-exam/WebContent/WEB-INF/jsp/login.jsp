<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keys" content="">
    <meta name="author" content="">
	<link rel="stylesheet" href="${APP_PATH }/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${APP_PATH }/css/font-awesome.min.css">
	<link rel="stylesheet" href="${APP_PATH }/css/login.css">
	<style>

	</style>
  </head>
  <body style="background: url(${APP_PATH }/img/beijing.jpg);background-size:100%;">
  
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <div><a class="navbar-brand" href="#" style="font-size:32px;">学生在线报名系统</a></div>
        </div>
      </div>
    </nav>

    <div class="container " style="padding-left:0px; width: 998px;"   >

      <form class="form-signin" role="form">
        <h2 class="form-signin-heading"><i class="glyphicon glyphicon-log-in"></i> 学生登录</h2>
		  <div class="form-group has-success has-feedback">
			<input type="text" class="form-control" id="studentNum" placeholder="请输入考生号" autofocus>
			<span class="glyphicon glyphicon-user form-control-feedback"></span>
		  </div>
		  <div class="form-group has-success has-feedback">
			<input type="password" class="form-control" id="password" placeholder="请输入登录密码" style="margin-top:10px;">
			<span class="glyphicon glyphicon-lock form-control-feedback"></span>
		  </div>
		  <div class="form-group has-success has-feedback">
			<select class="form-control" >
                <option value="student">学生</option>
                <option value="manager">管理</option>
            </select>
		  </div>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> 记住我
          </label>
          <br>
          <label>
            <a href="${APP_PATH }/find.htm">忘记密码</a>
          </label>
          <label style="float:right">
            <a href="${APP_PATH }/register.htm">我要注册</a>
          </label>
        </div>
        <a class="btn btn-lg btn-success btn-block" onclick="dologin()"> 登录</a>
      </form>
      
    </div>
       
    <script src="${APP_PATH }/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH }/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${APP_PATH }/jquery/layer/layer.js"></script>
    <script>
    function dologin() {
        var type = $(":selected").val();
       
        var loginacct = $("#studentNum");
    	var password = $("#password"); 	
    	
    	if($.trim(loginacct.val()) == ""){
    		//alert("用户名不能为空"); 
    		layer.msg("学号不能为空", {time:1000, icon:5, shift:6}, function(){
    			loginacct.val("");
    			loginacct.focus();
    		});    		
    		return false;
    	}
    	if($.trim(password.val()) == ""){     
    		layer.msg("密码不能为空", {time:1000, icon:5, shift:6}, function(){
    			password.val("");
    			password.focus();
    		});
    		
    		return false;
    	}   
    	
    	var loadingIndex = -1;
    	
    	$.ajax({
    		url : '${APP_PATH}/doLogin.do',
    		type : "POST",
    		data:{
    			loginacct:$.trim(loginacct.val()),
    			password:$.trim(password.val()),
    			"type":type,
    				},
    		beforeSend:function(){
    			
    		loadingIndex = layer.msg('登录中', {icon: 16});   //开启提示信息
    		
    			return true;
    		},
    		success:function(result){
    			
    			layer.close(loadingIndex);//关闭提示信息
    			
    			if(result.success){  
    				if(result.data == "student"){   					
    				 window.location.href = "${APP_PATH}/index.htm"; 
    				}else{
    					 window.location.href = "${APP_PATH}/main.htm"; 
    				}
    			}else{
    				layer.msg(result.message, {time:1000, icon:5, shift:6});
    			}
    		},
    		error:function(){//请求失败
    			layer.msg(result.message, {time:1000, icon:5, shift:6});   
    		}
    	});
    	  
    }
    </script>
  </body>
</html>