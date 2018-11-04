<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	<link rel="stylesheet" href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
	<link rel="stylesheet" href="${APP_PATH}/css/theme.css">
	<style>
#footer {
    padding: 15px 0;
    background: #fff;
    border-top: 1px solid #ddd;
    text-align: center;
}
#topcontrol {
  color: #fff;
  z-index: 99;
  width: 30px;
  height: 30px;
  font-size: 20px;
  background: #222;
  position: relative;
  right: 14px !important;
  bottom: 11px !important;
  border-radius: 3px !important;
}

#topcontrol:after {
  /*top: -2px;*/
  left: 8.5px;
  content: "\f106";
  position: absolute;
  text-align: center;
  font-family: FontAwesome;
}

#topcontrol:hover {
    color: #fff;
    background: #18ba9b;
    -webkit-transition: all 0.3s ease-in-out;
    -moz-transition: all 0.3s ease-in-out;
    -o-transition: all 0.3s ease-in-out;
    transition: all 0.3s ease-in-out;
}

.label-type, .label-status, .label-order {
    background-color: #fff;
    color: #f60;
    padding : 5px;
    border: 1px #f60 solid;
}
#typeList  :not(:first-child) {
    margin-top:20px;
}
.label-txt {
    margin:10px 10px;
    border:1px solid #ddd;
    padding : 4px;
    font-size:14px;
}
.panel {
    border-radius:0;
}

.progress-bar-default {
    background-color: #ddd;
}
	</style>
  </head>
  <body>
 <div class="navbar-wrapper">
       
      <jsp:include page="/WEB-INF/jsp/common/myNav.jsp"></jsp:include>
      
    </div>

	<div style="height: 50px;"></div>
	
    <div class="container theme-showcase" role="main">

        <div class="container">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div class="panel panel-default" >
                        <div class="panel-heading" style="text-align:center;">
                            <div class="container-fluid">
                                <div class="row clearfix">
                                    
                                    <div class="col-md-3 column">
                                        <div class="progress" style="height:50px;border-radius:0;    position: absolute;width: 75%;right:49px;">
                                          <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;height:50px;">
                                            <div style="font-size:16px;margin-top:15px;">1. 仔细阅读考生需知</div>
                                          </div>
                                        </div>
                                        <div style="right: 0;border:10px solid #ddd;border-left-color: #88b7d5;border-width: 25px;position: absolute;
                                             border-left-color: rgba(92, 184, 92, 1);
                                             border-top-color: rgba(92, 184, 92, 0);
                                             border-bottom-color: rgba(92, 184, 92, 0);
                                             border-right-color: rgba(92, 184, 92, 0);
                                        ">
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-3 column">
                                        <div class="progress" style="height:50px;border-radius:0;    position: absolute;width: 75%;right:49px;">
                                          <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;height:50px;">
                                            <div style="font-size:16px;margin-top:15px;">2. 填写考生信息</div>
                                          </div>
                                        </div>
                                        <div style="right: 0;border:10px solid #ddd;border-left-color: #88b7d5;border-width: 25px;position: absolute;
                                             border-left-color: rgba(92, 184, 92, 1);
                                             border-top-color: rgba(92, 184, 92, 0);
                                             border-bottom-color: rgba(92, 184, 92, 0);
                                             border-right-color: rgba(92, 184, 92, 0);
                                        ">
                                        </div>
                                    </div>
                                    <div class="col-md-3 column">
                                        <div class="progress" style="height:50px;border-radius:0;position: absolute;width: 75%;right:49px;">
                                          <div class="progress-bar progress-bar-default" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;height:50px;">
                                            <div style="font-size:16px;margin-top:15px;">3. 确认考生信息</div>
                                          </div>
                                        </div>
                                        <div style="right: 0;border:10px solid #ddd;border-left-color: #88b7d5;border-width: 25px;position: absolute;
                                             border-left-color: rgba(221, 221, 221, 1);
                                             border-top-color: rgba(221, 221, 221, 0);
                                             border-bottom-color: rgba(221, 221, 221, 0);
                                             border-right-color: rgba(221, 221, 221, 0);
                                        ">
                                        </div>
                                    </div>
                                    <div class="col-md-3 column">
                                        <div class="progress" style="height:50px;border-radius:0;">
                                          <div class="progress-bar progress-bar-default" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;height:50px;">
                                            <div style="font-size:16px;margin-top:15px;">4. 报名完成</div>
                                          </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
