package ptithcm.entity;

import java.sql.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "reviews")
public class reviews {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "review_id")
	private long review_id;
	
	@Column(name = "watch_id")
	private String watch_id;
	
	@Column(name = "user_id")
	private long user_id;
	@Column(name = "comments")
	private String comments;
	
	@Column(name = "star")
	private int star;
	

	@Column(name = "date")
	private Date date;
	
	@ManyToOne
	@JoinColumn(name = "watch_id", insertable = false,updatable = false)
	private watchs watchs;
	
	@ManyToOne
	@JoinColumn(name = "user_id", insertable = false,updatable = false)
	private users users;
	


	public reviews(String watch_id,long user_id, String comments, Date date, int star) {
		super();
		this.watch_id = watch_id;
		this.comments = comments;
		this.date = date;
		this.star = star;
		this.user_id = user_id;
	}
	public reviews() {
		super();
	}
	public String getWatch_id() {
		return watch_id;
	}
	public void setWatch_id(String watch_id) {
		this.watch_id = watch_id;
	}
	public long getUser_id() {
		return user_id;
	}
	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public watchs getWatchs() {
		return watchs;
	}
	public void setWatchs(watchs watchs) {
		this.watchs = watchs;
	}
	public users getUsers() {
		return users;
	}
	public void setUsers(users users) {
		this.users = users;
	}
	public long getReview_id() {
		return review_id;
	}
	public void setReview_id(long review_id) {
		this.review_id = review_id;
	}
	
	
}
