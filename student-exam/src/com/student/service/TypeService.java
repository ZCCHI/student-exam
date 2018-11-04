package com.student.service;

import java.util.List;

import com.student.bean.Type;

public interface TypeService {

	Type queryTypeById(String id);

	List<Type> queryTypeByPId(String id);

}
