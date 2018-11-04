package com.student.dao;

import com.student.bean.BiaoMing;
import com.student.bean.ExamRoom;
import java.util.List;
import java.util.Map;

public interface ExamRoomMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ExamRoom record);

    ExamRoom selectByPrimaryKey(Integer id);

    List<ExamRoom> selectAll();

    int updateByPrimaryKey(ExamRoom record);

	List<BiaoMing> querypage(Map<String, Object> paramMap);

	Integer queryCount(Map<String, Object> paramMap);

	int updateExamRoom(ExamRoom examRoom);

	List<ExamRoom> queryAllExamRoomInfo();
}