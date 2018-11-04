package com.student.service;

import java.util.List;
import java.util.Map;

import com.student.bean.BiaoMing;
import com.student.bean.StudentType;

public interface StudentTypeService {

	int saveStudentType(StudentType stuType);

	int getBiaoMingId();

	BiaoMing getBiaoMingInfo(Integer id);

	List<Map<String, Object>> queryBaoMingInfo(Integer id);

	int saveStudentGrade(StudentType studentType);

	int deleteStukaoshi(Integer id);

	List<Map<String, Object>> queryGradeStuInfo(Integer id);

	StudentType getStudentType(int currentSta, Integer id);

	int deleteStudentTypeById(Integer id);

}
