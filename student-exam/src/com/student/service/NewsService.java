package com.student.service;

import java.util.Map;

import com.student.bean.News;
import com.student.utils.Page;

public interface NewsService {

	int saveNews(News news);

	Page queryPage(Map<String, Object> paramMap);

	News queryContent(Integer id);

	int deleteNewsId(Integer id);

	News queryNewsInfoById(Integer id);

}
