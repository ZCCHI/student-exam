package com.student.service;

import java.util.List;
import java.util.Map;

import com.student.bean.ExamRoom;
import com.student.utils.Page;

public interface ExamRoomService {

	Page queryPage(Map<String, Object> paramMap);

	int updateExamRoom(ExamRoom examRoom);

	List<ExamRoom> queryAllExamRoomInfo();

	ExamRoom queryExamInfoById(Integer id);

}
