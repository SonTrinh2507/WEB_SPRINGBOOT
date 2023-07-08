package com.webproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webproject.entity.Category;
import com.webproject.entity.Stories;
import com.webproject.service.CategoryService;
import com.webproject.service.StoriesService;

@Controller
@RequestMapping("/add-stories/")
public class AdminAddStoriesController {
	

	
	@Autowired
	StoriesService storiesService;
	
	@RequestMapping("")
	public String formCreateStories(ModelMap model) {
		
		return "admin/addstories";
	}
}
