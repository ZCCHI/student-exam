package com.student.listener;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * 自定义监听器 
 * @author hasee
 *	将项目中的上下文路径放到applicatin中
 */

/**
 * ServletContextListener监听器用于application域的创建和销毁
 * 
 * @author
 *
 */
public class StartSystemListener implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {  //监听application域的销毁            要执行的方法 
		// TODO Auto-generated method stub		
	}
	
	//在服务器启动时，创建application对象需要执行的方法
	//将项目上下文路径（request.getContextPath()）放到application域中
	@Override
	public void contextInitialized(ServletContextEvent sec) {    //监听application域的创建     要执行的方法
		ServletContext application = sec.getServletContext();//获取到application域对象
		String contextPath = application.getContextPath();//获取上下文路径
		application.setAttribute("APP_PATH", contextPath);//放到application域中

	
					
	
	}

}
