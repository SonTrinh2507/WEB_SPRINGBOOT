package com.webproject.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.webproject.entity.Chapter;

@Repository
public interface ChapterRepo extends JpaRepository<Chapter, Long>{
	@Query(value = "SELECT * FROM chapter where story_id = ? ORDER BY chapter_id ASC ", nativeQuery = true)
	List<Chapter> listChapterByStory_id(Long Story_id);
	
	@Query(value = "SELECT TOP(1) * FROM chapter WHERE story_id = ? ORDER BY date_update DESC ", nativeQuery = true)
	List<Chapter> getChapterNewUpdate(Long Story_id);
	
	@Query(value = "SELECT * FROM chapter WHERE story_id = ?1 AND slug = ?2", nativeQuery = true)
	Chapter contentChapter(Long story_id, String slug);
	
	@Query(value = "SELECT COUNT(*) FROM chapter WHERE story_id = ?", nativeQuery = true)
	int countChapter(Long story_id);
	
}
