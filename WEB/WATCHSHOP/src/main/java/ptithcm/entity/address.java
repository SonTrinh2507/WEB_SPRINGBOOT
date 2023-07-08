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
import javax.persistence.Table;

@Entity
@Table(name = "address")
public class address {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "address_id")
	private long address_id;
	
	@Column(name = "receiver_name")
	private String receiver_name;
	
	@Column(name = "address")
	private String address;
	
	@Column(name = "phone")
	private String phone;
	
	@Column(name = "user_id")
	private long user_id;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@MapsId("user_id")
	@JoinColumn(name = "user_id")
	private users users;

	@OneToMany(mappedBy = "address")
	private Collection<orders> orders;
	
	public long getAddress_id() {
		return address_id;
	}

	public void setAddress_id(long address_id) {
		this.address_id = address_id;
	}

	public String getReceiver_name() {
		return receiver_name;
	}

	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

	public Collection<orders> getOrders() {
		return orders;
	}

	public void setOrders(Collection<orders> orders) {
		this.orders = orders;
	}

	public address(long address_id, String receiver_name, String address, String phone, long user_id,
			ptithcm.entity.users users, Collection<ptithcm.entity.orders> orders) {
		super();
		this.address_id = address_id;
		this.receiver_name = receiver_name;
		this.address = address;
		this.phone = phone;
		this.user_id = user_id;
		this.users = users;
		this.orders = orders;
	}

	public address() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	
}
