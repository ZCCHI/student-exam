package com.student.dao;

import com.student.bean.Manager;
import java.util.List;

public interface ManagerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Manager record);

    Manager selectByPrimaryKey(Integer id);

    List<Manager> selectAll();

    int updateByPrimaryKey(Manager record);

	Manager queryLoginManager(Manager man);

	int updateManagerPassword(Manager manager);
}