package com.student.interceptor;



import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.student.bean.Manager;
import com.student.bean.Student;

/**
 * 权限拦截 
 * @author hasee
 *
 */
public class LoginInterceptor extends HandlerInterceptorAdapter{
	

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
			//后台路径拦击
			Set<String> uri = new HashSet<String>();		
			uri.add("/main.htm");		
			uri.add("/student/toIndex.htm");
			uri.add("/student/uploadGrade.htm");
			uri.add("/student/doQueryGrade.htm");
			uri.add("/exam/index.htm");
			uri.add("/news/toIndex.htm");
			
			//前台路径拦击
			Set<String> uris = new HashSet<String>();		
			uris.add("/index.htm");		
			uris.add("/member/member.htm");			
		
			HttpSession session = request.getSession();
			
			Manager manager = (Manager) session.getAttribute("LOGIN_Manager");//判断用户是否登录
			
			String requesturi = request.getServletPath();//请求路径
			//是否具有访问后台权限
			if(uri.contains(requesturi)){
				if(manager == null){
					response.sendRedirect(request.getContextPath() + "/login.htm");
					return false;
				}
				
			}
			
			Student stu = (Student) session.getAttribute("LOGIN_Student");//判断用户是否登录
			if(uris.contains(requesturi)){
				if(stu == null){
					response.sendRedirect(request.getContextPath() + "/login.htm");
					return false;
				}				
			}
			return true;
	}
	
}
