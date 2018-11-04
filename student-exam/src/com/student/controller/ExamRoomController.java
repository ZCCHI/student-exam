package com.student.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.student.bean.ExamRoom;
import com.student.service.ExamRoomService;
import com.student.utils.AjaxResult;
import com.student.utils.Page;
import com.student.utils.StringUtil;
/**
 * 考场 考试时间处理
 * @author 
 *
 */
@Controller
@RequestMapping("/exam")
public class ExamRoomController {
	
	@Autowired
	private ExamRoomService examRoomService;
	
	@RequestMapping("/index")
	public String index(){
		
		return "exam/index";
	}
	
		
	@RequestMapping("/examInfo")
	public String examInfo(Integer id,Map<String,Object> map){
		
		if(id == 1){
			ExamRoom examRoom  = examRoomService.queryExamInfoById(id);
			map.put("examInfo", examRoom);
			return "exam/examRoom";
		}else if(id == 2){
			ExamRoom examRoom  = examRoomService.queryExamInfoById(id);
			map.put("examInfo", examRoom);
			return "exam/computerExam";
		}else if(id == 3){
			ExamRoom examRoom  = examRoomService.queryExamInfoById(id);
			map.put("examInfo", examRoom);
			return "exam/puTongHua";
		}		
		return "index";
	}
	
	
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
			Page page = examRoomService.queryPage(paramMap);
			result.setSuccess(true);
			result.setPage(page);
		} catch (Exception e) {			
			e.printStackTrace();
			result.setSuccess(false);
			result.setMessage("加载数据失败！");
		}						
		return result;		
	}
	
	@ResponseBody
	@RequestMapping("/updateExamRoom")
	public AjaxResult updateExamRoom(ExamRoom examRoom){
		AjaxResult result = new AjaxResult();
		
		try {			
			int count = examRoomService.updateExamRoom(examRoom);
			result.setSuccess(true);
			
		} catch (Exception e) {
			result.setSuccess(false);
			result.setMessage("更新失败");
			e.printStackTrace();
		}
		
		
		return result;		
	}
	
	
	
}
