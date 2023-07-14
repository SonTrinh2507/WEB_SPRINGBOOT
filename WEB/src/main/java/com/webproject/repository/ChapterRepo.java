package com.webproject.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.webproject.entity.Chapter;

@Repository
@Transactional
public interface ChapterRepo extends JpaRepository<Chapter, Long>{
	@Query(value = "SELECT * FROM chapter where story_id = ? ORDER BY chapter_id ASC ", nativeQuery = true)
	List<Chapter> listChapterByStory_id(Long Story_id);
	
	@Query(value = "SELECT * FROM chapter WHERE story_id = ? ORDER BY date_update DESC LIMIT 1", nativeQuery = true)
	List<Chapter> getChapterNewUpdate(Long Story_id);
	
	@Query(value = "SELECT * FROM chapter WHERE story_id = ?1 AND slug = ?2", nativeQuery = true)
	Chapter contentChapter(Long story_id, String slug);
	
	@Query(value = "SELECT COUNT(*) FROM chapter WHERE story_id = ?", nativeQuery = true)
	int countChapter(Long story_id);
	
	@Modifying
	@Query(value = "DELETE FROM chapter WHERE story_id = ?1", nativeQuery = true)
	int deleteChapterByStory_id(Long story_id);
	
	
}
