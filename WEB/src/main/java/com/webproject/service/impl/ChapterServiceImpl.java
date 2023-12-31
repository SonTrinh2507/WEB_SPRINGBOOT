package com.webproject.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webproject.entity.Chapter;
import com.webproject.repository.ChapterRepo;
import com.webproject.service.ChapterService;

@Service
public class ChapterServiceImpl implements ChapterService {
	@Autowired
	ChapterRepo chapterRepo;

	@Override
	public List<Chapter> listChapterByStory_id(Long story_id) {
		return chapterRepo.listChapterByStory_id(story_id);
	}

	@Override
	public List<Chapter> getChapterNewUpdate(Long Story_id) {
		return chapterRepo.getChapterNewUpdate(Story_id);
	}

	@Override
	public Chapter contentChapter(Long story_id, String slug) {
		return chapterRepo.contentChapter(story_id, slug);
	}
	
	@Override
	public 	int countChapter(Long story_id) {
		return chapterRepo.countChapter(story_id);
	}
	
	@Override 
	public <S extends Chapter> S save(S entity) {
		return chapterRepo.save(entity);
	}
	
	@Override
	public void deleteById(Long chapter_id) {
		 chapterRepo.deleteById(chapter_id);
	}
	
	@Override
	public 	int deleteChapterByStory_id(Long story_id) {
		return chapterRepo.deleteChapterByStory_id(story_id);
	}

}
