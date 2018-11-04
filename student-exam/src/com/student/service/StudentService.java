package com.student.service;

import java.util.Map;

import com.student.bean.Student;
import com.student.utils.Page;

public interface StudentService {

	int saveStudent(Student student);

	Student queryLoginStudent(Student stu);

	Student queryExistLoginacct(String loginacct);

	Page queryPage(Map<String, Object> paramMap);

	int deleteStudentById(Integer id);

	int rsPassword(Student student);

	int updateStudentInfo(Student stu);

	Page queryBiaoMingPage(Map<String, Object> paramMap);

	Page queryGradePage(Map<String, Object> paramMap);

	Student findPassword(Student student);

}
