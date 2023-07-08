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
import javax.persistence.OneToMany;
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
@Table(name = "stories")
public class Stories implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long story_id;
	
	@Column
	private String story_code;
	
	@Column
	private String story_name;
	
	@Column
	private String story_picture;
	
	@Column
	private String status;
	
	@Column
	private Date story_datepost;
	
	
	@Column
	private String story_describe;
	
	@Column
	private int total_chapter;
	
	@Column
	private int total_reader;
	
	@Column
	private String slug;
	
	@Column
	private float agv_star;
		
	@Column
	private Long author_id;
	
	@OneToMany(mappedBy = "stories", fetch = FetchType.LAZY)
	private List<Category_Story> category_story;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "author_id", insertable = false, updatable = false)
	private  Author author;
	
	@OneToMany(mappedBy = "stories", fetch = FetchType.EAGER)
	private List<Chapter> chapter;
	
}
