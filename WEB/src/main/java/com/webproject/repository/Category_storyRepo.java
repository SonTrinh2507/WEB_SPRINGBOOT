package com.webproject.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.webproject.entity.Category_Story;
@Repository
@Transactional
public interface Category_storyRepo extends JpaRepository<Category_Story, Long>{
	@Query(value = "SELECT * FROM category_story where category_id = ?1", nativeQuery = true)
	List<Category_Story> findByCategoryId(Long category_id);
	
	@Query(value = "SELECT * FROM category_story where category_id = ?1", nativeQuery = true)
	Page<Category_Story> findByCategoryIdPage(Long category_id,Pageable pageable);
	
	@Modifying
	@Query(value = "DELETE FROM category_story WHERE story_id = ?1", nativeQuery = true)
	int deleteCategory_storyByStory_id(Long story_id);


}
