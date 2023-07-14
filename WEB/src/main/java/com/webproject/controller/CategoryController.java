package com.webproject.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webproject.entity.Category;
import com.webproject.entity.Category_Story;
import com.webproject.entity.Stories;
import com.webproject.service.CategoryService;
import com.webproject.service.Category_storyService;
import com.webproject.service.StoriesService;

@Controller
@RequestMapping("category")
public class CategoryController {
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	StoriesService storiesService;
	
	@Autowired
	Category_storyService category_storyService;
	
	@RequestMapping("{category_id}/{slug}")
	public String list(ModelMap model,@PathVariable("slug") String slug,@PathVariable("category_id") Long category_id,@RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "size", defaultValue = "5") int size) {

        PageRequest pageRequest = PageRequest.of(page - 1, size);

		 Page<Category_Story> storyPage = category_storyService.findByCategoryIdPage(category_id,pageRequest);		
		 model.addAttribute("stories", storyPage.getContent());
		 model.addAttribute("totalPages",storyPage.getTotalPages() );
		 model.addAttribute("currentPage", storyPage.getNumber() + 1);
		//List<Category_Story> category_Stories = category_storyService.listStoriesByCategory_id(category_id);
		List<Category> categories = categoryService.findAll();
		//model.addAttribute("stories", category_Stories);
		model.addAttribute("categories", categories);
		Category category = categoryService.findCategory_nameBySlug(slug);
		model.addAttribute("category_name",category.getCategory_name());
		return "category";

	}
}
