package ptithcm.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "warranty_detail")
public class warranty_detail {
	@Id
	@Column(name = "warranty_id")
	private long warranty_id;

	@Column(name = "user_id")
	private long user_id;

	@Column(name = "status")
	private String status;
	@ManyToOne
	@JoinColumn(name = "warranty_id", insertable = false, updatable = false)
	private warranty warranty;

	@ManyToOne
	@JoinColumn(name = "user_id", insertable = false, updatable = false)
	private users user;

	public long getWarranty_id() {
		return warranty_id;
	}

	public void setWarranty_id(long warranty_id) {
		this.warranty_id = warranty_id;
	}

	public long getUser_id() {
		return user_id;
	}

	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public warranty getWarranty() {
		return warranty;
	}

	public void setWarranty(warranty warranty) {
		this.warranty = warranty;
	}

	public users getUser() {
		return user;
	}

	public void setUser(users user) {
		this.user = user;
	}

}
