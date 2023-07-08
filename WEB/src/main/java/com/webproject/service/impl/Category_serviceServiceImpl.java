package com.webproject.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webproject.entity.Category_Story;
import com.webproject.repository.Category_storyRepo;
import com.webproject.service.Category_storyService;

@Service
public class Category_serviceServiceImpl implements Category_storyService{
	@Autowired
	Category_storyRepo category_storyRepo;
	
	@Override
	public List<Category_Story> listStoriesByCategory_id(Long category_id){
		return category_storyRepo.listStoriesByCategory_id(category_id);
	}


}
