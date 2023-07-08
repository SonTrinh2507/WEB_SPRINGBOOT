package com.webproject.service;

import java.util.List;

import com.webproject.entity.Category;

public interface CategoryService {
	List<Category> findAll();
	Category findCategory_nameBySlug(String slug);

}
