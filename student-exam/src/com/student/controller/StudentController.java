package com.student.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.student.bean.StudentType;
import com.student.service.StudentService;
import com.student.service.StudentTypeService;
import com.student.utils.AjaxResult;
import com.student.utils.Page;
import com.student.utils.StringUtil;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private StudentTypeService studentTypeService;
	
	@RequestMapping("/toIndex")
	public String toIndex(){
		
		return "student/index";
	}
	
	@RequestMapping("/uploadGrade")
	public String uploadGrade(){
		
		return "student/uploadGrade";
	}
	
	@RequestMapping("/doQueryGrade")
	public String doQueryGrade(){
		
		return "student/queryGrade";
	}
	
	
	
	
	//删除学生账号
	@ResponseBody
	@RequestMapping("/delete")
	public AjaxResult delete(Integer id){
		AjaxResult result = new AjaxResult();		
			try {
				int count = studentService.deleteStudentById(id);				
				result.setSuccess(true);
			} catch (Exception e) {
				result.setSuccess(false);
				e.printStackTrace();
			}					
		return result;
	}
	
	
	//后台学生账号维护分页
	@ResponseBody
	@RequestMapping("/doIndex")
	public AjaxResult doIndex(@RequestParam(value="pageno",required=false,defaultValue="1")Integer pageno,
			@RequestParam(value="pagesize",required=false,defaultValue="10")Integer pagesize,String queryText){
		AjaxResult result = new AjaxResult();
		
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("pageno", pageno);
		paramMap.put("pagesize", pagesize);
		
		if(StringUtil.isNotEmpty(queryText)){
			
			if(queryText.contains("%")){
				queryText = queryText.replaceAll("%", "\\\\%");//%是特殊字符，需要转义
			}
			paramMap.put("queryText", queryText);
		}	
		
		try {
			Page page = studentService.queryPage(paramMap);
			result.setSuccess(true);
			result.setPage(page);
		} catch (Exception e) {			
			e.printStackTrace();
			result.setSuccess(false);
			result.setMessage("加载数据失败！");
		}						
		return result;		
	}
	
	//后台学生报名学生查询
	@ResponseBody
	@RequestMapping("/queryBiaoStudentInfo")
	public AjaxResult queryBiaoStudentInfo(@RequestParam(value="pageno",required=false,defaultValue="1")Integer pageno,
			@RequestParam(value="pagesize",required=false,defaultValue="10")Integer pagesize,String queryText){
		AjaxResult result = new AjaxResult();
		
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("pageno", pageno);
		paramMap.put("pagesize", pagesize);
		
		if(StringUtil.isNotEmpty(queryText)){
			
			if(queryText.contains("%")){
				queryText = queryText.replaceAll("%", "\\\\%");//%是特殊字符，需要转义
			}
			paramMap.put("queryText", queryText);
		}	
		
		try {
			Page page = studentService.queryBiaoMingPage(paramMap);
			result.setSuccess(true);
			result.setPage(page);
		} catch (Exception e) {			
			e.printStackTrace();
			result.setSuccess(false);
			result.setMessage("加载数据失败！");
		}						
		return result;		
	}
	
	//上传学生成绩
	@ResponseBody
	@RequestMapping("/upStudentGrade")
	public AjaxResult upStudentGrade(StudentType studentType){		
		AjaxResult result = new AjaxResult();
		
		try {
			studentType.setStatus("2");//成绩已录入
			int count = studentTypeService.saveStudentGrade(studentType);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(false);
			result.setMessage("录入失败");
			e.printStackTrace();
		}				
		return result;
	}
	
	//撤销学生考试资格
	@ResponseBody
	@RequestMapping("/deletekaoshi")
	public AjaxResult deletekaoshi(Integer id){		
		AjaxResult result = new AjaxResult();
		
		try {			
			int count = studentTypeService.deleteStukaoshi(id);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(false);
			result.setMessage("撤销失败");
			e.printStackTrace();
		}				
		return result;
	}
	
	
	//后台学生成绩查询
	@ResponseBody
	@RequestMapping("/queryStudentGradeInfo")
	public AjaxResult queryStudentGradeInfo(@RequestParam(value="pageno",required=false,defaultValue="1")Integer pageno,
			@RequestParam(value="pagesize",required=false,defaultValue="10")Integer pagesize,String queryText){
		AjaxResult result = new AjaxResult();
		
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("pageno", pageno);
		paramMap.put("pagesize", pagesize);
		
		if(StringUtil.isNotEmpty(queryText)){
			
			if(queryText.contains("%")){
				queryText = queryText.replaceAll("%", "\\\\%");//%是特殊字符，需要转义
			}
			paramMap.put("queryText", queryText);
		}	
		
		try {
			Page page = studentService.queryGradePage(paramMap);
			result.setSuccess(true);
			result.setPage(page);
		} catch (Exception e) {			
			e.printStackTrace();
			result.setSuccess(false);
			result.setMessage("加载数据失败！");
		}						
		return result;		
	}
	
	
	//删除学生学生成绩
	@ResponseBody
	@RequestMapping("/deletestuGrade")
	public AjaxResult deletestuGrade(Integer id){		
		AjaxResult result = new AjaxResult();		
		try {			
			int count = studentTypeService.deleteStukaoshi(id);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(false);
			result.setMessage("删除失败");
			e.printStackTrace();
		}				
		return result;
	}
	
	
	
}
