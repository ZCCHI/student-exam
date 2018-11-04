package com.student.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.student.bean.Student;
import com.student.service.StudentTypeService;
import com.student.utils.AjaxResult;
/**
 * 个人中心的业务处理
 * @author 
 *
 */
@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private StudentTypeService studentTypeService;
	
	//个人中心
	@RequestMapping("/member")
	public String member(HttpSession session,Map<String,Object> map){
		
		Student stu = (Student) session.getAttribute("LOGIN_Student");
				
		//已报名的未上传成绩记录查询
		List<Map<String,Object>> baomingList =  studentTypeService.queryBaoMingInfo(stu.getId());		
		map.put("baomingList", baomingList);
		
		List<Map<String,Object>> gradeList =  studentTypeService.queryGradeStuInfo(stu.getId());
		map.put("gradeList", gradeList);
		
						
		return "member";
	}
	
	
	//用户取消考试
	@ResponseBody
	@RequestMapping("/deleteExam")
	public AjaxResult deleteExam(Integer id){
		AjaxResult result = new AjaxResult();
		
		try {
			int count = studentTypeService.deleteStudentTypeById(id);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(false);
			result.setMessage("取消失败！");
		}		
		return result;
		
	}
	
	
	
	
}
