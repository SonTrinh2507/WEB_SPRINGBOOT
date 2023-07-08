package ptithcm.dao;

import java.sql.Date;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import ptithcm.entity.discount;
import ptithcm.entity.discount_detail;

@Controller
@Transactional
@SuppressWarnings("unchecked")
public class discountdao {
	@Autowired
	SessionFactory factory;
	
	public List<discount> dsDiscount(){
		Session session = factory.getCurrentSession();
		String hql = "FROM discount ";
		Query query = session.createQuery(hql);
		List<discount> list = query.list();
		return list;
	}
	public long getDiscountCount() {
		Session session = factory.getCurrentSession();
		String hql = "SELECT Count(A.discount_id) FROM discount A";
		Query query = session.createQuery(hql);
		long soluong = (long) query.uniqueResult();
		return soluong;
	}
	
	public boolean checkDiscountName(long discount_id,String discount_name) {
		Session session = factory.getCurrentSession();
		String hql = "FROM discount WHERE discount_name = :discount_name AND discount_id <> " + discount_id;
		Query query = session.createQuery(hql);
		query.setParameter("discount_name", discount_name);
		List<discount> list = query.list();
		if(list.size()==0) {
			return false;
		}
		return true;
	}
	
	public long addDiscount(discount discount) {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.save(discount);
			transaction.commit();
		} catch (Exception e) {
			System.out.print(e);
			transaction.rollback();
			return 0;
			// TODO: handle exception
		} finally {
			session.close();

		}
		return 1;
	}
	
	
	public boolean getDiscountByIdStaff(long discount_id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM discount A, staff B where A.staff_id = B.staff_id and A.discount_id := discount_id";
		Query query = session.createQuery(hql);
		query.setParameter("discount_id", discount_id);
		List<discount> list = query.list();
		if (list.isEmpty() == true) {
			return false;
		} else {
			return true;
		}
	}
	
	public Long getPriceDiscountByWatch_id(String watch_id) {
		Session session = factory.getCurrentSession();
		String hql = "select A.price_discount from discount_detail A where A.watch_id = :watch_id";
		Query query = session.createQuery(hql);
		query.setParameter("watch_id",watch_id);
		Long gia = (Long) query.uniqueResult();
		
		return  gia;
	}
	
	public List<discount_detail> getListDiscount_detail(){
		Session session = factory.getCurrentSession();
		String hql = "FROM discount_detail A ";
		Query query = session.createQuery(hql);
		List<discount_detail> list = query.list();
		if(list.isEmpty()==true) {
			return null;
		}
		return list;
	}
	
	public Long getDiscount_idByWatch_id(String watch_id) {
		Session session = factory.getCurrentSession();
		String hql = "select A.discount_id from discount_detail A where A.watch_id = :watch_id";
		Query query = session.createQuery(hql);
		query.setParameter("watch_id",watch_id);
		Long gia = (Long) query.uniqueResult();
		
		return  gia;
	}
	
	
	public Float getPercentWatch(long discount_id,String watch_id) {
		Session session = factory.getCurrentSession();
		String hql = "select A.discount_percent from discount A, discount_detail B where A.discount_id = :discount_id AND B.watch_id = :watch_id";
		Query query = session.createQuery(hql);
		query.setParameter("discount_id",discount_id);
		query.setParameter("watch_id",watch_id);
		Float gia = (Float) query.uniqueResult();
		
		return  gia;
	}
	
	public List<Object[]> getStartAndEndDate() {
	    Session session = factory.getCurrentSession();
	    String hql = "SELECT DISTINCT A.date_start, A.date_end FROM discount_detail A";
	    Query query = session.createQuery(hql);
	    List<Object[]> results = query.list();
	    return results;
	}
	
	public long addDiscount_detail(long discount_id, Date date_start, Date date_end) {
	    Session session = factory.getCurrentSession();
	    String sql = "INSERT INTO discount_detail (discount_id, watch_id, date_start, date_end, price_discount) " +
	            "SELECT d.discount_id, w.watch_id, :date_start, :date_end, w.price * (1 - (d.discount_percent)) " +
	            "FROM discount d, watchs w " +
	            "WHERE d.discount_id = :discount_id";

	    try {
	        Query query = session.createSQLQuery(sql)
	                .setParameter("discount_id", discount_id)
	                .setParameter("date_start", date_start)
	                .setParameter("date_end", date_end);

	        int affectedRows = query.executeUpdate();
	        return affectedRows;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return 0;
	    }
	}
	
	public long deleteDiscount(long discount_id) {
		Session session = factory.getCurrentSession();
		String hql = "DELETE FROM discount where discount_id = :discount_id";
		Query query = session.createQuery(hql);
		query.setParameter("discount_id", discount_id);
		int result = query.executeUpdate();
		return result;
	}
	
	public long deleteDiscount_detail(long discount_id) {
		Session session = factory.getCurrentSession();
		String hql = "DELETE FROM discount_detail where discount_id = :discount_id";
		Query query = session.createQuery(hql);
		query.setParameter("discount_id", discount_id);
		int result = query.executeUpdate();
		return result;
	}
}
