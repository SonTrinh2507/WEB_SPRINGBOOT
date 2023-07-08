package ptithcm.entity;

import java.util.Collection;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "orders")
public class orders {
	@Id
	@GeneratedValue(strategy =  GenerationType.IDENTITY)
	@Column(name = "order_id")
	private long order_id;

	
	@Temporal(TemporalType.DATE)
	@Column(name = "order_day")
	private Date order_day;
	
	@Column(name = "total_price")
	private long total_price;
	
	@Column(name = "order_status")
	private int order_status;
	
	@Column(name = "user_id")
	private long user_id;
	
	
	@Column(name = "address_id")
	private long address_id;
	
	@Column(name = "user_delivery", nullable = true)
	private Long user_delivery;
	

	@Column(name = "user_accept", nullable = true)
	private Long user_accept;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@MapsId("address_id")
	@JoinColumn(name = "address_id")
	private address address;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_delivery",insertable = false, updatable =  false)
	private users users;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_accept",insertable = false, updatable =  false)
	private users usersAccept;
	
	
	@OneToMany(mappedBy = "orders", fetch = FetchType.EAGER)
	private Collection<order_detail> order_detail;

	public long getOrder_id() {
		return order_id;
	}

	public void setOrder_id(long order_id) {
		this.order_id = order_id;
	}

	

	public Date getOrder_day() {
		return order_day;
	}

	public void setOrder_day(Date order_day) {
		this.order_day = order_day;
	}

	

	public long getTotal_price() {
		return total_price;
	}

	public void setTotal_price(long total_price) {
		this.total_price = total_price;
	}

	public int getOrder_status() {
		return order_status;
	}

	public void setOrder_status(int order_status) {
		this.order_status = order_status;
	}

	public long getUser_id() {
		return user_id;
	}

	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}

	public users getUsers() {
		return users;
	}

	public void setUsers(users users) {
		this.users = users;
	}

	public Collection<order_detail> getOrder_detail() {
		return order_detail;
	}

	public void setOrder_detail(Collection<order_detail> order_detail) {
		this.order_detail = order_detail;
	}

	public long getAddress_id() {
		return address_id;
	}

	public void setAddress_id(long address_id) {
		this.address_id = address_id;
	}

	public address getAddress() {
		return address;
	}

	public void setAddress(address address) {
		this.address = address;
	}

	public Long getUser_delivery() {
		return user_delivery;
	}

	public void setUser_delivery(Long user_delivery) {
		this.user_delivery = user_delivery;
	}

	public Long getUser_accept() {
		return user_accept;
	}

	public void setUser_accept(Long user_accept) {
		this.user_accept = user_accept;
	}

	public users getUsersAccept() {
		return usersAccept;
	}

	public void setUsersAccept(users usersAccept) {
		this.usersAccept = usersAccept;
	}
	
	
	
	
}
