package com.student.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.student.bean.Manager;
import com.student.dao.ManagerMapper;
import com.student.service.ManagerService;
@Service
public class ManagerServiceImpl implements ManagerService {
	
	@Autowired
	private ManagerMapper managerMapper;

	@Override
	public Manager queryLoginManager(Manager man) {
		
		return managerMapper.queryLoginManager(man);
	}

	@Override
	public int resetManagerPass(Manager manager) {
		
		return managerMapper.updateManagerPassword(manager);
	}


	
	
}