<div class="container-fluid">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<blockquote style="border-left: 5px solid #f60;color:#f60;padding: 0 0 0 20px;">
				<b>
					填写考生信息
				</b>
			</blockquote>
		</div>
	
		<div class="col-md-12 column">
			
            <form class="form-horizontal">
            	
           
							<div class="form-group">
                <label class="col-sm-2 control-label">${father.type }</label>
                <div class="col-sm-2">
                  	<select class="form-control">
                  	<c:if test="${father.id == 16 }">
                  		<option value="17">全国普通话考试</option>
                  	</c:if>
                  	<c:if test="${father.id != 16 }">
                  		<option value="0">--请选择--</option>
                  		 <c:forEach items="${typeList }" var="type">
                  		 	 <option value="${type.id }">${type.type }</option>
                  		 </c:forEach>	
                  	</c:if>
                  	                		 									 
					</select>
                </div>
              </div>
            	
              <div class="form-group">
                <label class="col-sm-2 control-label">真实姓名</label>
                <div class="col-sm-4">
                  <input type="text" class="form-control" id="realname" placeholder="请输入真实姓名">
                </div>
              </div>            
              <div class="form-group">
                <label class="col-sm-2 control-label">身份证号</label>
                <div class="col-sm-6">
                  <input type="text" class="form-control" id="cardid" placeholder="身份证号必须真实">
                </div>
              </div>            
            </form>
				</div>
			</div>
		</div>
            </div>
            <div class="panel-footer" style="text-align:center;">
                <button type="button" class="btn  btn-warning btn-lg" onclick="nextBtn()">下一步</button>
            </div>
        </div>
    </div>
</div>
</div>
        

        <div class="container" style="margin-top:20px;">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div id="footer">
                        <div class="footerNav">
                             <a rel="nofollow" href="#">关于我们</a> <a rel="nofollow" href="#">联系我们</a>
                        </div>
                        <div class="copyRight">
                            Copyright @朱梅 汪朋 版权所有
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
      
    </div>
    <script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/script/docs.min.js"></script>
    <script src="${APP_PATH}/script/back-to-top.js"></script>
    <script type="text/javascript" src="${APP_PATH }/jquery/layer/layer.js"></script>
	<script>
		$('#myTab a').click(function (e) {
		  e.preventDefault()
		  $(this).tab('show');
		})		
		function nextBtn(){	
			
			 var type = $(":selected").val();			 
	         var realname = $("#realname");
	    	 var cardid = $("#cardid"); 
	    	 
	    	 
	    	 if(type == '0'){		    		
		    		layer.msg("要考试等级必须选择！", {time:1000, icon:5, shift:6}, function(){		    			
		    		});    		
		    		return false;
		    	}
	    	 	var reg=/^[\u0391-\uFFE5]+$/; 
		    	if(!reg.test(realname.val())){		    		
		    		layer.msg("姓名格式不正确！", {time:1000, icon:5, shift:6}, function(){		    			
		    			realname.focus();
		    		});    		
		    		return false;
		    	}
		    	var reg= /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;
		    	if(!reg.test(cardid.val())){  
		    		 
		    		layer.msg("身份证号格式不正确", {time:1000, icon:5, shift:6}, function(){		    			
		    			cardid.focus();
		    		});		    		
		    		return false;
		    	}   
		    	
		    	var loadingIndex = -1;
		    	
		    	$.ajax({
		    		url : '${APP_PATH}/enroll/doUpRealInfo.do',
		    		type : "POST",
		    		data:{
		    			realname:$.trim(realname.val()),
		    			cardid:$.trim(cardid.val()),
		    			"type":type,
		    				},
		    		beforeSend:function(){
		    			
		    		loadingIndex = layer.msg('信息验证中', {icon: 16});   //开启提示信息
		    		
		    			return true;
		    		},
		    		success:function(result){
		    			
		    			layer.close(loadingIndex);//关闭提示信息
		    			
		    			if(result.success){  		    						
		    				 window.location.href = '${APP_PATH}/enroll/sureInfo.htm?id='+result.data+''; 
		    				
		    			}else{
		    				if(result.message == 400 ){
		    					window.location.href = '${APP_PATH}/enroll/refuse.htm';
		    				}		    				
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