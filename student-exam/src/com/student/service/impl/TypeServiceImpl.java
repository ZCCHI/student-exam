package com.student.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.student.bean.Type;
import com.student.dao.TypeMapper;
import com.student.service.TypeService;
@Service
public class TypeServiceImpl implements TypeService {
	
	@Autowired
	private TypeMapper typeMapper;

	@Override
	public Type queryTypeById(String id) {
		
		return typeMapper.queryTypeById(id);
	}

	@Override
	public List<Type> queryTypeByPId(String id) {
		
		return typeMapper.queryTypeByPId(id);
	}
	
	
	
}
