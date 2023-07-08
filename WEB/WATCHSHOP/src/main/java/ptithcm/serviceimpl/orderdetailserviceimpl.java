package ptithcm.serviceimpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ptithcm.dao.orderdetaildao;
import ptithcm.entity.order_detail;
import ptithcm.service.orderdetailservice;

@Service
public class orderdetailserviceimpl implements orderdetailservice {
	@Autowired
	orderdetaildao orderDetailDao;

	@Override
	public long addOrderDetail(order_detail orderdetail) {
		return orderDetailDao.addOrderDetail(orderdetail);
	}

	
	@Override
	public List<order_detail> dsOrder_detail() {
		return orderDetailDao.dsOrder_detail();
	}
	
	@Override
	public List<order_detail> getOrder_detail(long order_id, String watch_id){
		return orderDetailDao.getOrder_detail(order_id, watch_id);
	}
	
	@Override
	public long getTotal_detail(long order_id) {
		return orderDetailDao.getTotal_detail(order_id);
	}
}
