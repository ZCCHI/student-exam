package com.student.service;

import com.student.bean.Manager;

public interface ManagerService {

	Manager queryLoginManager(Manager man);

	int resetManagerPass(Manager manager);



}
