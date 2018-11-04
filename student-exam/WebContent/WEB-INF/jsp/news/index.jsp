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
	<link rel="stylesheet" href="${APP_PATH }/jquery/pagination.css">	
	<link rel="stylesheet" href="${APP_PATH }/jquery/themes/default/default.css" />
	<script charset="utf-8" src="${APP_PATH }/jquery/kindeditor-min.js"></script>
	<script charset="utf-8" src="${APP_PATH }/jquery/zh_CN.js"></script>
	<style>
	.tree li {
        list-style-type: none;
		cursor:pointer;
	}
	table tbody tr:nth-child(odd){background:#F4F4F4;}
	table tbody td:nth-child(even){color:#C00;}
	</style>
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <div><a class="navbar-brand" style="font-size:32px;" href="#">学生在线报名系统</a></div>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
           	<%@ include file="/WEB-INF/jsp/tag.jsp" %>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
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
			<div class="panel panel-default">
			  <div class="panel-heading">
				<h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 新闻列表</h3>
			  </div>
			  <div class="panel-body">
<form class="form-inline" role="form" style="float:left;">
  <div class="form-group has-feedback">
    <div class="input-group">
      <div class="input-group-addon">查询条件</div>
      <input class="form-control has-success" id="queryText" type="text" placeholder="请输入查询条件">
    </div>
  </div>
  <button type="button" id="queryBtn" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> 查询</button>
</form>
<button type="button" class="btn btn-primary" id="addBtn" style="float:right;"><i class="glyphicon glyphicon-plus"></i> 新增</button>
<br>
 <hr style="clear:both;">
          <div class="table-responsive">
            <table class="table  table-bordered">
              <thead>
                <tr >
                  <th width="30">#</th>
                  <th>新闻标题</th>              
                  <th>创建时间</th>
                  <th width="100">操作</th>
                </tr>
              </thead>
              <tbody>
                    
              </tbody>
			  <tfoot>
			     <tr >
				     <td colspan="5" align="center">
						<ul class="pagination" id="Pagination" >
							
						</ul>
					 </td>
				 </tr>

			  </tfoot>
            </table>
          </div>
			  </div>
			</div>
        </div>
      </div>
    </div>
    
    <%@ include file="/WEB-INF/jsp/common/div3.jsp" %>

    <script src="${APP_PATH }/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH }/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH }/script/docs.min.js"></script>
	 <script type="text/javascript" src="${APP_PATH }/jquery/layer/layer.js"></script>
	<script src="${APP_PATH }/jquery/jquery.pagination.js"></script> <!-- js文件需要修改一下 -->
	<script type="text/javascript" src="${APP_PATH }/jquery/jquery-form.min.js"></script>
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
			    showMenu(); 			    
			    queryPage(0);
			   
            });
                                  
          
            function deteteFun(id,name){
      			layer.confirm("你确认要删除"+"   "+name+"   "+"吗",  {icon: 3, title:'提示'}, function(cindex){
    				layer.close(cindex);
    				$.ajax({
    	    			url:"${APP_PATH}/news/delete.do",
    	    			data:{
    	    				"id":id
    	    			},
    	    			type:"POST",
    	    			success:function(result){
    	    				if(result.success){    	    					
    	    					layer.msg("删除成功", {time:1000, icon:6, shift:6});
    	    					
    	    					setTimeout(function() { queryPage(0);},1000);
    	    				}else{
    	    					layer.msg(result.message, {time:1000, icon:5, shift:6});
    	    				}
    	    			},
    	    			error:function(){
    	    				layer.msg("删除失败", {time:1000, icon:5, shift:6});
    	    			}  	    			
    	    		});
    			}, function(cindex){
    				layer.close(cindex);
    			});
            }
            
                        
            var jsonObj = {
            		pageno:1,
            		pagesize:10          		
            } 
            var loadingIndex = -1;
            function queryPage(page_Index){
            	 jsonObj.pageno = page_Index + 1;
        	  $.ajax({
        		 url:"${APP_PATH}/news/queryPage.do",
        		 type:"POST",
        		 data:jsonObj,
        		 beforeSend:function(){
        			 loadingIndex = layer.msg('数据查询中', {icon: 16});	
        			 return true;
        		 },
        		 success:function(result){
        			 layer.close(loadingIndex);
        			 if(result.success){
        				var content = ""; 
        				var page = result.page;
        				 $.each(page.datas,function(i,n){		
	        				content+='<tr>';
	        				content+='  <td>'+(i+1)+'</td>';
	        				content+='  <td>'+n.title+'</td>';	        				        			
	        				content+='  <td>'+n.time+'</td>';	        				
	        				content+='  <td>';
	        				content+='	  <button type="button" onclick="lookBtn('+n.id+')" class="btn btn-success btn-xs"><i class="glyphicon glyphicon-check"></i></button>';	        					        	
	        				content+='	  <button type="button" onclick="deteteFun('+n.id+',\''+n.title+'\')" class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-remove"></i></button>';
	        				content+='  </td>';
	        				content+='</tr>'; 
        				       				
        				 });
        				 $("tbody").html(content);         				        				
        					// 创建分页
        					$("#Pagination").pagination(page.total, {
        						num_edge_entries: 1, //边缘页数
        						num_display_entries: 2, //主体页数
        						callback: queryPage,
        						items_per_page:10, 
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
            
            $("#queryBtn").click(function(){
            	var queryText = $("#queryText").val();
            	jsonObj.queryText = queryText;
            	queryPage(0);
            })
                                    
            var loadingIndex = -1;
            $("#tijiaoBtn").click(function(){ 
            	            	
           	 if($.trim($("#title").val()) == "" ||  $.trim(editor.html()) == ""){           		
           		layer.msg("信息未填写完整", {time:1000, icon:5, shift:6});    		
          		return false;
          		}             	            	           	
           	$("#contentId").val(editor.html())          	
           	var options = { 
                  	    url: "${APP_PATH}/news/upNews.do",                 
                     	type: "POST", 
      		     		beforeSubmit: function(){      		     		    		     		    		     			    		       		     		   		     		   		     			   		     			
      		     			loadingIndex = layer.msg('数据上传中', {icon: 16});	
      		     			return true;
      		     		},       		     		
      		     		success: function(result){
      		     			layer.close(loadingIndex);        			     		               		     			
	       		     			if(result.success){	       		     				
	       		     				layer.msg("数据上传成功", {time:3000, icon:6, shift:6});	       		     				
	       		     			setTimeout(function() {$('#exampleModal3').modal('hide');
	       		     					$("#userForm")[0].reset(); editor.html("");},1000);
	       		     			queryPage(0);	
	       		     			}else{
	       		     				layer.msg("数据上传失败", {time:1000, icon:5, shift:6});
	       		     			}
      		     			}  		     		
           			}  
          				$("#userForm").ajaxSubmit(options);  
            }); 
                       
           $("#closeBtn").click(function(){
           	$('#exampleModal3').modal('hide');
           });
           
           $("#addBtn").click(function(){
           	$('#exampleModal3').modal('show');
           });
           
           $("#closelookBtn").click(function(){
              	$('#exampleModal4').modal('hide');
              });
              
           function lookBtn(id){
        	   $('#exampleModal4').modal('show'); 
        	   
        	   $.ajax({
        		   url:"${APP_PATH}/news/queryContent.do",
        		   type:"POST",
        		   data:{"id":id},
        		   beforeSend:function(){
        			   loadingIndex = layer.msg('数据查询中', {icon: 16});	 
        		   },
        		   success:function(result){
        			   layer.close(loadingIndex);
        			   if(result.success){
        				   editor1.readonly();
        	        	   editor1.html(result.data);   
        			   }else{
        				   layer.msg("数据查询失败", {time:1000, icon:5, shift:6});
        			   }
        		   },
        		   error:function(){
        			   layer.msg("数据查询失败", {time:1000, icon:5, shift:6});
        		   }
        		   
        	   }) 	           	 
           }
          
           
           
           var editor1;
			KindEditor.ready(function(K) {
				editor1 = K.create('textarea[name="content1"]', {
					allowFileManager : true,
					
				});					
			});
           
           var editor;
			KindEditor.ready(function(K) {
				editor = K.create('textarea[name="content"]', {
					allowFileManager : true,
					filePostName: 'imgFile',
					 uploadJson : '${APP_PATH}/nav/upload.do',
				});	
				
			});
                                                    
        </script>
        <script type="text/javascript" src="${APP_PATH }/script/menu.js"></script>
  </body>
</html>

