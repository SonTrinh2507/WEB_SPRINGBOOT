package ptithcm.service;

import java.sql.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ptithcm.entity.discount;
import ptithcm.entity.discount_detail;

@Service
public interface discountservice {
	@Autowired
	public List<discount> dsDiscounts();

	@Autowired
	public long getDiscountCount();


	@Autowired
	public boolean checkDiscountName(long discount_id, String discount_name);

	@Autowired
	public long addDiscount(discount discount);

	@Autowired
	public List<discount_detail> getListDiscount_detail();

	@Autowired
	public boolean getDiscountByIdStaff(long discount_id);

	@Autowired
	public Long getDiscount_idByWatch_id(String watch_id) ;
	
	@Autowired
	public Long getPriceDiscountByWatch_id(String watch_id);

	@Autowired
	public Float getPercentWatch(long discount_id,String watch_id);
	
	@Autowired
	public List<Object[]> getStartAndEndDate();
	
	@Autowired
	public long addDiscount_detail(long discount_id, Date date_start, Date date_end);
	
	@Autowired
	public long deleteDiscount(long discount_id);
	
	@Autowired
	public long deleteDiscount_detail(long discount_id);
}
