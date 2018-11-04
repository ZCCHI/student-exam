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
      <input class="form-control has-success" id="queryText" name="queryText" type="text" placeholder="请输入学生名称查询">
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
                  <th>学号</th>
                  <th>账号</th>
                  <th>真实姓名</th> 
                  <th>报考科目</th>                          
                  <th>身份证号</th>
                  <th>报考时间</th>
                  <th>成绩</th>
                  <th>备注</th>
                  <th width="100">操作</th>
                </tr>
              </thead>
              <tbody>
              		
              </tbody>
			  <tfoot>
			     <tr >
				     <td colspan="10" align="center">
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
	
    <script src="${APP_PATH }/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH }/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH }/script/docs.min.js"></script>
	  <script type="text/javascript" src="${APP_PATH }/jquery/layer/layer.js"></script>
	  <script type="text/javascript" src="${APP_PATH }/script/menu.js"></script>
	  <script src="${APP_PATH }/jquery/jquery.pagination.js"></script>	  
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
    		  url:"${APP_PATH}/student/queryStudentGradeInfo.do",
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
       					content+='  <td>'+n.loginacct+'</td>';
       					content+='  <td>'+n.name+'</td>';
       					content+='  <td>'+n.realname+'</td>';
       					content+='  <td>'+(n.pid == 6?"英语考试等级     ":(n.pid == 16?"计算机二级考试科目    ":"全国普通话考试     "))+n.type+'</td>';
       					content+='  <td>'+n.cardid+'</td>';
       					content+='  <td>'+n.baotime+'</td>';
       					content+='  <td>'+(n.mark)+'</td>';
       					content+='  <td>'+(n.time== null?"无":n.time )+'</td>';
       					content+='  <td>';      					
       					content+='	  <button type="button" class="btn btn-danger btn-xs" onclick="deleteProDef(\''+n.id+'\',\''+n.name+'\')"><i class=" glyphicon glyphicon-remove"></i></button>';
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
        
       function deleteProDef(id,name){
    	   
    		layer.confirm("你确认要删除"+name+"考试成绩吗？",{icon: 3, title:'提示'}, function(cindex){
				layer.close(cindex);
				$.ajax({
	    			url:"${APP_PATH}/student/deletestuGrade.do",
	    			data:{
	    				"id":id
	    			},
	    			type:"POST",
	    			success:function(result){
	    				if(result.success){
	    					layer.msg("删除成功", {time:1000, icon:5, shift:6});
	    					queryPage(0);
	    				}else{
	    					layer.msg("删除失败", {time:1000, icon:5, shift:6});
	    				}
	    			}
	    		});
			}, function(cindex){
				layer.close(cindex);
			});   
       } 
       
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
   	    		url:'${APP_PATH}/resetManagerPass.do',
   	    		type:"POST",
   	    		data:{
   	    			old_password:$.trim(old_password.val()),
   	    			new_password:$.trim(new_password.val()),
   	    		},
   	    		success : function(res){
   	    			old_password.val("");
	    			new_password.val("");
   	    			alert(res.message)
   	    			if(res.success){
   	    				$("#exampleModal1").modal("hide");
   	    			}
   	    		}
   	    	})
         	}
                            
        </script>
  </body>
</html>
    