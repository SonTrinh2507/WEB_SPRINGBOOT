package com.webproject.controller;

import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StreamUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.webproject.entity.Category;
import com.webproject.entity.Category_Story;
import com.webproject.entity.Chapter;
import com.webproject.entity.Stories;
import com.webproject.model.ChapterModel;
import com.webproject.service.CategoryService;
import com.webproject.service.Category_storyService;
import com.webproject.service.ChapterService;
import com.webproject.service.StoriesService;

@Controller
@RequestMapping("/admin")
public class AdminChapterController {

	@Autowired
	ChapterService chapterService;

	@Autowired
	StoriesService storiesService;
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	Category_storyService category_storyService;
	
	@RequestMapping("/list-chapter/{story_code}")
	public String listChapter(ModelMap model, @PathVariable("story_code") String story_code) {
		List<Category> categories = categoryService.findAll();
		Stories stories = storiesService.findStoryByStory_code(story_code);
		List<Chapter> chapters = chapterService.listChapterByStory_id(stories.getStory_id());	
		int total_chapter = chapterService.countChapter(stories.getStory_id());
		model.addAttribute("countChapter",total_chapter);
		model.addAttribute("story", stories);
		model.addAttribute("categories", categories);
		model.addAttribute("chapters", chapters);				
		return "admin/list-chapter";
	}

	@RequestMapping("/{story_id}/{slug}")
	public String chapterAdminPage(@PathVariable("story_id") Long story_id, ModelMap model) {
		Optional<Stories> stories = storiesService.findByStory_id(story_id);
		model.addAttribute("story", stories);
		return "admin/add-chapter";
	}

	@PostMapping("/editor")
	public String processEditorContent(@RequestParam("chapter_name") String chapter_name,
	                                   @RequestParam("slug") String slug,
	                                   @RequestParam("chapter_content") String chapter_content,
	                                   @RequestParam("story_code") String story_code,
	                                   @RequestParam("story_id") Long story_id,
	                                   @RequestParam("chapter_theme") String chapter_theme
			) {
		
		chapter_content = chapter_content.replaceAll("<p[^>]*>", "").replaceAll("</p>", "").replaceAll("&nbsp;", "\n\n");
			Date currentDate = new Date();
			int chapter_total = chapterService.countChapter(story_id);
			

			Stories stories = storiesService.findStoryByStory_code(story_code);
	        System.err.println("Thêm chương mới: " + chapter_total);
	        int total = stories.getTotal_chapter() - 1;
	        System.err.println("Thêm chương mới status: " + total);
			if(chapter_total == total) {
				Chapter chapter = new Chapter();
		        chapter.setStory_id(story_id);
		        chapter.setChapter_content(chapter_content);
		        chapter.setSlug(slug);
		        chapter.setChapter_name(chapter_name);
		        chapter.setDate_update(currentDate);
		        chapter.setChapter_theme(chapter_theme);
		        chapterService.save(chapter);
				storiesService.updateStoriesStatus(story_id);
		        System.err.println("Thêm chương mới status");
			} else{				
				Chapter chapter = new Chapter();
		        chapter.setStory_id(story_id);
		        chapter.setChapter_content(chapter_content);
		        chapter.setSlug(slug);
		        chapter.setChapter_name(chapter_name);
		        chapter.setDate_update(currentDate);
		        chapter.setChapter_theme(chapter_theme);
		        chapterService.save(chapter);
		      
			}
	        String href = "redirect:/admin/list-chapter/" +story_code;
			 return href;
	}
	
	@PostMapping("/delete/{story_code}/{chapter_id}")
	public String deleteChapter(@PathVariable("story_code") String story_code, @PathVariable("chapter_id") Long chapter_id) {
	    chapterService.deleteById(chapter_id);    
	    String href = "redirect:/admin/list-chapter/" +story_code;
	    return href;
	}
}
