package ptithcm.serviceimpl;

import java.sql.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ptithcm.dao.discountdao;
import ptithcm.entity.discount;
import ptithcm.entity.discount_detail;
import ptithcm.service.discountservice;

@Service
public class discountserviceimpl implements discountservice{
	@Autowired
	discountdao discountdao;
	@Override
	public List<discount> dsDiscounts(){
		return discountdao.dsDiscount();
	}
	
	@Override
	public long getDiscountCount() {
		return discountdao.getDiscountCount();
	}
	
	
	@Override
	public boolean checkDiscountName(long discount_id,String discount_name) {
		return discountdao.checkDiscountName(discount_id, discount_name);
	}
	
	@Override
	public long addDiscount(discount discount) {
		return discountdao.addDiscount(discount);
	}
	
	@Override
	public List<discount_detail> getListDiscount_detail(){
		return discountdao.getListDiscount_detail();
	}
	
	@Override
	public boolean getDiscountByIdStaff(long discount_id) {
		return discountdao.getDiscountByIdStaff(discount_id);
	}
	
	@Override
	public Long getDiscount_idByWatch_id(String watch_id) {
		return discountdao.getDiscount_idByWatch_id(watch_id);
	}
	
	@Override
	public Long getPriceDiscountByWatch_id(String watch_id) {
		return discountdao.getPriceDiscountByWatch_id(watch_id);
	}
	
	@Override
	public Float getPercentWatch(long discount_id,String watch_id) {
		return discountdao.getPercentWatch(discount_id,watch_id);
	}
	
	@Override
	public List<Object[]> getStartAndEndDate(){
		return discountdao.getStartAndEndDate();
	}
	
	@Override
	public long addDiscount_detail(long discount_id, Date date_start, Date date_end) {
		return discountdao.addDiscount_detail(discount_id, date_start, date_end);
	}
	
	@Override
	public long deleteDiscount(long discount_id) {
		return discountdao.deleteDiscount(discount_id);
	}
	
	@Override
	public long deleteDiscount_detail(long discount_id) {
		return discountdao.deleteDiscount_detail(discount_id);
	}
}
