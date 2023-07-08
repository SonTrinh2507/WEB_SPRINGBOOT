package com.webproject.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.webproject.entity.UserAdmin;

@Repository
public interface UserRepo extends JpaRepository<UserAdmin, String> {
	UserAdmin findByUsername(String username);

}
