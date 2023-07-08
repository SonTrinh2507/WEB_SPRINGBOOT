package com.webproject.service;

import java.util.List;
import java.util.Optional;

import com.webproject.entity.Category_Story;
import com.webproject.entity.Stories;

public interface StoriesService {
	List<Stories> findAll();
	
	<S extends Stories> S save(S entity);
	
	Optional<Stories> findByStory_id(Long story_id);
	
	Stories findStoryByStory_code(String story_code);
	
	List<Stories> storiesByChapter(int number_before, int number_after);

	List<Stories> listStoriesComplete();
	


}
