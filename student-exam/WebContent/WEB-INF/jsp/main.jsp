<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

	<link rel="stylesheet" href="${APP_PATH }/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${APP_PATH }/css/font-awesome.min.css">
	<link rel="stylesheet" href="${APP_PATH }/css/main.css">
	<style>
	.tree li {
        list-style-type: none;
		cursor:pointer;
	}
	.tree-closed {
	    height : 40px;
	}
	.tree-expanded {
	    height : auto;
	}
	</style>
  </head>

  <body>
	<%@ include file="/WEB-INF/jsp/common/resetPass.jsp" %>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <div><a class="navbar-brand" style="font-size:32px;" href="#">学生成绩管理 - 控制面板</a></div>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
          	<%--静态包含 --%>
            <%@ include file="/WEB-INF/jsp/tag.jsp" %>
          </ul>
          <form class="navbar-form navbar-right">
            <!-- <input type="text" class="form-control" placeholder="查询"> -->
          </form>
        </div>
      </div>
    </nav>
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
			<div class="tree">
				<jsp:include page="/WEB-INF/jsp/common/menu.jsp"></jsp:include>
			</div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">控制面板</h1>

          <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/sky" src="${APP_PATH }/img/123.png" style="width:200px;height:200px" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>格言</h4>
             <span class="text-muted">求知是一种快乐,好奇心知识的萌芽。 ——培根</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/vine"  src="${APP_PATH }/img/123.png" style="width:200px;height:200px" class="img-responsive" alt="Generic placeholder thumbnail">
             <h4>格言</h4>
             <span class="text-muted">求知是一种快乐,好奇心知识的萌芽。 ——培根</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/sky"  src="${APP_PATH }/img/123.png" style="width:200px;height:200px" class="img-responsive" alt="Generic placeholder thumbnail">
            <h4>格言</h4>
             <span class="text-muted">求知是一种快乐,好奇心知识的萌芽。 ——培根</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/vine"  src="${APP_PATH }/img/123.png" style="width:200px;height:200px" class="img-responsive" alt="Generic placeholder thumbnail">
          		 <h4>格言</h4>
             <span class="text-muted">求知是一种快乐,好奇心知识的萌芽。 ——培根</span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script src="${APP_PATH }/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH }/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH }/script/docs.min.js"></script>
	<script type="text/javascript" src="${APP_PATH }/jquery/layer/layer.js"></script>
	 <script type="text/javascript" src="${APP_PATH }/script/respass.js"></script>
	
	 
        <script type="text/javascript">
            $(function () {
			    $(".list-group-item").click(function(){
				    if ( $(this).find("ul") ) {
						$(this).toggleClass("tree-closed");
						if ( $(this).hasClass("tree-closed") ) {
							$("ul", this).hide("fast");
						} else {
							$("ul", this).show("fast");
						}
					}
				});
            });
            
            function resetPass(){
            	$("#exampleModal1").modal("show");
            }
           	
           	function dosubmit(){
           		var old_password = $("#old_password")
           		var new_password = $("#new_password")
           		if($.trim(old_password.val()) == ""){
    	    		//alert("用户名不能为空"); 
    	    		layer.msg("旧密码不能为空", {time:1000, icon:5, shift:6}, function(){
    	    			old_password.val("");
    	    			old_password.focus();
    	    		});    		
    	    		return false;
    	    	}
    	    	if($.trim(new_password.val()) == ""){     
    	    		layer.msg("新密码不能为空", {time:1000, icon:5, shift:6}, function(){
    	    			new_password.val("");
    	    			new_password.focus();
    	    		});
    	    		
    	    		return false;
    	    	}
    	    	$.ajax({
    	    		url:"${APP_PATH}/resetManagerPass.do",
    	    		type:"POST",
    	    		data:{
    	    			old_password:$.trim(old_password.val()),
    	    			new_password:$.trim(new_password.val()),
    	    		},
    	    		success : function(res){
    	    			alert(res.message)
    	    			old_password.val("");
    	    			new_password.val("");
    	    			if(res.success){
    	    				$("#exampleModal1").modal("hide");
    	    			}
    	    		}
    	    	})
           	}
                     
        </script>
  </body>
</html>
