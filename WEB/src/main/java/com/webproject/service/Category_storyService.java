package com.webproject.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.webproject.entity.Category;
import com.webproject.entity.Category_Story;
import com.webproject.entity.Stories;

public interface Category_storyService {
	Page<Category_Story> listStoriesByCategory_id(Long category_id,Pageable pageable);
	
	Page<Category_Story> findAll(Pageable page);
	
	<S extends Category_Story> S save(S entity);
	

}
