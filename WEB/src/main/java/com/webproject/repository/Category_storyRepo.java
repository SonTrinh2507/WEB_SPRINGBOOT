package com.webproject.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.webproject.entity.Category_Story;
@Repository
public interface Category_storyRepo extends JpaRepository<Category_Story, Long>{
	@Query(value = "SELECT * FROM category_story where category_id = ?", nativeQuery = true)
	List<Category_Story> listStoriesByCategory_id(Long category_id);

}
