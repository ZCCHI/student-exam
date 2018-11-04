package com.student.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.student.bean.BiaoMing;
import com.student.bean.News;
import com.student.dao.NewsMapper;
import com.student.service.NewsService;
import com.student.utils.Page;
@Service
public class NewsServiceImpl implements NewsService {
	
	@Autowired
	private NewsMapper newsMapper;

	@Override
	public int saveNews(News news) {
		
		return newsMapper.saveNews(news);
	}

	@Override
	public Page queryPage(Map<String, Object> paramMap) {
		
		Page page = new Page((Integer)paramMap.get("pageno"), (Integer)paramMap.get("pagesize"));
		
		Integer startIndex = page.getStartIndex();//开始行
		
		paramMap.put("startIndex", startIndex);
		
		List<BiaoMing> list = newsMapper.queryPage(paramMap);
		
		Integer count = newsMapper.queryCount(paramMap);
		
		page.setDatas(list);
		
		page.setTotal(count);
		
		return page;
	}

	
	@Override
	public News queryContent(Integer id) {
				
		return newsMapper.selectByPrimaryKey(id);
	}

	@Override
	public int deleteNewsId(Integer id) {
		
		return newsMapper.deleteByPrimaryKey(id);
	}

	@Override
	public News queryNewsInfoById(Integer id) {
		
		return newsMapper.selectByPrimaryKey(id);
	}

	
	
}
