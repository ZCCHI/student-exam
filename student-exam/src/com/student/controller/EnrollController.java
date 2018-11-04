package com.student.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.student.bean.BiaoMing;
import com.student.bean.Student;
import com.student.bean.StudentType;
import com.student.bean.Type;
import com.student.service.StudentService;
import com.student.service.StudentTypeService;
import com.student.service.TypeService;
import com.student.utils.AjaxResult;
/**
 * 报名业务处理
 * @author 
 *
 */
@Controller
@RequestMapping("/enroll")
public class EnrollController {
	
	@Autowired
	private TypeService typeService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private StudentTypeService studentTypeService;
	
	@RequestMapping("/knowNote")
	public String knowNote(String id){
		
		return "enroll/knowNote";
	}
	
	@RequestMapping("/refuse")
	public String refuse(){
		
		return "enroll/refuse";
	}
	
	
	
	
	//报考科目
	@RequestMapping("/upRealInfo")
	public String upRealInfo(String id,Map<String,Object> map){
		
		Type father = typeService.queryTypeById(id);
		List<Type> typeList = typeService.queryTypeByPId(id);
		map.put("father", father);
		map.put("typeList", typeList);
		
		return "enroll/upRealInfo";
	}
	
	//上传报考信息
	@ResponseBody
	@RequestMapping("/doUpRealInfo")
	public AjaxResult doUpRealInfo(String realname,String cardid,String type,HttpSession session){
		AjaxResult result = new AjaxResult();
		Student student = (Student) session.getAttribute("LOGIN_Student");
		
		Integer status = Integer.valueOf(type);
		
		//判断是否具有英语报名资格
		if( 2 < status && status <= 5){
			//当前英语考试id
			int currentSta = status - 1; 
									
			StudentType stuType = studentTypeService.getStudentType(currentSta,student.getId());
			
			//没有权限
			if(stuType == null || stuType.getMark() < 425){
				result.setSuccess(false);
				result.setMessage("400");
				return result;
			}
			
		}
		
		
		try {
			Student stu = new Student();
			stu.setId(student.getId());
			stu.setRealname(realname);
			stu.setCardid(cardid);
			stu.setStutas("1");//已报名学生的状态			
			int count = studentService.updateStudentInfo(stu); //更新学生信息
			
			StudentType stuType = new StudentType();
			stuType.setStuid(student.getId());
			stuType.setTypeid(Integer.valueOf(type));
			stuType.setStatus("1");//已报名，未录入成绩
			Date date = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyy-MM-dd");
			stuType.setBaotime(format.format(date));//报名时间
			int yesOrNo = studentTypeService.saveStudentType(stuType);			
			int id = studentTypeService.getBiaoMingId();//获取表考记录的id
			result.setData(id);			
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(false);
			result.setMessage("上传失败！");
			e.printStackTrace();
		}		
		return result;
	}
	
	//报名信息回显
	@RequestMapping("/sureInfo")
	public String sureInfo(Integer id,Map<String,Object> map){
		
		BiaoMing biaogMing = studentTypeService.getBiaoMingInfo(id);		
		Type type = typeService.queryTypeById(biaogMing.getPid().toString());
		biaogMing.setFatherType(type.getType());
		
		map.put("baogMing", biaogMing);		
		return "enroll/sureInfo";
	}
	
	//报名成功提示
	@RequestMapping("/success")
	public String success(){
		
		return "enroll/success";
	}
	
	//用户报名流程查看
	@RequestMapping("/enrollProcess")
	public String enrollProcess(){
		return "enroll/enrollProcess";
	}
	
	
	
}
