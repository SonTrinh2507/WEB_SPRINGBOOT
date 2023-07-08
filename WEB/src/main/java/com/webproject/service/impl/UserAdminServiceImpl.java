package com.webproject.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webproject.entity.UserAdmin;
import com.webproject.repository.UserRepo;
import com.webproject.service.UserAdminService;

@Service
public class UserAdminServiceImpl implements UserAdminService {
	@Autowired
	UserRepo userRepo;
	
	@Override
	public UserAdmin findByUsername(String username) {
		return userRepo.findByUsername(username);
	}
	
}
