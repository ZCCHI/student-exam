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
	<link rel="stylesheet" href="${APP_PATH }/css/theme.css">
	<link rel="stylesheet" href="${APP_PATH }/jquery/pagination.css">
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
  	<div class="navbar-wrapper">
    	<jsp:include page="/WEB-INF/jsp/common/myNav.jsp"></jsp:include> 
    </div>
<div class="container">
	<hr />
	<div class="row clearfix">
		<div class="col-sm-3 col-md-3 column">
			<div class="list-group">
				<div class="list-group-item active">
					<h2>考生服务</h2>
				</div>
				<hr />
				<div class="list-group-item active">
					最新资讯<span class="badge"><i class="glyphicon glyphicon-chevron-right"></i></span>
				</div>
				<div class="list-group-item " style="cursor:pointer;" onclick="window.location.href='${APP_PATH}/member/member.htm'">
					成绩查询<span class="badge"><i class="glyphicon glyphicon-chevron-right"></i></span>
				</div>
				<div class="list-group-item " style="cursor:pointer;" onclick="window.location.href='${APP_PATH }/enroll/enrollProcess.htm'">
					考试流程<span class="badge"><i class="glyphicon glyphicon-chevron-right"></i></span>
				</div>		
			</div>
		</div>
		
    <div class="col-sm-9 col-md-9 column" >
   	
	   	<ul id="contentId" style="padding-left:160px;">  
								
		</ul>	
	   
	       
       <div style="text-align:center; position:fixed;left:860px;top:550px;" >
	       	<ul class="pagination" id="Pagination" >
	       									
			</ul>
       </div>
                 
		</div>
	</div>
</div>
        <div class="container" style="margin-top:250px;">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div id="footer" >
                        <div class="footerNav">
                             <a rel="nofollow" href="#">关于我们</a> <a rel="nofollow" href="#">联系我们</a>
                        </div>
                        <div class="copyRight">
                            Copyright @ 朱梅 汪朋  版权所有
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
    <script src="${APP_PATH }/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH }/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH }/script/docs.min.js"></script>
    <script src="${APP_PATH }/script/back-to-top.js"></script>
	<script src="${APP_PATH}/script/operate-modal.js"></script>
    <script type="text/javascript" src="${APP_PATH }/jquery/layer/layer.js"></script>
	  <script src="${APP_PATH }/jquery/jquery.pagination.js"></script> 
	<script>
$('#myTab a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
})
$('#myTab1 a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
})

	$(function(){
				
		queryPage(0);	
		});
		
		
	 var jsonObj = {
     		pageno:1,
     		pagesize:15,   		
     } 
   
     function queryPage(page_Index){
     	 jsonObj.pageno = page_Index + 1;
 	  $.ajax({
 		 url:"${APP_PATH}/news/queryPage.do",
 		 type:"POST",
 		 data:jsonObj,
 		 beforeSend:function(){
 			 
 			 return true;
 		 },
 		 success:function(result){
 			
 			 if(result.success){
 				var content = ""; 
 				var page = result.page;
 				 $.each(page.datas,function(i,n){			
 					content += '<li>';
 					content += '<span id="ReportIDname"><a href="${APP_PATH}/news/queryNewsDeail.htm?id='+n.id+'" title="'+(n.title)+'" style="font-size:16px;color:red";>'+n.title+'</a></span>';
 					content += '<span id="ReportIDIssueTime" style="margin: 150px;">2018-02-26</span>';
 					content += '</li>';
 				       				
 				 });
 				 $("#contentId").html(content);         				        				
 					// 创建分页
 					$("#Pagination").pagination(page.total, {
 						num_edge_entries: 1, //边缘页数
 						num_display_entries: 2, //主体页数
 						callback: queryPage,
 						items_per_page:15, //每页显示4项
 						prev_text:"上一页",
 						next_text:"下一页",
 						current_page:(page.pageno-1) //当前页
 					});

 				 
 			 }else{
 					layer.msg("加载数据失败", {time:1000, icon:5, shift:6});
 			 }
 		 },
 		 error:function(){
 			 layer.close(loadingIndex);
 			 layer.msg("加载数据失败", {time:1000, icon:5, shift:6});
 		 }        		  
 	  });       	  
     }
	 
	</script>	




    
	</script>
  </body>
</html>