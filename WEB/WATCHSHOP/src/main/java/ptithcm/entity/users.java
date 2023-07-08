package ptithcm.entity;

import java.util.Collection;
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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;


@Entity
@Table(name = "users")
public class users {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_id")
	private long user_id;

	@Column(name = "username")
	private String username;

	@Column(name = "password")
	private String password;

	@Column(name = "status")
	private String status;

	@Column(name = "role_id")
	private long role_id;

	@Column(name = "email")
	private String email;

	@Column(name = "phone")
	private String phone;

	@ManyToOne
	@MapsId("role_id")
	@JoinColumn(name = "role_id")
	private role role;

	@OneToOne(mappedBy = "users",fetch = FetchType.LAZY)
	private customer customer;

	@OneToOne(mappedBy = "users",fetch = FetchType.LAZY)
	private staffs staff;

	@OneToOne(mappedBy =  "users",fetch = FetchType.LAZY)
	private items items;
	
	@OneToMany(mappedBy = "user",fetch = FetchType.LAZY)
	private Collection<warranty_detail> warranty_detail;

	@OneToMany(mappedBy = "users",fetch = FetchType.EAGER)
	@Fetch(FetchMode.SELECT)
	private Collection<reviews> reviews;

	@OneToMany(mappedBy = "users", fetch = FetchType.EAGER)
	private Collection<address> address;
	
	@OneToMany(mappedBy = "users",fetch = FetchType.EAGER)
	@Fetch(FetchMode.SELECT)
	private Collection<orders> order;
	
	@OneToMany(mappedBy = "usersAccept",fetch = FetchType.EAGER)
	@Fetch(FetchMode.SELECT)
	private Collection<orders> orderAccept;

	@OneToMany(mappedBy = "users",fetch = FetchType.EAGER)
	@Fetch(FetchMode.SELECT)
	private Collection<bill> bills;

	
	
	public Collection<reviews> getReviews() {
		return reviews;
	}

	public void setReviews(Collection<reviews> reviews) {
		this.reviews = reviews;
	}

	public long getUser_id() {
		return user_id;
	}

	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		
		this.password = password;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public long getRole_id() {
		return role_id;
	}

	public void setRole_id(long role_id) {
		this.role_id = role_id;
	}

	public role getRole() {
		return role;
	}

	public void setRole(role role) {
		this.role = role;
	}

	public customer getCustomer() {
		return customer;
	}

	public void setCustomer(customer customer) {
		this.customer = customer;
	}

	public staffs getStaff() {
		return staff;
	}

	public void setStaff(staffs staff) {
		this.staff = staff;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Collection<warranty_detail> getWarranty_detail() {
		return warranty_detail;
	}

	public void setWarranty_detail(Collection<warranty_detail> warranty_detail) {
		this.warranty_detail = warranty_detail;
	}

	public items getItems() {
		return items;
	}

	public void setItems(items items) {
		this.items = items;
	}

	public Collection<address> getAddress() {
		return address;
	}

	public void setAddress(Collection<address> address) {
		this.address = address;
	}

	public Collection<orders> getOrder() {
		return order;
	}

	public void setOrder(Collection<orders> order) {
		this.order = order;
	}

	public Collection<orders> getOrderAccept() {
		return orderAccept;
	}

	public void setOrderAccept(Collection<orders> orderAccept) {
		this.orderAccept = orderAccept;
	}

	public Collection<bill> getBills() {
		return bills;
	}

	public void setBills(Collection<bill> bills) {
		this.bills = bills;
	}
	
	

	
	
}
