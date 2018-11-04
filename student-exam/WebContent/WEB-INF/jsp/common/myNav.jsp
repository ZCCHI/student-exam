<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <div class="container">
			<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			  <div class="container">
				<div class="navbar-header">
				  <a class="navbar-brand" href="#" style="font-size:28px;">学生在线报名系统</a>
				</div>
            <div id="navbar" class="navbar-collapse collapse" style="float:right;">
              <ul class="nav navbar-nav navbar-right">
              	 <li><a href="${APP_PATH }/index.htm">首页</a></li> 	
		           <li><a href="#" id="jieshao">考试简介</a></li> 	
                <li><a href="#" id="kaoshen">考生须知</a></li>
                <li><a href="${APP_PATH }/enroll/enrollProcess.htm">报名流程</a></li>
                <li><a href="#" id="question">常见问题</a></li>
                <li><a href="${APP_PATH }/member/member.htm">个人中心</a></li>
                 <li style="padding-left:110px;"><a href="#">${sessionScope.LOGIN_Student.name }：你好！</a></li>
                <li><a href="${APP_PATH }/logout.do">退出</a></li>
              </ul>
            </div>
			  </div>
			</nav>
      </div>