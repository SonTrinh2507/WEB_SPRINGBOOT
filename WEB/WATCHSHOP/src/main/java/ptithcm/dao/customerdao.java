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
import ptithcm.entity.customer;
import ptithcm.entity.staffs;
import ptithcm.entity.users;

@Transactional
@Controller
@SuppressWarnings("unchecked")
public class customerdao {
	@Autowired
	SessionFactory factory;

	public long updateCustomer(long customer_id, String customer_name, String gender, String address, String phone,
			Date birthday, long user_id) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE customer  A SET A.customer_name = :customer_name, A.gender = :gender, A.address = :address, A.birthday = :birthday, A.phone = :phone  WHERE A.customer_id = :customer_id and A.user_id = :user_id";
		Query query = session.createQuery(hql);
		query.setParameter("customer_name", customer_name);
		query.setParameter("gender", gender);
		query.setParameter("address", address);
		query.setParameter("birthday", birthday);

		query.setParameter("phone", phone);
		query.setParameter("customer_id", customer_id);
		query.setParameter("user_id", user_id);
		int result = query.executeUpdate();
		return result;
	}

	public customer getInfoCustomerLogin(long user_id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM  customer  where user_id =  " + user_id;
		Query query = session.createQuery(hql);
		List<customer> list = query.list();
		if (list.isEmpty() == false) {
			return list.get(0);
		}
		return null;
	}

	public long addCustomer(customer customer) {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.save(customer);
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

	public List<customer> CustomerPage(int pageNumber, int pagesize, String order, String dir) {
		Session session = factory.getCurrentSession();
		String hql = "FROM customer  ORDER BY " + order + " " + dir;
		Query query = session.createQuery(hql);
		query.setFirstResult((pageNumber - 1) * pagesize);
		query.setMaxResults(pagesize);
		List<customer> list = query.list();
		return list;
	}

	public List<customer> dsCustomer() {
		Session session = factory.getCurrentSession();
		String hql = "FROM customer ";
		Query query = session.createQuery(hql);
		List<customer> list = query.list();
		return list;
	}

	public boolean checkPhoneCustomerExist(String phone) {
		Session session = factory.getCurrentSession();
		String hql = "FROM customer  A WHERE A.phone = :phone";
		Query query = session.createQuery(hql);
		query.setParameter("phone", phone);
		List<users> list = query.list();
		if (list.isEmpty() == true) {
			return false;
		} else {
			return true;
		}
	}

	public customer updateCustomerAfterUpdate(long customer_id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM customer where customer_id = '" + customer_id + "'";
		Query query = session.createQuery(hql);
		List<customer> list = query.list();
		if (list.isEmpty() == false) {
			return list.get(0);
		}
		return null;
	}

	public long deleteCustomer(long customer_id) {
		Session session = factory.getCurrentSession();
		String hql = "DELETE FROM customer WHERE customer_id = :customer_id";
		Query query = session.createQuery(hql);
		query.setParameter("customer_id", customer_id);
		int result = query.executeUpdate();
		System.out.print("K lỗi");
		return result;
	}

	public boolean checkPhoneCustomer(String phone, long customer_id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM customer WHERE phone = :phone and customer_id = " + customer_id;
		Query query = session.createQuery(hql);
		query.setParameter("phone", phone);
		List<staffs> list = query.list();
		if (list.isEmpty() == true) {
			return false;
		} else {
			return true;
		}
	}

	public List<customer> searchCustomer(String key) {
		Session session = factory.getCurrentSession();
		String hql = "FROM customer A WHERE A.customer_name LIKE :key";
		Query query = session.createQuery(hql);
		query.setParameter("key", "%" + key + "%");
		List<customer> list = query.list();
		return list;
	}

	public long getCustomerCount() {
		Session session = factory.getCurrentSession();
		String hql = "SELECT Count(A.customer_id) FROM customer A";
		Query query = session.createQuery(hql);
		long soluong = (long) query.uniqueResult();
		return soluong;
	}

	public long searchCustomerCount(String key) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT Count(A.customer_id) FROM customer A WHERE A.customer_name LIKE :key";
		Query query = session.createQuery(hql);
		query.setParameter("key", "%" + key + "%");
		long soluong = (long) query.uniqueResult();
		return (int) soluong;
	}

}
