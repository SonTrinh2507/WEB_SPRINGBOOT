package com.webproject.service;

import com.webproject.entity.UserAdmin;

public interface UserAdminService {
	UserAdmin findByUsername(String username);

}
