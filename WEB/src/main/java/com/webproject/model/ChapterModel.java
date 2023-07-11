package com.webproject.model;

import java.util.Date;

import javax.validation.constraints.NotEmpty;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data

@AllArgsConstructor

@NoArgsConstructor
public class ChapterModel {
	
	@NotEmpty
private Long story_id;
	private String chapter_name;
	private String slug;
	private String chapter_content;
	

}
