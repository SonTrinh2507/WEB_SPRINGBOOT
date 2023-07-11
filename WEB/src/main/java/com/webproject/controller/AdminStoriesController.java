package com.webproject.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webproject.entity.Category;
import com.webproject.entity.Category_Story;
import com.webproject.entity.Stories;
import com.webproject.service.CategoryService;
import com.webproject.service.Category_storyService;
import com.webproject.service.ChapterService;
import com.webproject.service.StoriesService;
import com.webproject.function.RandomCodeGenerator;

@Controller

@RequestMapping("/admin/")
public class AdminStoriesController {

	@Autowired
	StoriesService storiesService;

	@Autowired
	CategoryService categoryService;

	@Autowired
	Category_storyService category_storyService;
	
	@Autowired
	ChapterService chapterService;

	@RequestMapping("story")
	public String formCreateStories(ModelMap model) {
		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);
		return "admin/addstories";
	}

	@PostMapping("story-add")
	public String addStory(@ModelAttribute("stories") Stories stories,
			@RequestParam("category_id") List<Long> category_id) {
		Date currentDate = new Date();
		String randomStory_code = RandomCodeGenerator.generateRandomCode();
		stories.setStory_datepost(currentDate);
		stories.setStory_code(randomStory_code);
		Stories savedStories = storiesService.save(stories);
		if (savedStories != null) {
			for (Long idLong : category_id) {
				Category_Story category_Story = new Category_Story();
				category_Story.setCategory_id(idLong);
				category_Story.setStory_id(stories.getStory_id());
				category_storyService.save(category_Story);
			}
		}

		return "redirect:/admin/story";
	}

	@RequestMapping("list-story")
	public String listAdminStory(ModelMap model, Pageable pageable) {
		int pageSize = 6; // Số truyện hiển thị trên mỗi trang
		pageable = PageRequest.of(pageable.getPageNumber(), pageSize);
		Page<Stories> listStoriesIncomplete = storiesService.listStoriesincomplete(pageable);
		int totalPages = listStoriesIncomplete.getTotalPages();
		int currentPage = pageable.getPageNumber() + 1;
		model.addAttribute("stories", listStoriesIncomplete.getContent());
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("countChapter",chapterService);
		return "admin/list-story";
	}
	

	@SuppressWarnings("unused")
	private String formatDate(Date date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		return dateFormat.format(date);
	}

}
