package com.webproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.webproject.entity.Category;
import com.webproject.entity.Chapter;
import com.webproject.entity.Stories;
import com.webproject.service.CategoryService;
import com.webproject.service.ChapterService;
import com.webproject.service.StoriesService;

@Controller
public class StoriesController {
	@Autowired
	CategoryService categoryService;

	@Autowired
	StoriesService storiesService;

	@Autowired
	ChapterService chapterService;

	@RequestMapping("{story_code}/{slug}")
	public String storiesHome(ModelMap model, @PathVariable("story_code") String story_code) {
		List<Category> categories = categoryService.findAll();
		Stories stories = storiesService.findStoryByStory_code(story_code);
		List<Chapter> chapters = chapterService.listChapterByStory_id(stories.getStory_id());
		model.addAttribute("story", stories);
		model.addAttribute("categories", categories);
		model.addAttribute("chapters", chapters);

		return "story";
	}

	@RequestMapping(value = "/top-chapter", method = RequestMethod.GET)
	public String topChapter(@RequestParam("start") int start, @RequestParam("end") int end, ModelMap model) {
		List<Stories> stories = null;
		if (end > 0) {
			stories = storiesService.storiesByChapter(start, end);
		} else if (end == -1) {
			end = Integer.MAX_VALUE;
			stories = storiesService.storiesByChapter(start, end);

		}
		model.addAttribute("stories", stories);
		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);

		return "top-chapter";
	}

	@RequestMapping("detail-story/{story_code}/{slug}/{chapter_slug}")
	public String detailStory(ModelMap model, @PathVariable("story_code") String story_code,@PathVariable("chapter_slug") String slug) {
		List<Category> categories = categoryService.findAll();
		Stories stories = storiesService.findStoryByStory_code(story_code);
		List<Chapter> chapters = chapterService.listChapterByStory_id(stories.getStory_id());
		Chapter contenChapter = chapterService.contentChapter(stories.getStory_id(), slug);
		model.addAttribute("contentChapter", contenChapter);
		model.addAttribute("story", stories);
		model.addAttribute("categories", categories);
		model.addAttribute("chapters", chapters);
		return "detail-story";

	}
	

	@RequestMapping("list-stories/{slug}")
	public String listStories(ModelMap model) {
		return "list-stories";
	}
}
