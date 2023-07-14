package com.webproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
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
public class HomeController {
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	StoriesService storiesService;
	
	@Autowired
	ChapterService chapterService;

	
	@RequestMapping("home")
	public String listAdminStory(ModelMap model,
		      @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "6") int size) {
		try {
			List<Category> listCategories = categoryService.findAll();
			 Pageable paging = PageRequest.of(page - 1, size);
			 List<Stories> storiesCompleteList = storiesService.listStoriesComplete();
			 Page<Stories> listStoriesIncomplete = storiesService.listStoryPage(paging) ;
			 listStoriesIncomplete.getContent();
			 int totalPages = listStoriesIncomplete.getTotalPages();
				int currentPage = paging.getPageNumber() + 1;
				model.addAttribute("stories", listStoriesIncomplete.getContent());
				model.addAttribute("storiesComplete", storiesCompleteList);
				model.addAttribute("categories", listCategories);
				model.addAttribute("totalPages", totalPages);
				model.addAttribute("currentPage", currentPage);
				model.addAttribute("countChapter",chapterService);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return "home";
	}
	
	@RequestMapping("/404")
	public String page404() {
		return "404";
	}
	
}
