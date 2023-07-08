package com.webproject.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.webproject.entity.Category;

@Repository
public interface CategoryRepo extends JpaRepository<Category, Long> {
	@Query(value = "SELECT * FROM category where slug = ?", nativeQuery = true)
	Category findCategory_nameBySlug(String slug);
	
}
