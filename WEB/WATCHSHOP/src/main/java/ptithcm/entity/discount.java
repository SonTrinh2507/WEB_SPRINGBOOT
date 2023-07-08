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
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "discount")
public class discount {
	@Id
	@GeneratedValue(strategy =  GenerationType.IDENTITY)
	@Column(name = "discount_id")
	private long discount_id;
	
	@Column(name = "discount_name")
	private String discount_name;
	
	@Column(name = "staff_id")
	private long staff_id;
	
	@Column(name = "discount_percent")
	private float discount_percent;
			

	@ManyToOne
	@JoinColumn(name = "staff_id",insertable = false,updatable = false)
	private staffs staffs;

	
	@OneToMany(mappedBy = "discount",fetch = FetchType.LAZY)
	private Collection<discount_detail> discount_details;


	public long getDiscount_id() {
		return discount_id;
	}


	public void setDiscount_id(long discount_id) {
		this.discount_id = discount_id;
	}


	public String getDiscount_name() {
		return discount_name;
	}


	public void setDiscount_name(String discount_name) {
		this.discount_name = discount_name;
	}


	public long getStaff_id() {
		return staff_id;
	}


	public void setStaff_id(long staff_id) {
		this.staff_id = staff_id;
	}


	public staffs getStaff() {
		return staffs;
	}


	public void setStaff(staffs staffs) {
		this.staffs = staffs;
	}


	public Collection<discount_detail> getDiscount_details() {
		return discount_details;
	}


	public void setDiscount_details(Collection<discount_detail> discount_details) {
		this.discount_details = discount_details;
	}


	public staffs getStaffs() {
		return staffs;
	}


	public void setStaffs(staffs staffs) {
		this.staffs = staffs;
	}


	public float getDiscount_percent() {
		return discount_percent;
	}


	public void setDiscount_percent(float discount_percent) {
		this.discount_percent = discount_percent;
	}

	

	
	
}
