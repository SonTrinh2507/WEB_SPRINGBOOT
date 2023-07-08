package ptithcm.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "item_detail")
public class item_detail{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "item_detail_id")
	private long item_detail_id;
	
	@Column(name = "item_id")
	private long item_id;
	
	@Column(name = "watch_id")
	private String watch_id;
	
	@Column(name = "quantity")
	private int quantity;
	
	@Column(name = "price")
	private long price;
	
	@ManyToOne
	@MapsId("item_id")
	@JoinColumn(name = "item_id")
	private items items;
	
	@ManyToOne
	@MapsId("watch_id")
	@JoinColumn(name = "watch_id")
	private watchs watchs;

	public long getItem_id() {
		return item_id;
	}

	public void setItem_id(long item_id) {
		this.item_id = item_id;
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

	public items getItems() {
		return items;
	}

	public void setItems(items items) {
		this.items = items;
	}

	



	public watchs getWatchs() {
		return watchs;
	}

	public void setWatchs(watchs watchs) {
		this.watchs = watchs;
	}

	public long getItem_detail_id() {
		return item_detail_id;
	}

	public void setItem_detail_id(long item_detail_id) {
		this.item_detail_id = item_detail_id;
	}
	
	
}