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
	<link rel="stylesheet" href="${APP_PATH }/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${APP_PATH }/css/font-awesome.min.css">
	<link rel="stylesheet" href="${APP_PATH }/css/theme.css">
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

	</style>
  </head>
  <body>
  	<%@ include file="/WEB-INF/jsp/common/modal2.jsp"%> 
	<%@ include file="/WEB-INF/jsp/common/modal3.jsp"%> 
	<%@ include file="/WEB-INF/jsp/common/modal1.jsp"%> 
  
	<%@ include file="/WEB-INF/jsp/common/resetPass.jsp" %>
   
  <div class="navbar-wrapper">
     
     <jsp:include page="/WEB-INF/jsp/common/myNav.jsp"></jsp:include> 
    </div>
    
    
<div class="container">
	<div class="row clearfix">
		<div class="col-sm-3 col-md-3 column">
			<div class="row">
				<div class="col-md-12">
					<div class="thumbnail" style="    border-radius: 0px;">
						<img src="${APP_PATH }/img/solo.jpg" class="img-thumbnail" alt="A generic square placeholder image with a white border around it, making it resemble a photograph taken with an old instant camera">
						<div class="caption" style="text-align:center;">
							<h3>
								${sessionScope.LOGIN_Student.name }
							</h3>
							<span class="label label-success" style="cursor:pointer;" onclick="window.location.href='#'">考生号：${sessionScope.LOGIN_Student.loginacct}</span>
						</div>
					</div>
				</div>
			</div>
			<div class="list-group">			
				<div class="list-group-item active">
					我的考试信息<span class="badge"><i class="glyphicon glyphicon-chevron-right"></i></span>
				</div>
				<a href="#" id="rsp">
				<div class="list-group-item">
					修改密码<span class="badge"><i class="glyphicon glyphicon-chevron-right"></i></span>
				</div>
				</a>
			</div>
		</div>
            <div class="col-sm-9 col-md-9 column">
              <ul id="myTab" style="" class="nav nav-pills" role="tablist">
                <li role="presentation" class="active"><a href="#home" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">我的考试信息</a></li>         
              </ul>
              <div id="myTabContent" class="tab-content" style="margin-top:10px;">
                  <div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">
                  
                        <ul id="myTab1" class="nav nav-tabs">
                          <li role="presentation" class="active"><a href="#support">已报名考试科目</a></li>
                          <li role="presentation"><a href="#attension">考试科目记录</a></li>
                                                
                        </ul>                  
                        <div id="myTab1" class="tab-content" style="margin-top:10px;">
                            <div role="tabpanel" class="tab-pane fade active in" id="support" aria-labelledby="home-tab">
                                <div class="container-fluid">
                                    <div class="row clearfix">
                                      
                                        <div class="col-md-12 column" style="margin-top:10px;padding:0;">
                                            <table class="table table-bordered" style="text-align:center;">
                                              <thead>
                                                <tr style="background-color:#ddd;">
                                                  <td>报名科目</td>
                                                  <td width="90">报名日期</td>
                                                  <td width="120">报名等级</td>
                                                  <td width="120">真实姓名</td>
                                                  <td width="80">考试状态</td>                                                  
                                                  <td width="80">操作</td>                                                  
                                                </tr>
                                              </thead>
                                              <tbody>                                               
                                            <c:forEach items="${baomingList }" var="biaoming">
                                               	<tr>
                                               	
                                                  <td style="vertical-align:middle;">
                                                    <div class="thumbnail">
                                                        <div class="caption">
                                                            <h5>
                                                                	<c:if test="${biaoming.pid == 1 }">
                                                                		英语考试等级
                                                                	</c:if>
                                                                	<c:if test="${biaoming.pid == 6 }">
                                                                		计算机二级考试科目
                                                                	</c:if>
                                                                	<c:if test="${biaoming.pid == 16 }">
                                                                		全国普通话考试
                                                                	</c:if>
                                                            </h5>                                                                                                                                                                         
                                                        </div>
                                                    </div>
                                                  </td>
                                                  <td style="vertical-align:middle;">${biaoming.baotime }</td>
                                                 
                                                  	<c:if test="${biaoming.pid == 16 }">
                                                  	 <td style="vertical-align:middle;"> </td>
                                                  	</c:if>
                                                  	<c:if test="${biaoming.pid != 16 }">
                                                  	 <td style="vertical-align:middle;"> ${biaoming.type }</td>
                                                  	</c:if>
                                                  
                                                  <td style="vertical-align:middle;">${biaoming.realname }</td>
                                                  <td style="vertical-align:middle;"><span style="color: red;">已报名</span></td> 
                                                  <td style="vertical-align:middle;"><button onclick="deleteExam(${biaoming.id})" style="width:80px">取消报名</button> </td>                                                        
                                                </tr>
                                            </c:forEach>
                                              </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div role="tabpanel" class="tab-pane fade" id="attension" aria-labelledby="attension-tab">
                                <div class="container-fluid">
                                    <div class="row clearfix">
                                        <div class="col-md-12 column" style="padding:0;">
                                                   <table class="table table-bordered" style="text-align:center;">
                                              <thead>
                                                <tr style="background-color:#ddd;">
                                                  <td>考试科目</td>
                                                  <td width="90">考试日期</td>
                                                  <td width="120">考试分数</td>
                                                  <td width="120">考试成绩</td>
                                                  <td width="80">考试等级</td>
                                                  <td width="80">考试状态</td>                                                  
                                                  <td width="80">操作</td>                                                  
                                                </tr>
                                              </thead>
                                              <tbody>
                                                
                                                <c:forEach items="${gradeList }" var="grade">
                                                <tr>
                                               	<td style="vertical-align:middle;">
                                                    <div class="thumbnail">
                                                        <div class="caption">
                                                            <h5>
                                                            <c:if test="${grade.pid == 1 }">
                                                                		英语考试等级
                                                                	</c:if>
                                                                	<c:if test="${grade.pid == 6 }">
                                                                		计算机二级考试科目
                                                                	</c:if>
                                                                	<c:if test="${grade.pid == 16 }">
                                                                		全国普通话考试
                                                                	</c:if>                                                                	                                                               
                                                            </h5>                                                                                                                                                                         
                                                        </div>
                                                    </div>
                                                  </td>
                                                  <td style="vertical-align:middle;">${grade.baotime }</td>                                           
                                                  <td style="vertical-align:middle;">${grade.mark }</td>                                           
                                               
                                               		<c:if test="${grade.pid != 16 }">
                                               			<td style="vertical-align:middle;">参考具体分数</td>
                                               		</c:if>
                                               
                                                  	<c:if test="${grade.pid == 16 }">
                                                  		<c:if test="${grade.mark < 60}">
                                                  			 	<td style="vertical-align:middle;">不及格</td>
                                                  		</c:if>
                                                  		<c:if test="${grade.mark < 70 && grade.mark >=60 }">
                                                  			<td style="vertical-align:middle;">三级乙等</td>
                                                  		</c:if>
                                                  		
                                                  		<c:if test="${grade.mark < 80 && grade.mark >=70 }">
                                                  			<td style="vertical-align:middle;">三级甲等</td>
                                                  		</c:if>
                                                  		
                                                  		<c:if test="${grade.mark < 87 && grade.mark >=80 }">
                                                  			<td style="vertical-align:middle;">二级乙等</td>
                                                  		</c:if>
                                                  		<c:if test="${grade.mark < 92 && grade.mark >=87 }">
                                                  			<td style="vertical-align:middle;">二级甲等</td>
                                                  		</c:if>
                                                  		
                                                  		<c:if test="${grade.mark < 97 && grade.mark >=92 }">
                                                  			<td style="vertical-align:middle;">一级乙等</td>
                                                  		</c:if>
                                                  		
                                                  		<c:if test="${grade.mark >= 97 }">
                                                  			<td style="vertical-align:middle;">一级甲等</td>
                                                  		</c:if>
                                                  		
                                                  		
                                                  	</c:if>
                                                  	
                                                  	<c:if test="${grade.pid != 16 }">
                                                  			<td style="vertical-align:middle;">${grade.type}</td>
                                                  		</c:if>
                                                  	<c:if test="${grade.pid == 16 }">
                                                  			 <td style="vertical-align:middle;">全国普通话 </td>
                                                  		</c:if>
                                                 
                                                  <td style="vertical-align:middle;"><span style="color: red;">有效</span></td>
                                    			 <td style="vertical-align:middle;"><button onclick="deleteExam(${grade.id})" style="width:80px">删除</button> </td>
                                                </tr>
                                                
                                                </c:forEach>
                                           
                                              </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                                     
                        </div>
                  
                  </div>
                  <div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
                  众筹资产
                  </div>
            </div>
		</div>
	</div>
