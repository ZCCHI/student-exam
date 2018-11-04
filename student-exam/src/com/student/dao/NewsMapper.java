package com.student.dao;

import com.student.bean.BiaoMing;
import com.student.bean.News;
import java.util.List;
import java.util.Map;

public interface NewsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(News record);

    News selectByPrimaryKey(Integer id);

    List<News> selectAll();

    int updateByPrimaryKey(News record);

	int saveNews(News news);

	List<BiaoMing> queryPage(Map<String, Object> paramMap);

	Integer queryCount(Map<String, Object> paramMap);
}