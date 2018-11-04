<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<ul style="padding-left:0px;" class="list-group">
			<li class="list-group-item tree-closed" >
				<a href="${APP_PATH }/main.htm"><i class="glyphicon glyphicon-dashboard"></i> 控制面板</a> 
			</li>
			<li class="list-group-item tree-closed">
				<span><i class="glyphicon glyphicon glyphicon-tasks"></i> 学生信息管理<span class="badge" style="float:right">3</span></span> 
				<ul style="margin-top:10px;display:none;">
					<li style="height:30px;">
						<a href="${APP_PATH }/student/toIndex.htm"><i class="glyphicon glyphicon-user"></i> 学生账号</a> 
					</li>
					<li style="height:30px;">
						<a href="${APP_PATH }/student/uploadGrade.htm"><i class="glyphicon glyphicon-king"></i> 学生考试成绩录入</a> 
					</li>
					<li style="height:30px;">
						<a href="${APP_PATH }/student/doQueryGrade.htm"><i class="glyphicon glyphicon-lock"></i> 学生成绩查询</a> 
					</li>
				</ul>
			</li>
			<li class="list-group-item tree-closed">
				<span><i class="glyphicon glyphicon-th-large"></i> 考试安排管理 <span class="badge" style="float:right">1</span></span> 
				<ul style="margin-top:10px;display:none;">
			
					<li style="height:30px;">
						<a href="${APP_PATH }/exam/index.htm"><i class="glyphicon glyphicon-random"></i> 流程管理</a> 
					</li>			
				</ul>
			</li>
					
						<li class="list-group-item tree-closed">
				<span><i class="glyphicon glyphicon-ok"></i> 动态新闻管理 <span class="badge" style="float:right">1</span></span> 
				<ul style="margin-top:10px;display:none;">
					<li style="height:30px;">
						<a href="${APP_PATH }/news/detailNews.htm"><i class="glyphicon glyphicon-check"></i>新闻公告</a> 
					</li>				
				</ul>
			</li>
					
		</ul>  
		
		
		