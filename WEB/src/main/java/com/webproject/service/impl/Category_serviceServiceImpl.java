package com.webproject.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.webproject.entity.Category;
import com.webproject.entity.Category_Story;
import com.webproject.repository.Category_storyRepo;
import com.webproject.service.Category_storyService;
import com.webproject.service.StoriesService;

@Service
public class Category_serviceServiceImpl implements Category_storyService{
	@Autowired
	Category_storyRepo category_storyRepo;
	
	@Autowired
	StoriesService storiesService;
	
	@Override
	public List<Category_Story> findByCategoryId(Long category_id){
		return category_storyRepo.findByCategoryId(category_id);
	}

	@Override
	public Page<Category_Story> findAll(Pageable page){
		return category_storyRepo.findAll(page);
	}
	
	@Override
	public 	<S extends Category_Story> S save(S entity) {
		return category_storyRepo.save(entity);
	}
	@Override
	public 	Page<Category_Story> findByCategoryIdPage(Long category_id,Pageable pageable){
		return category_storyRepo.findByCategoryIdPage(category_id, pageable);
	}
	
	@Override
	public int deleteCategory_storyByStory_id(Long story_id) {
		return category_storyRepo.deleteCategory_storyByStory_id(story_id);
	}

}
