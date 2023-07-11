package com.webproject.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "chapter")
public class Chapter implements Serializable{
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private Long chapter_id;
	
	@Column
	private String chapter_name;
	
	@Column
	private String chapter_content;
	
	@Column
	private String slug;
	
	@Column
	private Date date_update;
	
	@Column
	private Long story_id;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "story_id", insertable = false, updatable = false)
	private Stories stories;
	
}
