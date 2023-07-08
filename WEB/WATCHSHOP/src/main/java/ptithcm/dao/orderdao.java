package ptithcm.dao;

import java.util.Date;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import ptithcm.entity.address;
import ptithcm.entity.bill;
import ptithcm.entity.orders;

@Controller
@Transactional
@SuppressWarnings("unchecked")
public class orderdao {
	@Autowired
	SessionFactory factory;

	public List<orders> dsOrder() {
		Session session = factory.getCurrentSession();
		String hql = "FROM orders";
		Query query = session.createQuery(hql);
		List<orders> list = query.list();
		return list;
	}

	public List<orders> orderPage(int pageNumber, int pagesize, String order, String dir, int status) {
		Session session = factory.getCurrentSession();
		String hql = "FROM orders ORDER BY " + order + " " + dir;
		if (status > 0) {
			hql = "FROM orders WHERE order_status = " + status + " ORDER BY " + order + " " + dir;
		}
		Query query = session.createQuery(hql);
		query.setFirstResult((pageNumber - 1) * pagesize);
		query.setMaxResults(pagesize);
		List<orders> list = query.list();
		return list;
	}
	
	public List<orders> orderPageCustomer(int pageNumber, int pagesize, String order, String dir, int status,long user_id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM orders where user_id = " + user_id + " ORDER BY " + order + " " + dir;
		if (status > 0) {
			hql = "FROM orders WHERE user_id = " + user_id + " AND  order_status = " + status + " ORDER BY " + order + " " + dir;
		}
		Query query = session.createQuery(hql);
		query.setFirstResult((pageNumber - 1) * pagesize);
		query.setMaxResults(pagesize);
		List<orders> list = query.list();
		return list;
	}

	public List<orders> searchOrder(Date dateA, Date dateB) {
		Session session = factory.getCurrentSession();
		String hql = "From orders A WHERE A.order_day BETWEEN :dateA AND :dateB";
		Query query = session.createQuery(hql);
		query.setParameter("dateA", dateA);
		query.setParameter("dateB", dateB);
		List<orders> list = query.list();
		return list;
	}

	public boolean checkOrderOfUserExist(long order_id, long user_id) {
		Session session = factory.getCurrentSession();
		String hql = "From orders A WHERE A.user_id = " + user_id + " AND A.order_id = " + order_id;
		Query query = session.createQuery(hql);
		List<orders> list = query.list();
		if (list.isEmpty() == true) {
			return false;
		} else {
			return true;
		}
	}

	public boolean checkOldStatusExactly(int oldStatus, long order_id) {
		Session session = factory.getCurrentSession();
		String hql = "From orders A WHERE A.order_status = " + oldStatus + " AND A.order_id = " + order_id;
		Query query = session.createQuery(hql);
		List<orders> list = query.list();
		if (list.isEmpty() == true) {
			return false;
		} else {
			return true;
		}
	}

