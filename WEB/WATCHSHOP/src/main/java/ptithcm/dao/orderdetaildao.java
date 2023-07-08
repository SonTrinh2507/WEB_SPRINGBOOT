package ptithcm.dao;

import java.util.Collections;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import ptithcm.entity.order_detail;

@Controller
@Transactional
@SuppressWarnings("unchecked")
public class orderdetaildao {
	@Autowired
	SessionFactory factory;

	public long addOrderDetail(order_detail orderdetail) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(orderdetail);
			tx.commit();
		} catch (Exception e) {
			System.out.print(e);
			tx.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	public List<order_detail> dsOrder_detail() {
		Session session = factory.getCurrentSession();
		String hql = "FROM order_detail";
		Query query = session.createQuery(hql);
		List<order_detail> list = query.list();

		return list != null ? list : Collections.emptyList();
	}

	public List<order_detail> getOrder_detail(long order_id, String watch_id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM order_detail where order_id = :order_id and watch_id = :watch_id";
		Query query = session.createQuery(hql);
		query.setParameter("order_id", order_id);
		query.setParameter("watch_id", watch_id);
		List<order_detail> list = query.list();
		return list;

	}

	public long getTotal_detail(long order_id) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT SUM(A.price) FROM order_detail A  where order_id =:order_id";
		Query query = session.createQuery(hql);
		query.setParameter("order_id", order_id);
		if (query.uniqueResult() == null) {
			return 0;
		}
		long soluong = (long) query.uniqueResult();
		return soluong;
	}
}
