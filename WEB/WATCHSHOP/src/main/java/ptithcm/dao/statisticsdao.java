package ptithcm.dao;

import java.util.Arrays;
import java.util.Calendar;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import ptithcm.entity.bill;

@Controller
@Transactional

public class statisticsdao {
	@Autowired
	SessionFactory factory;

	public long getProfitThisYear() {
		Session session = factory.getCurrentSession();
		int year = Calendar.getInstance().get(Calendar.YEAR);
		String hql = "SELECT SUM(A.total_price) FROM bill A  where YEAR(A.date) = " + year;
		Query query = session.createQuery(hql);
		if (query.uniqueResult() == null) {
			return 0;
		}
		long soluong = (long) query.uniqueResult();
		return soluong;
	}

	public long getOrdersCountThisYear() {
		Session session = factory.getCurrentSession();
		int year = Calendar.getInstance().get(Calendar.YEAR);
		String hql = "SELECT COUNT(A.order_id) FROM orders A WHERE YEAR(A.order_day) = " + year;
		Query query = session.createQuery(hql);
		if (query.uniqueResult() == null) {
			return 0;
		}
		long soluong = (long) query.uniqueResult();
		return soluong;
	}

	public long getUsersCount() {
		Session session = factory.getCurrentSession();
		String hql = "SELECT COUNT(user_id) FROM users WHERE role_id = 3 ";
		Query query = session.createQuery(hql);
		if (query.uniqueResult() == null) {
			return 0;
		}
		long soluong = (long) query.uniqueResult();
		return soluong;
	}

	@SuppressWarnings("deprecation")
	public long[] getDetailProfitMonthOfYear(int year) {
		Session session = factory.getCurrentSession();
		String hql = "FROM bill A WHERE  YEAR(A.date) = " + year;
		Query query = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<bill> list = query.list();

		long[] profitArr = new long[12];
		Arrays.fill(profitArr, 0);

		for (int i = 0; i < list.size(); i++) {
			int month = list.get(i).getDate().getMonth();
			profitArr[month] = profitArr[month] + list.get(i).getTotal_price();
		}
		return profitArr;

	}

	public long amountSpentbyUserId(long user_id) {
		Session session = factory.getCurrentSession();
		String hql = "select sum(total_price) from bill where user_id = " + user_id;
		Query query = session.createQuery(hql);
		if (query.uniqueResult() == null) {
			return 0;
		}
		long soluong = (long) query.uniqueResult();
		return soluong;
	}

	public long getPendingOrderCountbyUserId(long user_id) {
		Session session = factory.getCurrentSession();
		String hql = "select count(user_id) from orders where order_status = 1 and user_id = " + user_id;
		Query query = session.createQuery(hql);
		if (query.uniqueResult() == null) {
			return 0;
		}
		long soluong = (long) query.uniqueResult();
		return soluong;
	}

	public long getOrderSuccessCountbyUserId(long user_id) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT COUNT(A.user_id) FROM orders A WHERE A.order_status = 3 AND A.user_id = " + user_id;
		Query query = session.createQuery(hql);
		if (query.uniqueResult() == null) {
			return 0;
		}
		long soluong = (long) query.uniqueResult();
		return soluong;
	}

}
