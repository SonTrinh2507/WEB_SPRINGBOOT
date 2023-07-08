package com.webproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webproject.entity.UserAdmin;
import com.webproject.service.UserAdminService;

@Controller
@RequestMapping("/login/")
public class AdminLoginController {
	@Autowired
	UserAdminService userAdminService;
	
	 @GetMapping("admin")
	    public String showLoginPage(ModelMap model) {
		 
	        return "admin/login";
	    }
	 
	 @PostMapping("admin/signup")
	 public String loginAdmin(@RequestParam("username") String username, @RequestParam("password") String password,ModelMap model) {
		 
		 UserAdmin userAdmin = userAdminService.findByUsername(username);
		 if(userAdmin != null && userAdmin.getPassword().equals(password)) {
			 return "redirect:/home";
		 }else {
		 System.out.println("Sai");
		 return "redirect:/login/admin";
	 }
	 }
	
}
