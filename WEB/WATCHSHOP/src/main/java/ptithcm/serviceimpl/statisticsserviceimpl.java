package ptithcm.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ptithcm.dao.statisticsdao;
import ptithcm.service.statisticsservice;

@Service
public class statisticsserviceimpl implements statisticsservice {
	@Autowired
	statisticsdao statisticsDao;
	
	@Override
	public long getProfitThisYear() {
		return statisticsDao.getProfitThisYear();
	}

	@Override
	public long getOrdersCountThisYear() {
		return statisticsDao.getOrdersCountThisYear();
	}

	@Override
	public long getUsersCount() {
		return statisticsDao.getUsersCount();
	}
	
	@Override
	public long[] getDetailProfitMonthOfYear(int year) {
		return statisticsDao.getDetailProfitMonthOfYear(year);
	}

	@Override
	public long amountSpentbyIdUser(long user_id) {
		return statisticsDao.amountSpentbyUserId(user_id);
	}

	@Override
	public long getPendingOrderCountbyIdUser(long user_id) {
		return statisticsDao.getPendingOrderCountbyUserId(user_id);
	}

	@Override
	public long getOrderSuccessCountbyIdUser(long user_id) {
		return statisticsDao.getOrderSuccessCountbyUserId(user_id);
	}
}
