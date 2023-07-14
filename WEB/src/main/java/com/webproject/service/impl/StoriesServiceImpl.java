package com.webproject.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

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
	public Page<Stories> listStoryPage(Pageable page){
		return storiesRepo.listStoryPage(page);
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
	
	@Override
	public List<Stories> findByStoryNameContainingIgnoreCase(String keyword){
		return storiesRepo.findByStoryNameContainingIgnoreCase(keyword);
	}
	
	@Override
	public 	Page<Stories> listStoriesincomplete(Pageable pageable){
		return storiesRepo.listStoriesincomplete(pageable);
	}
	
	@Override
	public void updateStoriesStatus(Long story_id) {
		storiesRepo.updateStoriesStatus(story_id);
	}
	
	@Override
	public void deleteById(Long story_id) {
		 storiesRepo.deleteById(story_id);
	}

}
