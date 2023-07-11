package com.webproject.controller;

import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.webproject.entity.Chapter;
import com.webproject.entity.Stories;
import com.webproject.model.ChapterModel;
import com.webproject.service.ChapterService;
import com.webproject.service.StoriesService;

@Controller
@RequestMapping("/admin")
public class AdminChapterController {

	@Autowired
	ChapterService chapterService;

	@Autowired
	StoriesService storiesService;

	@RequestMapping("/{story_id}/{slug}")
	public String chapterAdminPage(@PathVariable("story_id") Long story_id, ModelMap model) {
		Optional<Stories> stories = storiesService.findByStory_id(story_id);
		model.addAttribute("story", stories);
		return "admin/add-chapter";
	}

	@PostMapping("/editor")
	@ResponseBody
	public String processEditorContent(@RequestParam("chapter_name") String chapter_name,
	                                   @RequestParam("slug") String slug,
	                                   @RequestParam("chapter_content") String chapter_content,
	                                   @RequestParam("story_id") Long story_id) {
		
		chapter_content = chapter_content.replaceAll("<p[^>]*>", "").replaceAll("</p>", "").replaceAll("&nbsp;", "\n\n");
		Date currentDate = new Date();

	        Chapter chapter = new Chapter();
	        chapter.setStory_id(story_id);
	        chapter.setChapter_content(chapter_content);
	        chapter.setSlug(slug);
	        chapter.setChapter_name(chapter_name);
	        chapter.setDate_update(currentDate);
	        chapterService.save(chapter);
			 return "redirect:/admin/add-chapter";
	}
}