	public int saveOrder(int newStatus, long order_id) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE orders A SET order_status = " + newStatus + " WHERE A.order_id = " + order_id;
		Query query = session.createQuery(hql);
		int result = query.executeUpdate();
		return result;
	}

	public long addOrder(orders order) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(order);
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

	public long getOrderCount(int order_status) {
		Session session = factory.getCurrentSession();
		String hql;
		if (order_status > 0) {
			hql = "SELECT Count(A.order_id) FROM orders A WHERE A.order_status = :order_status";
		} else {
			hql = "SELECT Count(A.order_id) FROM orders A";
		}

		Query query = session.createQuery(hql);
		if (order_status > 0) {
			query.setParameter("order_status", order_status);
		}

		long soluong = (long) query.uniqueResult();
		return soluong;
	}
	
	public long getOrderCountCustomer(int order_status,long user_id) {
		Session session = factory.getCurrentSession();
		String hql;
		if (order_status > 0) {
			hql = "SELECT Count(A.order_id) FROM orders A WHERE A.order_status = :order_status AND user_id = :user_id";
		} else {
			hql = "SELECT Count(A.order_id) FROM orders A WHERE user_id = :user_id";
		}

		Query query = session.createQuery(hql);
		if (order_status > 0) {
			query.setParameter("order_status", order_status);
			query.setParameter("user_id", user_id);
		}
		query.setParameter("user_id", user_id);
		long soluong = (long) query.uniqueResult();
		return soluong;
	}

	public long setTotal_price(long order_id) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE orders set total_price = (select sum(A.price) from order_detail A  where A.order_id = :order_id )";
		Query query = session.createQuery(hql);
		query.setParameter("order_id", order_id);
		long result = query.executeUpdate();
		return result;
	}

	public long getOrder_idByUser_id(long user_id) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT A.order_id FROM orders A WHERE user_id = " + user_id;
		Query query = session.createQuery(hql);
		long soluong = (long) query.uniqueResult();
		return soluong;
	}

	public List<address> getAdressByUser_id(long user_id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM address A WHERE A.user_id = " + user_id;
		Query query = session.createQuery(hql);
		List<address> list = query.list();
		if (list.isEmpty() == true) {
			return null;
		}
		return list;
	}

	public long getOrder_idByAddress_id(long address_id) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT A.order_id FROM orders A WHERE A.address_id = " + address_id;
		Query query = session.createQuery(hql);
		long soluong = (long) query.uniqueResult();
		return soluong;
	}

	public long updateStatusOrderDelivery(long order_id, int order_status, long user_delivery) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE orders SET order_status = :order_status , user_delivery = :user_delivery WHERE order_id = :order_id";
		Query query = session.createQuery(hql);
		query.setParameter("order_status", order_status);
		query.setParameter("order_id", order_id);
		query.setParameter("user_delivery", user_delivery);
		int result = query.executeUpdate();
		return result;
	}

	public long updateStaffOrder(long order_id, int order_status, long user_accept) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE orders SET order_status = :order_status, user_accept = :user_accept WHERE order_id = :order_id";
		Query query = session.createQuery(hql);
		query.setParameter("order_status", order_status);
		query.setParameter("order_id", order_id);
		query.setParameter("user_accept", user_accept);
		int result = query.executeUpdate();
		return result;
	}

	public List<bill> getListBill() {
		Session session = factory.getCurrentSession();
		String hql = "FROM bill";
		Query query = session.createQuery(hql);
		List<bill> list = query.list();
		if (list.isEmpty() == true) {
			return null;
		}
		return list;
	}

	public List<orders> orderDelivery() {
		Session session = factory.getCurrentSession();
		String hql = "FROM orders";
		Query query = session.createQuery(hql);
		List<orders> list = query.list();
		if (list.isEmpty() == true) {
			return null;
		}
		return list;
	}

	public long updateQuantityCart(String watch_id, int quantity) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE watchs A SET A.total_quantity = A.total_quantity - :quantity WHERE A.watch_id = :watch_id";
		Query query = session.createQuery(hql);
		query.setParameter("watch_id", watch_id);
		query.setParameter("quantity", quantity); // Sửa tên tham số thành "quantity"
		int result = query.executeUpdate();
		return result;
	}

	public long addAddress(address address) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(address);
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

	public long deleteAddress(long address_id) {
		Session session = factory.getCurrentSession();
		String hql = "DELETE FROM address WHERE address_id = :address_id";
		Query query = session.createQuery(hql);
		query.setParameter("address_id", address_id);
		int result = query.executeUpdate();
		return result;
	}

	public long staffSuccessOrder(long order_id,long user_id) {
		Session session = factory.getCurrentSession();
		String hqlQuery = "INSERT INTO bill (date, total_price, order_id, user_id) "
				+ "SELECT CURRENT_DATE(), o.total_price, :order_id, :user_id "
				+ "FROM orders o WHERE o.order_id = :order_id";
		Query query = session.createQuery(hqlQuery);
		query.setParameter("order_id", order_id);
		query.setParameter("user_id", user_id);
		int result = query.executeUpdate();
		return result;
	}
}