</div>
        <div class="container" style="margin-top:130px;">
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
    
    <script src="${APP_PATH }/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH }/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${APP_PATH }/jquery/layer/layer.js"></script>
	<script src="${APP_PATH }/script/docs.min.js"></script>
    <script src="${APP_PATH }/script/back-to-top.js"></script>
    <script src="${APP_PATH}/script/operate-modal.js"></script>
	<script>
		$('#myTab a').click(function (e) {
		  e.preventDefault()
		  $(this).tab('show')
		})
		$('#myTab1 a').click(function (e) {
		  e.preventDefault()
		  $(this).tab('show')
		})
		
		//修改密码
		$('#rsp').click(function(){
			$('#exampleModal1').modal("show");
			$("#old_password").val("");
			$("#new_password").val("");
		})
		
		function doclick(){
			$('#exampleModal1').modal("hide");
		}
		
		function dosubmit(){
			var old_password = $("#old_password");
			var new_password = $("#new_password");
			
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
	    		url : '${APP_PATH}/rsPassword.do',//重设密码，所有rsp，rspPassword都是重设密码相关的
	    		type : "POST",
	    		data:{
	    			old_password:$.trim(old_password.val()),
	    			new_password:$.trim(new_password.val()),
	    				},
   		    		success:function(res){
   		    			alert(res.message);
   		    			if(res.success){
   		    				$('#exampleModal1').modal("hide");
   		    			}
   		    		}
	    	})
		}
		
		function deleteExam(id){
			$.ajax({
				url:"${APP_PATH}/member/deleteExam.do",
				type:"POST",
				data:{
					id : id
				},
				success:function(result){
					if(result.success){
						layer.msg("取消成功！", {time:1500, icon:6, shift:6});
						setTimeout(function() {window.location.href = "${APP_PATH}/member/member.htm"; },1500);
					}else{
						layer.msg(result.message, {time:1000, icon:5, shift:6});
					}				
				},
				error:function(){
					layer.msg("操作失败", {time:1000, icon:5, shift:6});
				}
			})
		}
		
		
	</script>
  </body>
</html>
