<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  	<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">修改密码</h4>
      </div>
      <div class="modal-body">
         
				<form role="form" id="picForm" method="post" enctype="multipart/form-data">
				  <div class="form-group">
					<input type="password" class="form-control"  id="old_password" name="old_password" placeholder="请输入旧密码">
				  </div>				
				  <div class="form-group">
					<input type="password" class="form-control" id="new_password" name="new_password" placeholder="请输入新密码">						            
				  </div>		
				</form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="doclose()">关闭</button>
        <button type="button" id="upPicBtn" class="btn btn-primary" onclick="dosubmit()">提交</button>
      </div>
    </div>
  </div>
</div>