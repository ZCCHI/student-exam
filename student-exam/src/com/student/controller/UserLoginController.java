package com.student.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 登录注册页面处理 密码修改
 * @author 汪朋
 *
 */
import org.springframework.web.bind.annotation.ResponseBody;

import com.student.bean.Manager;
import com.student.bean.Student;
import com.student.service.ManagerService;
import com.student.service.StudentService;
import com.student.utils.AjaxResult;
import com.student.utils.MD5Util;
@Controller
public class UserLoginController {
	
	@Autowired
	private StudentService StudentService;
	
	@Autowired
	private ManagerService managerService;
	
	//登录页面跳转
	@RequestMapping("/login")
	public String login(){
		
		return "login";
	}

	//注册页面跳转
	@RequestMapping("/register")
	public String register(){
		
		return "reg";
	}
	
	@RequestMapping("/find")
	public String find(){
		
		return "findPassword";
	}
	
	//用户注册
	@ResponseBody
	@RequestMapping("/doRegister")
	public AjaxResult doRegister(Student student,String check,HttpSession session){
		AjaxResult result = new AjaxResult();
		
		String validateCode = (String) session.getAttribute("validateCode");
		if(!validateCode.equals(check)){
			result.setMessage("验证码不正确!");
			result.setSuccess(false);
			return result;
		}			
		
		try {
			
			Student existStu = StudentService.queryExistLoginacct(student.getLoginacct());
			if(existStu != null){
				result.setSuccess(false);
				result.setMessage("学号已存在！");
				return result;
			}			
			student.setPassword(MD5Util.digest(student.getPassword()));	
			Date date = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			student.setCreatetime(format.format(date));
			int count = StudentService.saveStudent(student);
			result.setSuccess(count == 1);
			result.setMessage("注册成功！");
		} catch (Exception e) {	
			result.setSuccess(false);
			result.setMessage("注册失败！");
			e.printStackTrace();
			
		}		
		return result;		
	}
	
	//用户登录
	@ResponseBody
	@RequestMapping("doLogin")
	public AjaxResult doLogin(String loginacct,String password,String type,HttpSession session){
		AjaxResult result = new AjaxResult();
		
		String Md5password = MD5Util.digest(password);
		//用户登录
		if("student".equals(type)){
			Student stu = new Student();
			stu.setLoginacct(loginacct);
			stu.setPassword(Md5password);
			
			Student loginStudent = StudentService.queryLoginStudent(stu);
			if(loginStudent == null){
				result.setSuccess(false);
				result.setMessage("用户名或密码错误！");		
			}else{
				session.setAttribute("LOGIN_Student", loginStudent);
				result.setSuccess(true);
				result.setData(type);
			}
						
		}else if("manager".equals(type)){
			//管理员登录
			Manager man = new Manager();
			man.setLoginacct(loginacct);
			man.setPassword(Md5password);			
			Manager loginManager = managerService.queryLoginManager(man);
			if(loginManager == null){
				result.setSuccess(false);
				result.setMessage("用户名或密码错误！");		
			}else{
				session.setAttribute("LOGIN_Manager", loginManager);
				result.setSuccess(true);
				result.setData(type);
			}		
		}else{
			result.setSuccess(false);
			result.setMessage("网络出错了");
		}
		return result;
	}
	
	//退出
	@RequestMapping("/logout")
	public String logout(HttpSession session){		
		session.invalidate();
		return "redirect:/login.htm";
	}
	
	
	
	//用户设密码
	@ResponseBody
	@RequestMapping("rsPassword.do")
	public AjaxResult rsPassword(String old_password,String new_password,HttpSession session){
		AjaxResult result = new AjaxResult();
		Student stu = new Student();
		String old_Md5password = MD5Util.digest(old_password);
		String new_Md5password = MD5Util.digest(new_password);
		Student loginStudent = (Student) session.getAttribute("LOGIN_Student");
		stu.setLoginacct(loginStudent.getLoginacct());
		stu.setPassword(old_Md5password);
		Student resultStudent = StudentService.queryLoginStudent(stu);
		if(resultStudent == null){
			result.setSuccess(false);
			result.setMessage("密码输入错误");
		}else{
			stu.setPassword(new_Md5password);
			int res = StudentService.rsPassword(stu);
			if(res == 1){
				result.setSuccess(true);
				result.setMessage("修改成功");
			}
		}
		
		return result;
	}
	
	//修改管理员密码
	@ResponseBody
	@RequestMapping("resetManagerPass")
	public AjaxResult resetManagerPass(String old_password,String new_password,HttpSession session){
		AjaxResult result = new AjaxResult();
		String old_Md5password = MD5Util.digest(old_password);
		String new_Md5password = MD5Util.digest(new_password);
		Manager manager = new Manager();
		Manager loginManager = (Manager) session.getAttribute("LOGIN_Manager");
		manager.setLoginacct(loginManager.getLoginacct());
		manager.setPassword(old_Md5password);
		Manager resultManager = managerService.queryLoginManager(manager);
		if(resultManager == null){
			result.setSuccess(true);
			result.setMessage("旧密码输入错误");
		}else{
			manager.setPassword(new_Md5password);
			//System.out.println(manager.getLoginacct()+"==========="+manager.getPassword());
			int res = managerService.resetManagerPass(manager);
			if(res == 1){
				result.setSuccess(true);
				result.setMessage("修改成功");
			}
		}
		
		return result;
	}
	
	//找回密码
	@ResponseBody
	@RequestMapping("findPassword")
	public AjaxResult findPassword(Student student,String check,HttpSession session){
		AjaxResult result = new AjaxResult();
		
		String validateCode = (String) session.getAttribute("validateCode");
		if(!validateCode.equals(check)){
			result.setMessage("验证码不正确!");
			result.setSuccess(false);
			return result;
		}
		String Md5Password = MD5Util.digest(student.getPassword());
		student.setPassword(Md5Password);
		
		Student resultStudent = StudentService.findPassword(student);
		if(resultStudent == null){
			result.setSuccess(false);
			result.setMessage("账户或邮箱错误");
		}else{
			int res = StudentService.rsPassword(student);
			if(res == 1){
				result.setSuccess(true);
				result.setMessage("修改成功");
			}
		}
		
		return result;
	}	
		
	
	
}
