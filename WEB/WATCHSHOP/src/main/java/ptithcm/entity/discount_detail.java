package ptithcm.entity;

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
import javax.persistence.Table;

@Entity
@Table(name = "discount_detail")
public class discount_detail {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "discount_detail_id")
	private long discount_detail_id;
	
	
	@Column(name = "discount_id")
	private long discount_id;
	
	@Column(name = "watch_id")
	private String watch_id;
	
	@Column(name = "date_start")
	private Date date_start;
	
	@Column(name = "date_end")
	private Date date_end;
	
	@Column(name = "price_discount")
	private long price_discount;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "watch_id")
	@MapsId("watch_id")
	private watchs watchs;
	
	@ManyToOne (fetch = FetchType.LAZY)
	@JoinColumn(name = "discount_id")
	@MapsId("watch_id")
	private discount discount;

	public long getDiscount_id() {
		return discount_id;
	}

	public void setDiscount_id(long discount_id) {
		this.discount_id = discount_id;
	}

	public String getWatch_id() {
		return watch_id;
	}

	public void setWatch_id(String watch_id) {
		this.watch_id = watch_id;
	}

	public Date getDate_start() {
		return date_start;
	}

	public void setDate_start(Date date_start) {
		this.date_start = date_start;
	}

	public Date getDate_end() {
		return date_end;
	}

	public void setDate_end(Date date_end) {
		this.date_end = date_end;
	}

	public long getPrice_discount() {
		return price_discount;
	}

	public void setPrice_discount(long price_discount) {
		this.price_discount = price_discount;
	}

	public watchs getWatchs() {
		return watchs;
	}

	public void setWatchs(watchs watchs) {
		this.watchs = watchs;
	}

	public discount getDiscount() {
		return discount;
	}

	public void setDiscount(discount discount) {
		this.discount = discount;
	}

	public long getDiscount_detail_id() {
		return discount_detail_id;
	}

	public void setDiscount_detail_id(long discount_detail_id) {
		this.discount_detail_id = discount_detail_id;
	}


	
}
