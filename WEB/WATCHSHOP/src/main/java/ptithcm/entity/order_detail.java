package ptithcm.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "order_detail")
public class order_detail {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "order_detail_id")
	private long order_detail_id;
	
	@Column(name = "order_id")
	private long order_id;
	

	@Column(name = "watch_id")
	private String watch_id;
	
	@Column(name = "quantity")
	private int quantity;
	
	@Column(name = "price")
	private long price;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@MapsId("order_id")
	@JoinColumn(name = "order_id")
	private orders orders;
	
	@ManyToOne
	@MapsId("watch_id")
	@JoinColumn(name = "watch_id")
	private watchs watchs;

	public long getOrder_id() {
		return order_id;
	}

	public void setOrder_id(long order_id) {
		this.order_id = order_id;
	}

	public String getWatch_id() {
		return watch_id;
	}

	public void setWatch_id(String watch_id) {
		this.watch_id = watch_id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	public orders getOrders() {
		return orders;
	}

	public void setOrders(orders orders) {
		this.orders = orders;
	}

	public watchs getWatchs() {
		return watchs;
	}

	public void setWatchs(watchs watchs) {
		this.watchs = watchs;
	}

	public long getOrder_detail_id() {
		return order_detail_id;
	}

	public void setOrder_detail_id(long order_detail_id) {
		this.order_detail_id = order_detail_id;
	}

	

	
	
	
}
