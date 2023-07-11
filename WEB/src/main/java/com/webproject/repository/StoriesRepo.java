package com.webproject.repository;



import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.webproject.entity.Category_Story;
import com.webproject.entity.Stories;

@Repository
public interface StoriesRepo extends JpaRepository<Stories, Long>{
	@Query(value = "SELECT * FROM stories where story_code = ?", nativeQuery = true)
	Stories findStoryByStory_code(String story_code);
	

	@Query(value = "SELECT * FROM stories where total_chapter between ?1 and ?2 ", nativeQuery = true)
	List<Stories> storiesByChapter(int number_before, int number_after);
	
	@Query(value = "SELECT * FROM stories WHERE status = 2 ", nativeQuery = true)
	List<Stories> listStoriesComplete();
	
	@Query(value = "SELECT * FROM stories WHERE status = 0 or status = 1 ", nativeQuery = true)
	Page<Stories> listStoriesincomplete(Pageable page);
	
	@Query(value = "SELECT * FROM Stories s WHERE LOWER(s.story_name) LIKE LOWER(CONCAT('%', :keyword , '%'))", nativeQuery = true)
	List<Stories> findByStoryNameContainingIgnoreCase(String keyword);
	

}
