<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<div class="modal fade" id="exampleModal4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel1"></h4>
      </div>
      <div class="modal-body">
         
				<form role="form" id="Form" method="post">
					<input type="hidden" id="id">
					  <div class="form-group">
					<label for="mark">考试地点</label>
					<input type="text" class="form-control"  id="address" name="pname" placeholder="必填项">
				  </div>
				  <div class="form-group">
					<label for="mark">考试日期</label>
					<input type="text" class="form-control"  id="date" name="pname" placeholder="请输入日期   格式如：2018-12-12">
				  </div>								
				  <div class="form-group">
					<label for="mark">备注</label>
					<input type="text" class="form-control"  id="note" name="pname" placeholder="备注信息,可以不填!">
				  </div>				
				 		
				</form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" id="upBtn" class="btn btn-primary">提交</button>
      </div>
    </div>
  </div>
</div>