package com.student.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.student.bean.ExamRoom;
import com.student.service.ExamRoomService;
/**
 * 主页面跳转
 * @author 
 *
 */
@Controller
public class DispatcherController {
	
	@Autowired
	private ExamRoomService examRoomService;
	
	@RequestMapping("/index")
	public String index(Map<String,Object> map){
			
		//考试信息
		List<ExamRoom> examList = examRoomService.queryAllExamRoomInfo();		
		map.put("examList", examList);
		
		return "index";
	}
	
	//主页面
	@RequestMapping("/main")
	public String main(){
		
		return "main";
	}

	
	
		
}
