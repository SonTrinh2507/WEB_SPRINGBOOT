package com.webproject.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.webproject.entity.Category;
import com.webproject.entity.Category_Story;
import com.webproject.entity.Stories;

public interface Category_storyService {
	List<Category_Story> findByCategoryId(Long category_id);
	
	Page<Category_Story> findAll(Pageable page);
	
	<S extends Category_Story> S save(S entity);
	
	Page<Category_Story> findByCategoryIdPage(Long category_id,Pageable pageable);
	
	int deleteCategory_storyByStory_id(Long story_id);

}
