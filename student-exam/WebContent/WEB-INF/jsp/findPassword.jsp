<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
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
  <body style="background-image: url(${APP_PATH }/img/beijing.jpg);background-size:100%;">
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <div><a class="navbar-brand" href="#" style="font-size:32px;">学生在线报名系统</a></div>
        </div>
      </div>
    </nav>

    <div class="container" style="width: 998px;">

      <form class="form-signin" role="form">
        <h2 class="form-signin-heading"><i class="glyphicon glyphicon-log-in"></i> 找回密码</h2>
		  <div class="form-group has-success has-feedback">
			<input type="text" class="form-control" id="studentNum" placeholder="请输入学号" autofocus>
			<span class="glyphicon glyphicon-send form-control-feedback"></span>
		  </div>
		  <div class="form-group has-success has-feedback">
			<input type="password" class="form-control" id="password" placeholder="请输入新密码" style="margin-top:10px;">
			<span class="glyphicon glyphicon-lock form-control-feedback"></span>
		  </div>
		  <div class="form-group has-success has-feedback">
			<input type="text" class="form-control" id="email" placeholder="请输入原邮箱地址" style="margin-top:10px;">
			<span class="glyphicon glyphicon glyphicon-envelope form-control-feedback"></span>
		  </div>
		  
		 
		  <div class="form-group has-success has-feedback" style="position:relative; width: 208px">
			<input type="text" class="form-control" id="check" placeholder="请输入验证码" style="margin-top:10px;">
			<!-- <span class="glyphicon glyphicon-lock form-control-feedback"></span> -->
			
			<img id="randomcode_img" src="${baseurl}validatecode.jsp" alt="" style="width:90px; height:40px;position:absolute;top:2px;right:-93px;"								  
				onclick = randomcode_refresh(this) />
		
        <div class="checkbox">	
		  </div>
		     <label>
            	
          </label>
          <label style="float:right">
            <a href="${APP_PATH }/login.htm">我有账号</a>
          </label>
		 
        </div>
        <a class="btn btn-lg btn-success btn-block" href="#" onclick="register()" > 提交</a>
      </form>
    </div>
    <script src="${APP_PATH }/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH }/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${APP_PATH }/jquery/layer/layer.js"></script>
    <script type="text/javascript">
    
    function register() {    	
    	var studentnum = $("#studentNum");
    	var password = $("#password"); 	
    	var email = $("#email"); 	
    	var check = $("#check"); 	
    	var name = $("#name"); 	    	
    	if($.trim(studentnum.val()) == ""){
    		//alert("用户名不能为空"); 
    		layer.msg("学号不能为空！", {time:1000, icon:5, shift:6}, function(){
    			floginacct.val("");
        		floginacct.focus();
    		});    		
    		return false;
    	}
    	if($.trim(password.val()) == ""){     
    		layer.msg("新密码不能为空！", {time:1000, icon:5, shift:6}, function(){
    			fpasspswd.val("");
        		fpasspswd.focus();
    		});    		
    		return false;
    	}   
    	
    	if($.trim(email.val()) == "" || $.trim(check.val()) == ""){
    		layer.msg("信息未填写完整！", {time:1000, icon:5, shift:6});
    		return false;
    	}
    	
    	var loadingIndex = -1;   	
    	$.ajax({
    		url : '${APP_PATH}/findPassword.do',
    		type : "POST",
    		data:{
    			loginacct:$.trim(studentnum.val()),
    			password:$.trim(password.val()),
    			email:$.trim(email.val()),
    			check:$.trim(check.val()),
    				},
    		beforeSend:function(){    			
    		loadingIndex = layer.msg('修改中', {icon: 16});   //开启提示信息   		
    			return true;
    		},
    		success:function(result){
    			
    			 layer.close(loadingIndex);//关闭提示信息    			
    			if(result.success){
    				layer.msg(result.message, {time:1000, icon:6, shift:6});
    				
    			setTimeout(function() {window.location.href = "${APP_PATH}/login.htm"; },1000);
    				    				 
    			}else{
    				layer.msg(result.message, {time:1000, icon:5, shift:6});
    				randomcode_refresh(this);
    			}
    		},
    		error:function(){//请求失败
    			layer.msg(result.message, {time:1000, icon:5, shift:6}); 
    			setTimeout(function() {window.location.href = "${APP_PATH}/register.htm"; },1000);
    		}
    	});
    	  
    }
    
  	//验证码更新
    function randomcode_refresh(obj){
		obj.src = "${baseurl}validatecode.jsp?time=" + new Date().getTime();
	}
    
    </script>
    
    
  </body>
</html>