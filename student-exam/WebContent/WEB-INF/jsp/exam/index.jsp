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
	<%@ include file="/WEB-INF/jsp/common/resetPass.jsp" %>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <div><a class="navbar-brand" style="font-size:32px;" href="#">后台管理- 学生账号维护</a></div>
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
				<h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
			  </div>
			  <div class="panel-body">
<form class="form-inline" role="form" style="float:left;">
  <div class="form-group has-feedback">
    <div class="input-group">
      <div class="input-group-addon">查询条件</div>
      <input class="form-control has-success" id="queryText" name="queryText" type="text" placeholder="请输入考试科目名称查询">
    </div>
  </div>
  <button type="button" id="queryBtn" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> 查询</button>
</form>
<br>
 <hr style="clear:both;">
          <div class="table-responsive">
            <table class="table  table-bordered">
              <thead>
                <tr >
                  <th width="30">#</th>				 
                  <th>考试科目</th>
                  <th>考试地点</th>
                  <th>考试时间</th>
                  <th>备注</th>
                  <th width="100">操作</th>
                </tr>
              </thead>
              <tbody>
              		
              </tbody>
			  <tfoot>
			     <tr >
				     <td colspan="6" align="center">
						<ul class="pagination" id="Pagination">							
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
    <jsp:include page="/WEB-INF/jsp/common/updateData.jsp"></jsp:include>
    <script src="${APP_PATH }/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH }/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH }/script/docs.min.js"></script>
	  <script type="text/javascript" src="${APP_PATH }/jquery/layer/layer.js"></script>
	  <script type="text/javascript" src="${APP_PATH }/script/menu.js"></script>
	  <script src="${APP_PATH }/jquery/jquery.pagination.js"></script> <!-- js文件需要修改一下 -->
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
		    showMenu();
		    queryPage(0);
        });
        
        $("#queryBtn").click(function(){
        	var queryText = $("#queryText").val();
        	ObjParam.queryText = queryText;
        	queryPage(0);
        })
        
        var ObjParam = {
        		pageno:1,
        		pagesize:10
        }
        var loadingIndex = -1;
       function queryPage(page_Index){
        	ObjParam.pageno = page_Index + 1;
        	
    	   $.ajax({
    		  url:"${APP_PATH}/exam/doIndex.do",
    		  type:"POST",
    		  data:ObjParam,
    		  beforeSend:function(){
    			  loadingIndex = layer.msg('处理中', {icon: 16});
    			return true;
    		  },
    		  success:function(result){
    			  layer.close(loadingIndex);
    			if(result.success){
    				var page = result.page;       
    				var content = "";
    				$.each(page.datas,function(i,n){
    					content+=' <tr>';
       					content+='  <td>'+(i+1)+'</td>';
       					content+='  <td>'+n.typename+'</td>';
       					content+='  <td>'+n.address+'</td>';
       					content+='  <td>'+n.date+'</td>';
       					content+='  <td>'+(n.note == null?"无":n.note)+'</td>';
       					content+='  <td>';
       					content +='<button type="button" onclick="updateData('+n.id+',\''+n.address+'\',\''+n.date+'\',\''+n.note+'\',\''+n.typename+'\')"  class="btn btn-success btn-xs"><i class=" glyphicon glyphicon-check"></i></button>';
       					content+='  </td>';
       					content+='</tr>';
    				});
    				
    				 $("tbody").html(content);         				        				
 					
    				// 创建分页
 					$("#Pagination").pagination(page.total, {
 						num_edge_entries: 1, //边缘页数
 						num_display_entries: 2, //主体页数
 						callback: queryPage,
 						items_per_page:page.pagesize, //每页显示10项
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
        
     function updateData(id,address,date,note,typename){
    	 $('#exampleModal4').modal('show');
    	   $("#id").val(id);
    	   $("#address").val(address);
    	   $("#date").val(date);
    	   $("#note").val(note);
    	   $("#exampleModalLabel1").text(typename);
     }
     function addGrade(id){
  	   
     }    
     	$("#upBtn").click(function(){
     		var address = $("#address");
	    	var date = $("#date");
	    	var note = $("#note");
	    	if($.trim(address.val()) == "" || $.trim(date.val()) == ""){   		    		
	    		layer.msg("信息未填写完整！", {time:1000, icon:5, shift:6}, function(){	    			
	    		});    		
	    		return false;
	    	}  
	    	
     		$.ajax({
  			url:"${APP_PATH}/exam/updateExamRoom.do",   			   		
  			data:{
  				"id":$("#id").val(),
  				address:address.val(),
  				date:date.val(),
  				note:note.val()
  			},
  			type:"POST",
  			success:function(result){
  				 $('#exampleModal4').modal('hide');
  				if(result.success){
  					layer.msg("录入成功", {time:1000, icon:5, shift:6});
  					queryPage(0);
  				}else{
  					layer.msg("录入失败", {time:1000, icon:5, shift:6});
  				}
  			}
  		});
     		
     	});
               
                           
        </script>
  </body>
</html>
    