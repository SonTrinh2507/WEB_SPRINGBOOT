package com.webproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.webproject.entity.Category;
import com.webproject.entity.Category_Story;
import com.webproject.entity.Chapter;
import com.webproject.entity.Stories;
import com.webproject.service.CategoryService;
import com.webproject.service.Category_storyService;
import com.webproject.service.ChapterService;
import com.webproject.service.StoriesService;

@Controller
@RequestMapping("home")
public class HomeController {
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	StoriesService storiesService;
	
	@Autowired
	ChapterService chapterService;

	
	@RequestMapping("")
	public String homeController(ModelMap model) {
		List<Category> categories = categoryService.findAll();
		List<Stories> stories = storiesService.findAll();
		List<Stories> storiesComplete = storiesService.listStoriesComplete();
		model.addAttribute("HomeController",chapterService);			
		model.addAttribute("categories", categories);
		model.addAttribute("stories", stories);
		model.addAttribute("storiesComplete",storiesComplete);
		return "home";
	}
	
}
