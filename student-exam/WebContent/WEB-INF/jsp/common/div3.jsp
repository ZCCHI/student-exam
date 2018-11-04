<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="modal fade bs-example-modal-lg" id="exampleModal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">  
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">				
			<div class="panel panel-default">
              <div class="panel-heading">新增新闻数据<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
			  <div class="panel-body">
				<form role="form" id="userForm" method="post" enctype="multipart/form-data">
				  <div class="form-group">
					<label for="floginacct">新闻标题</label>
					<input type="text" class="form-control" id="title" name="title" value="" placeholder="请输入新闻标题">
				  </div>								 	
		 			<input type="hidden" id="contentId" name="content">					 				 				  				  
				  <textarea name="content" id="sss" style="width:1080px;height:500px;visibility:hidden;">${requestScope.menuContent.content }</textarea>
				  
				  <button id="tijiaoBtn" type="button" class="btn btn-success"><i class="glyphicon glyphicon-plus"></i>提交</button>
				  <button  id="closeBtn" type="button" class="btn btn-danger"><i class="glyphicon glyphicon-refresh"></i>关闭</button>
				</form>
			  </div>
			</div>
        </div>      
    </div>
             
             
     <div class="modal fade bs-example-modal-lg" id="exampleModal4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">  
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">				
			<div class="panel panel-default">
              <div class="panel-heading">查看新闻数据<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
			  <div class="panel-body">
											 						 				 				  				  
				  <textarea name="content1" id="content1" style="width:1080px;height:500px;visibility:hidden;"></textarea>
				  
				  <button id="closelookBtn" type="button" class="btn btn-success"><i class="glyphicon glyphicon-plus"></i>关闭</button>

			  </div>
			</div>
        </div>      
    </div>




