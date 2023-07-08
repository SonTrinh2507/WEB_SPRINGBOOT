package ptithcm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public interface statisticsservice {
	@Autowired
	public long getProfitThisYear();
	
	@Autowired
	public long getOrdersCountThisYear();
	
	@Autowired
	public long getUsersCount();
	
	@Autowired
	public long[] getDetailProfitMonthOfYear(int year);
	
	@Autowired
	public long amountSpentbyIdUser (long user_id);
	
	@Autowired
	public long getPendingOrderCountbyIdUser (long user_id);
	
	@Autowired
	public long getOrderSuccessCountbyIdUser (long user_id);
	
}
