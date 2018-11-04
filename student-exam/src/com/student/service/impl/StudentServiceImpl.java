package com.student.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.student.bean.BiaoMing;
import com.student.bean.Student;
import com.student.dao.StudentMapper;
import com.student.service.StudentService;
import com.student.utils.Page;
@Service
public class StudentServiceImpl implements StudentService{
	
	@Autowired
	private StudentMapper studentMapper;

	@Override
	public int saveStudent(Student student) {
		
		return studentMapper.saveStudent(student);
	}

	@Override
	public Student queryLoginStudent(Student stu) {
		
		return studentMapper.queryLoginStudent(stu);
	}

	@Override
	public Student queryExistLoginacct(String loginacct) {
		
		return studentMapper.queryExistLoginacct(loginacct);
	}

	
	@Override
	public Page queryPage(Map<String, Object> paramMap) {

		Page page = new Page((Integer)paramMap.get("pageno"), (Integer)paramMap.get("pagesize"));
		
		Integer startIndex = page.getStartIndex();//开始行
		
		paramMap.put("startIndex", startIndex);
		
		List<Student> list = studentMapper.queryPage(paramMap);
		
		Integer count = studentMapper.queryCount(paramMap);
		
		page.setDatas(list);
		page.setTotal(count);
			
		return page;
	}

	
	@Override
	public int deleteStudentById(Integer id) {
		
		return studentMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int rsPassword(Student student) {
		// TODO Auto-generated method stub
		return studentMapper.updateStudentPassword(student);
	}

	@Override
	public int updateStudentInfo(Student stu) {
		
		return studentMapper.updateStudentInfo(stu);
	}

	@Override
	public Page queryBiaoMingPage(Map<String, Object> paramMap) {
		
		Page page = new Page((Integer)paramMap.get("pageno"), (Integer)paramMap.get("pagesize"));
		
		Integer startIndex = page.getStartIndex();//开始行
		
		paramMap.put("startIndex", startIndex);
		
		List<BiaoMing> list = studentMapper.querybiaomingage(paramMap);
		
		Integer count = studentMapper.querybiaomingCount(paramMap);
		
		page.setDatas(list);
		
		page.setTotal(count);
		
		return page;
	}

	@Override
	public Page queryGradePage(Map<String, Object> paramMap) {
		Page page = new Page((Integer)paramMap.get("pageno"), (Integer)paramMap.get("pagesize"));
		
		Integer startIndex = page.getStartIndex();//开始行
		
		paramMap.put("startIndex", startIndex);
		
		List<BiaoMing> list = studentMapper.queryGradegage(paramMap);
		
		Integer count = studentMapper.queryGradeCount(paramMap);
		
		page.setDatas(list);
		
		page.setTotal(count);
		
		return page;
	}

	@Override
	public Student findPassword(Student student) {
		
		return studentMapper.queryByEmail(student);
	}
	
	
	
	
}
