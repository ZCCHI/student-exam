package com.student.dao;

import com.student.bean.BiaoMing;
import com.student.bean.Student;
import java.util.List;
import java.util.Map;

public interface StudentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Student record);

    Student selectByPrimaryKey(Integer id);

    List<Student> selectAll();

    int updateByPrimaryKey(Student record);

	int saveStudent(Student student);

	Student queryLoginStudent(Student stu);

	Student queryExistLoginacct(String loginacct);

	List<Student> queryPage(Map<String, Object> paramMap);

	Integer queryCount(Map<String, Object> paramMap);

	int updateStudentPassword(Student student);

	int updateStudentInfo(Student stu);

	List<BiaoMing> querybiaomingage(Map<String, Object> paramMap);

	Integer querybiaomingCount(Map<String, Object> paramMap);

	List<BiaoMing> queryGradegage(Map<String, Object> paramMap);

	Integer queryGradeCount(Map<String, Object> paramMap);

	Student queryByEmail(Student student);
	
}