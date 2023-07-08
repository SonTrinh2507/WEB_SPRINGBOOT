package ptithcm.dao;


import java.util.ArrayList;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import ptithcm.bean.productList;
import ptithcm.entity.item_detail;
import ptithcm.entity.items;

@Controller
@Transactional
@SuppressWarnings("unchecked")
public class itemdao {
	@Autowired
	SessionFactory factory;

	public List<items> findItemByIDUser(long userID) {
		Session session = factory.getCurrentSession();
		String hql = "FROM items A WHERE A.user_id = " + userID;
		Query query = session.createQuery(hql);
		List<items> list = query.list();
		if (list.isEmpty() == true) {
			return null;
		} else {
			return list;
		}
	}

	public long updateItem(long item_id, int total_quantity, long price, long user_id) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE items A SET A.total_quantity = :total_quantity, A.price =:price  WHERE A.item_id = :item_id AND A.user_id = :user_id ";
		Query query = session.createQuery(hql);
		query.setParameter("total_quantity", total_quantity);
		query.setParameter("price", price);
		query.setParameter("item_id", item_id);
		query.setParameter("user_id", user_id);
		int result = query.executeUpdate();
		return result;
	}

	public int addItem(items item) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(item);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	public int addItem_detail(item_detail item_detail) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(item_detail);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	public long updateItem_detail(long item_id, String watch_id, int quantity, long price) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE item_detail A SET A.quantity = :quantity, A.price =:price  WHERE A.item_id = :item_id AND A.watch_id = :watch_id ";
		Query query = session.createQuery(hql);
		query.setParameter("quantity", quantity);
		query.setParameter("price", price);
		query.setParameter("item_id", item_id);
		query.setParameter("watch_id", watch_id);
		int result = query.executeUpdate();
		return result;
	}

	public long deleteItem(long item_detail_id) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			String hql = "DELETE FROM item_detail A WHERE A.item_detail_id = " + item_detail_id;
			Query query = session.createQuery(hql);
			query.executeUpdate();
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	public long checkItem_detailExist(String watch_id, long item_id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM item_detail A WHERE A.item_id =:item_id AND A.watch_id =:watch_id";
		Query query = session.createQuery(hql);
		query.setParameter("item_id", item_id);
		query.setParameter("watch_id", watch_id);
		List<item_detail> list = query.list();
		if (list.size() > 0) {
			return list.size();
		} else {
			return 0;
		}
	}

	public Long getItem_idByUser_id(long user_id) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT A.item_id FROM items A WHERE A.user_id = :user_id";
		Query query = session.createQuery(hql);
		query.setParameter("user_id", user_id);
		Long result = (Long) query.uniqueResult();

		if (result == null) {
			return null;
		}

		return result;
	}

	public List<item_detail> getItem_detail(long item_id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM item_detail where item_id = :item_id ";
		Query query = session.createQuery(hql);
		query.setParameter("item_id", item_id);
		List<item_detail> list = query.list();
		return list;
	}

	public int getQuantity_detail(long item_id, String watch_id) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT A.quantity FROM item_detail A where item_id = :item_id AND watch_id = :watch_id ";
		Query query = session.createQuery(hql);
		query.setParameter("item_id", item_id);
		query.setParameter("watch_id", watch_id);
		int resut = (int) query.uniqueResult();
		return resut;
	}

	public int updateQuantity_detail(long item_detail_id, int quantity) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE item_detail A SET A.quantity =  :quantity where item_detail_id = " + item_detail_id;
		Query query = session.createQuery(hql);
		query.setParameter("quantity", quantity);

		int result = query.executeUpdate();
		return result;
	}

	public long getTotal_Price(long item_id) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT SUM(A.price*A.quantity) FROM item_detail A WHERE A.item_id = " + item_id;
		Query query = session.createQuery(hql);
		long resut = (long) query.uniqueResult();
		return resut;
	}

	public List<productList> getListDetail(List<Long> item_detail_id, List<String> picture, List<String> watch_name) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT B.item_detail_id, B.watch_id , B.quantity, B.price, A.picture, A.watch_name "
				+ "FROM watchs A " + "INNER JOIN A.item_detail B "
				+ "WHERE B.item_detail_id IN (:item_detail_id) AND A.picture IN (:picture) AND A.watch_name IN (:watch_name)";
		Query query = session.createQuery(hql);
		query.setParameterList("item_detail_id", item_detail_id);
		query.setParameterList("picture", picture);
		query.setParameterList("watch_name", watch_name);
		List<Object[]> rows = query.list();
		List<productList> list = new ArrayList<>();
		for (Object[] row : rows) {
			long id_item_detail = (long) row[0];
			String id = (String) row[1];
			int quantity = (int) row[2];
			long price = (long) row[3];
			String picturetemp = (String) row[4];
			String watch_nametemp = (String) row[5];
			list.add(new productList(id_item_detail, id, quantity, price, picturetemp, watch_nametemp));
		}
		return list;
	}

	public int getQuantityDetail(long item_detai_id) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT A.quantity FROM item_detail A where A.item_detail_id = :item_detai_id";
		Query query = session.createQuery(hql);
		query.setParameter("item_detai_id", item_detai_id);

		int resut = (int) query.uniqueResult();
		return resut;
	}

	
	
}
