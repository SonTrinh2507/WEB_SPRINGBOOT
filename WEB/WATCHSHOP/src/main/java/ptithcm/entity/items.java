package ptithcm.entity;

import java.util.Collection;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.MapsId;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name = "items")
public class items {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "item_id")
	private long item_id;
		
	@Column(name = "user_id")
	private long user_id;

	@OneToMany(mappedBy =  "items",fetch = FetchType.LAZY)
	private Collection<item_detail> item_detail;
	
	@OneToOne
	@JoinColumn(name = "user_id")
	@MapsId("user_id")
	private users users;

	public long getItem_id() {
		return item_id;
	}

	public void setItem_id(long item_id) {
		this.item_id = item_id;
	}

	public long getUser_id() {
		return user_id;
	}

	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}

	public Collection<item_detail> getItem_detail() {
		return item_detail;
	}

	public void setItem_detail(Collection<item_detail> item_detail) {
		this.item_detail = item_detail;
	}

	public users getUsers() {
		return users;
	}

	public void setUsers(users users) {
		this.users = users;
	}
	
	
	
}
