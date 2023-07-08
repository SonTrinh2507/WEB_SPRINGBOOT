package ptithcm.entity;

import java.util.Collection;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "watchs")
public class watchs {
	@Id
	@Column(name = "watch_id")
	private String watch_id;

	@Column(name = "watch_name")
	private String watch_name;

	@Column(name = "describe")
	private String describe;

	@Column(name = "picture")
	private String picture;

	@Column(name = "total_quantity")
	private int total_quantity;

	@Column
	private long price;
	
	@Column(name = "brand_id")
	private long brand_id;

	@Column(name = "category_id")
	private long category_id;

	@Column(name = "size")
	private String size;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "brand_id", insertable = false, updatable = false)
	private brands brands;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id", insertable = false, updatable = false)
	private category category;

	@OneToOne(mappedBy = "watchs")
	private warranty warranty;

	@OneToMany(mappedBy = "watchs", fetch = FetchType.LAZY)
	private Collection<discount_detail> discount_detail;

	@OneToMany(mappedBy = "watchs", fetch = FetchType.EAGER)
	private Collection<reviews> reviews;

	@OneToMany(mappedBy = "watchs",fetch = FetchType.LAZY)
	private Collection<item_detail> item_detail;

	@OneToMany(mappedBy = "watchs",fetch = FetchType.LAZY)
	private Collection<order_detail> order_detail;

	public String getWatch_id() {
		return watch_id;
	}

	public void setWatch_id(String watch_id) {
		this.watch_id = watch_id;
	}

	public String getWatch_name() {
		return watch_name;
	}

	public void setWatch_name(String watch_name) {
		this.watch_name = watch_name;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public int getTotal_quantity() {
		return total_quantity;
	}

	public void setTotal_quantity(int total_quantity) {
		this.total_quantity = total_quantity;
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	public long getBrand_id() {
		return brand_id;
	}

	public void setBrand_id(long brand_id) {
		this.brand_id = brand_id;
	}

	public long getCategory_id() {
		return category_id;
	}

	public void setCategory_id(long category_id) {
		this.category_id = category_id;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public brands getBrands() {
		return brands;
	}

	public void setBrands(brands brands) {
		this.brands = brands;
	}

	public category getCategory() {
		return category;
	}

	public void setCategory(category category) {
		this.category = category;
	}

	public warranty getWarranty() {
		return warranty;
	}

	public void setWarranty(warranty warranty) {
		this.warranty = warranty;
	}

	public Collection<discount_detail> getDiscount_detail() {
		return discount_detail;
	}

	public void setDiscount_detail(Collection<discount_detail> discount_detail) {
		this.discount_detail = discount_detail;
	}

	public Collection<reviews> getReviews() {
		return reviews;
	}

	public void setReviews(Collection<reviews> reviews) {
		this.reviews = reviews;
	}

	public Collection<item_detail> getItem_detail() {
		return item_detail;
	}

	public void setItem_detail(Collection<item_detail> item_detail) {
		this.item_detail = item_detail;
	}

	public Collection<order_detail> getOrder_detail() {
		return order_detail;
	}

	public void setOrder_detail(Collection<order_detail> order_detail) {
		this.order_detail = order_detail;
	}


	
	

}
