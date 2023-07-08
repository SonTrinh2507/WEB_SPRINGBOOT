package ptithcm.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.MapsId;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "warranty")
public class warranty {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "warranty_id")
	private long warranty_id;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name = "start_day")
	private Date start_day;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name = "end_day")
	private Date end_day;

	@Column(name = "watch_id")
	private String watch_id;

	@Column(name = "order_detail_id")
	private long order_detail_id;
	
	@OneToMany(mappedBy = "warranty")
	private Collection<warranty_detail> warranty_detail;

	@OneToOne
	@MapsId("order_detail_id")
	@JoinColumn(name = "order_detail_id")
	private order_detail order_detail;

	
	@OneToOne
	@MapsId("watch_id")
	@JoinColumn(name = "watch_id")
	private watchs watchs;

	public long getWarranty_id() {
		return warranty_id;
	}

	public void setWarranty_id(long warranty_id) {
		this.warranty_id = warranty_id;
	}

	public Date getStart_day() {
		return start_day;
	}

	public void setStart_day(Date start_day) {
		this.start_day = start_day;
	}

	public Date getEnd_day() {
		return end_day;
	}

	public void setEnd_day(Date end_day) {
		this.end_day = end_day;
	}

	

	public String getWatch_id() {
		return watch_id;
	}

	public void setWatch_id(String watch_id) {
		this.watch_id = watch_id;
	}

	public watchs getWatchs() {
		return watchs;
	}

	public void setWatchs(watchs watchs) {
		this.watchs = watchs;
	}

	public Collection<warranty_detail> getWarranty_detail() {
		return warranty_detail;
	}

	public void setWarranty_detail(Collection<warranty_detail> warranty_detail) {
		this.warranty_detail = warranty_detail;
	}

	public long getOrder_detail_id() {
		return order_detail_id;
	}

	public void setOrder_detail_id(long order_detail_id) {
		this.order_detail_id = order_detail_id;
	}

	public order_detail getOrder_detail() {
		return order_detail;
	}

	public void setOrder_detail(order_detail order_detail) {
		this.order_detail = order_detail;
	}
	
	

}
