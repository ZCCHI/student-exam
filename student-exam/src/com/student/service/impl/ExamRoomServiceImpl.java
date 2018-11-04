package com.student.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.student.bean.BiaoMing;
import com.student.bean.ExamRoom;
import com.student.dao.ExamRoomMapper;
import com.student.service.ExamRoomService;
import com.student.utils.Page;
@Service
public class ExamRoomServiceImpl implements ExamRoomService {
	
	@Autowired
	private ExamRoomMapper examRoomMapper;

	@Override
	public Page queryPage(Map<String, Object> paramMap) {
		
		Page page = new Page((Integer)paramMap.get("pageno"), (Integer)paramMap.get("pagesize"));
		
		Integer startIndex = page.getStartIndex();//开始行
		
		paramMap.put("startIndex", startIndex);
		
		List<BiaoMing> list = examRoomMapper.querypage(paramMap);
		
		Integer count = examRoomMapper.queryCount(paramMap);
		
		page.setDatas(list);
		
		page.setTotal(count);
		
		return page;
	}

	@Override
	public int updateExamRoom(ExamRoom examRoom) {
		
		return examRoomMapper.updateExamRoom(examRoom);

	}

	@Override
	public List<ExamRoom> queryAllExamRoomInfo() {
		
		return examRoomMapper.selectAll();
	}

	@Override
	public ExamRoom queryExamInfoById(Integer id) {
		
		return examRoomMapper.selectByPrimaryKey(id);
	}

	
	
	
}
