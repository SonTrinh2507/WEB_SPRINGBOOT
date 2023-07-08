package com.webproject.service;

import java.util.List;

import com.webproject.entity.Category_Story;

public interface Category_storyService {
	List<Category_Story> listStoriesByCategory_id(Long category_id);
	


}
