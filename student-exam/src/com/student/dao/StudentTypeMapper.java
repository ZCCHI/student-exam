package com.student.dao;

import com.student.bean.BiaoMing;
import com.student.bean.StudentType;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface StudentTypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(StudentType record);

    StudentType selectByPrimaryKey(Integer id);

    List<StudentType> selectAll();

    int updateByPrimaryKey(StudentType record);

	int saveStudentType(StudentType stuType);

	int getBiaoMingId();

	BiaoMing getBiaoMingInfo(Integer id);

	List<Map<String, Object>> queryBaoMingInfo(Integer id);

	int saveStudentGrade(StudentType studentType);

	int deleteStukaoshi(Integer id);

	List<Map<String, Object>> queryGradeStuInfo(Integer id);

	StudentType getStudentType(@Param("typeid")int currentSta, @Param("stuid")Integer id);
		
}