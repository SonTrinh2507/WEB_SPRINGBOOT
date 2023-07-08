package com.webproject.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.microsoft.sqlserver.jdbc.StringUtils;
import com.webproject.entity.Category_Story;
import com.webproject.entity.Stories;
import com.webproject.repository.StoriesRepo;
import com.webproject.service.StoriesService;

@Service
public class StoriesServiceImpl implements StoriesService {
	@Autowired
	private StoriesRepo storiesRepo;

	@Override
	public List<Stories> findAll() {
		return storiesRepo.findAll();
	}

	@Override
	public <S extends Stories> S save(S entity) {
		return storiesRepo.save(entity);
	}

	@Override
	public Optional<Stories> findByStory_id(Long story_id) {
		return storiesRepo.findById(story_id);
	}

	@Override
	public Stories findStoryByStory_code(String story_code) {
		return storiesRepo.findStoryByStory_code(story_code);
	}

	@Override
	public List<Stories> storiesByChapter(int number_before, int number_after) {
		return storiesRepo.storiesByChapter(number_before, number_after);
	}
	
	@Override
	public 	List<Stories> listStoriesComplete(){
		return storiesRepo.listStoriesComplete();
	}
	
}