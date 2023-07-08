package ptithcm.dao;


import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import ptithcm.entity.watchs;

@Controller
@Transactional
@SuppressWarnings("unchecked")
public class homedao {
	@Autowired
	SessionFactory factory;

	public List<watchs> dswatchs() {
		Session session = factory.getCurrentSession();
		String hql = "FROM watchs";
		Query query = session.createQuery(hql);
		List<watchs> list = query.list();
		return list;
	}

	public watchs getWatchbyID(String watch_id) {
		Session session = factory.getCurrentSession();
		String hql = "From watchs WHERE watch_id = :watch_id";
		Query query = session.createQuery(hql);
		query.setParameter("watch_id", watch_id);
		List<watchs> list = query.list();
		if (list.isEmpty() == true) {
			return null;
		}
		return list.get(0);
	}

	public List<watchs> dsWatchbyBrandID(long brand_id, int pageNumber, int pagesize) {
		Session session = factory.getCurrentSession();
		String hql = "From watchs A WHERE A.brand_id = " + brand_id + " ORDER BY A.watch_id DESC";
		Query query = session.createQuery(hql);
		query.setFirstResult((pageNumber - 1) * pagesize);
		query.setMaxResults(pagesize);
		List<watchs> list = query.list();
		if (list.isEmpty() == false) {
			return list;
		}
		return null;
	}

	public List<watchs> findWatch(String key) {
		Session session = factory.getCurrentSession();
		String hql = "From watchs A WHERE A.describe LIKE :key OR A.watch_name LIKE :key";
		Query query = session.createQuery(hql);
		query.setParameter("key", "%" + key + "%");
		List<watchs> list = query.list();
		return list;
	}

	public List<watchs> watchPage(int pageNumber, int pagesize, String order, String dir) {
		Session session = factory.getCurrentSession();
		String hql = "FROM watchs ORDER BY " + order + " " + dir;
		Query query = session.createQuery(hql);
		query.setFirstResult((pageNumber - 1) * pagesize);
		query.setMaxResults(pagesize);
		List<watchs> list = query.list();
		return list;
	}

	public long getWatchCount() {
		Session session = factory.getCurrentSession();
		String hql = "SELECT count(watch_id) FROM watchs ";
		Query query = session.createQuery(hql);
		long soluong = (long) query.uniqueResult();
		return soluong;
	}

	public long getWatchCountOfBrand(long brand_id) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT count(A.watch_id) FROM watchs A WHERE A.brand_id = " + brand_id;
		Query query = session.createQuery(hql);
		long soluong = (long) query.uniqueResult();
		return soluong;
	}

	public long getWatchCountOfCompany(long company_id) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT count(A.watch_id) FROM watchs A WHERE A.company_id= " + company_id;
		Query query = session.createQuery(hql);
		long soluong = (long) query.uniqueResult();
		return soluong;
	}

	public long getWatchCountOfCategory(long category_id) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT count(A.watch_id) FROM watchs A WHERE A.category_id = " + category_id;
		Query query = session.createQuery(hql);
		long soluong = (long) query.uniqueResult();
		return soluong;
	}

	public int addWatch(watchs watch) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(watch);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	public List<watchs> watchPageOfHome(int pageNumber, int pagesize) {
		Session session = factory.getCurrentSession();
		String hql = "FROM watchs ORDER BY watch_id DESC";
		Query query = session.createQuery(hql);
		query.setFirstResult((pageNumber - 1) * pagesize);
		query.setMaxResults(pagesize);
		List<watchs> list = query.list();
		return list;
	}

//	 Xử lý cho phần giỏ hàng

	public int getWatchQuantybyID(String watch_id) {
		Session session = factory.getCurrentSession();
		String hql = "From watchs WHERE watch_id = :watch_id";
		Query query = session.createQuery(hql);
		query.setParameter("watch_id", watch_id);
		List<watchs> list = query.list();
		if (list.isEmpty() == true) {
			return -1;
		} else {
			return list.get(0).getTotal_quantity();
		}
	}
	
	public List<watchs> watchBestPrice() {
	    Session session = factory.getCurrentSession();
	    String hql = "FROM watchs w ORDER BY w.price DESC";
	    Query query = session.createQuery(hql);
	    query.setMaxResults(1);
	    List<watchs> results = query.list();
	    return results;

	}
}
