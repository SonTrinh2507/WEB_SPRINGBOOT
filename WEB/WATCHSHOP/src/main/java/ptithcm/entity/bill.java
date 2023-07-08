package ptithcm.entity;


import java.util.Collection;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "bill")
public class bill {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "bill_id")
	private long bill_id;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name = "date")
	private Date date;
	
	@Column(name = "total_price")
	private long total_price;
	
	@Column(name = "order_id", insertable = false, updatable = false)
	private long order_id;
	
	@Column(name = "user_id",insertable = false,updatable = false)
	private long user_id;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private users users;
	public long getBill_id() {
		return bill_id;
	}

	public void setBill_id(long bill_id) {
		this.bill_id = bill_id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public long getTotal_price() {
		return total_price;
	}

	public void setTotal_price(long total_price) {
		this.total_price = total_price;
	}

	public long getOrder_id() {
		return order_id;
	}

	public void setOrder_id(long order_id) {
		this.order_id = order_id;
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
