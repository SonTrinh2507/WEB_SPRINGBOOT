package ptithcm.entity;

import java.util.Collection;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "brands")
public class brands {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "brand_id")
	private long brand_id;
	
	@Column(name = "brand_name")
	private String brand_name;
	
	@OneToMany(mappedBy = "brands",fetch = FetchType.EAGER)
	private Collection<watchs> watchs;

	public long getBrand_id() {
		return brand_id;
	}

	public void setBrand_id(long brand_id) {
		this.brand_id = brand_id;
	}

	public String getBrand_name() {
		return brand_name;
	}

	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}

	public Collection<watchs> getWatchs() {
		return watchs;
	}

	public void setWatchs(Collection<watchs> watchs) {
		this.watchs = watchs;
	}

	
	
	
}
