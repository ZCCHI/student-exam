package com.student.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.student.bean.BiaoMing;
import com.student.bean.StudentType;
import com.student.dao.StudentTypeMapper;
import com.student.service.StudentTypeService;
@Service
public class StudentTypeServiceImpl implements StudentTypeService {
	
	@Autowired
	private StudentTypeMapper studentTypeMapper;

	@Override
	public int saveStudentType(StudentType stuType) {
		// TODO Auto-generated method stub
		return studentTypeMapper.saveStudentType(stuType);
	}

	@Override
	public int getBiaoMingId() {
		// TODO Auto-generated method stub
		return studentTypeMapper.getBiaoMingId();
	}

	@Override
	public BiaoMing getBiaoMingInfo(Integer id) {
		
		return studentTypeMapper.getBiaoMingInfo(id);
	}

	@Override
	public List<Map<String, Object>> queryBaoMingInfo(Integer id) {
		
		return studentTypeMapper.queryBaoMingInfo(id);
	}

	@Override
	public int saveStudentGrade(StudentType studentType) {
		
		return studentTypeMapper.saveStudentGrade(studentType);
	}

	@Override
	public int deleteStukaoshi(Integer id) {
		// TODO Auto-generated method stub
		return studentTypeMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<Map<String, Object>> queryGradeStuInfo(Integer id) {
	
		return studentTypeMapper.queryGradeStuInfo(id);
	}

	@Override
	public StudentType getStudentType(int currentSta, Integer id) {
		
		return studentTypeMapper.getStudentType(currentSta,id);
	}

	@Override
	public int deleteStudentTypeById(Integer id) {
		
		return studentTypeMapper.deleteByPrimaryKey(id);
	}


	
	
}
