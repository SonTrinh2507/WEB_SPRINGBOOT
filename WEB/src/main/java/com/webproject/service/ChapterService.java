package com.webproject.service;

import java.util.List;

import com.webproject.entity.Chapter;

public interface ChapterService {
	List<Chapter> listChapterByStory_id(Long story_id);
	
	List<Chapter> getChapterNewUpdate(Long Story_id);
	
	Chapter contentChapter(Long story_id, String slug);
	
	int countChapter(Long story_id);

	<S extends Chapter> S save(S entity);

}
