package com.webproject.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webproject.entity.Category;
import com.webproject.repository.CategoryRepo;
import com.webproject.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService{
	@Autowired
	private CategoryRepo categoryRepo;
	
	@Override
	public List<Category> findAll() {
		return categoryRepo.findAll();
	}
	
	@Override
	public 	Category findCategory_nameBySlug(String slug) {
		return categoryRepo.findCategory_nameBySlug(slug);
	}
}
