package ptithcm.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ptithcm.entity.order_detail;

@Service
public interface orderdetailservice {
	@Autowired
	public long addOrderDetail(order_detail orderdetail);

	@Autowired
	public List<order_detail> dsOrder_detail() ;
	
	@Autowired
	public List<order_detail> getOrder_detail(long order_id, String watch_id);
	
	@Autowired
	public long getTotal_detail(long order_id);
}
