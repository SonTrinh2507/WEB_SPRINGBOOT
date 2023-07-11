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

@Service
public class Category_serviceServiceImpl implements Category_storyService{
	@Autowired
	Category_storyRepo category_storyRepo;
	
	@Override
	public Page<Category_Story> listStoriesByCategory_id(Long category_id,Pageable page){
		return category_storyRepo.listStoriesByCategory_id(category_id,page);
	}

	@Override
	public Page<Category_Story> findAll(Pageable page){
		return category_storyRepo.findAll(page);
	}
	
	@Override
	public 	<S extends Category_Story> S save(S entity) {
		return category_storyRepo.save(entity);
	}

}
