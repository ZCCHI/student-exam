package com.student.dao;

import com.student.bean.Type;
import java.util.List;

public interface TypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Type record);

    Type selectByPrimaryKey(Integer id);

    List<Type> selectAll();

    int updateByPrimaryKey(Type record);

	Type queryTypeById(String id);

	List<Type> queryTypeByPId(String id);
}