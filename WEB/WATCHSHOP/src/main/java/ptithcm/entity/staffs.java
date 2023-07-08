package ptithcm.entity;

import java.util.Collection;
import java.sql.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "staffs")
public class staffs {
	@Id
	@GeneratedValue(strategy =  GenerationType.IDENTITY)
	@Column(name = "staff_id")
	private long staff_id;
	
	@Column(name = "staff_name")
	private String staff_name;
	
	@Column(name = "gender")
	private String gender;
	
	@Column(name = "birthday")
	private Date birthday;
	
	@Column(name = "address")
	private String address;
	
	@Column(name = "phone")
	private String phone;
	
	@Column(name = "user_id")
	private long user_id;
	
	@OneToOne
	@JoinColumn(name = "user_id",insertable =  false, updatable = false)
	private users users;
	
	@OneToMany(mappedBy = "staffs")
	private Collection<discount> discount;
	
	

	public Collection<discount> getDiscount() {
		return discount;
	}

	public void setDiscount(Collection<discount> discount) {
		this.discount = discount;
	}

	public long getStaff_id() {
		return staff_id;
	}

	public void setStaff_id(long staff_id) {
		this.staff_id = staff_id;
	}

	public String getStaff_name() {
		return staff_name;
	}

	public void setStaff_name(String staff_name) {
		this.staff_name = staff_name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
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
}
