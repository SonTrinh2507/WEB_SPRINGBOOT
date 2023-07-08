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
import ptithcm.entity.staffs;
import ptithcm.entity.users;

@Transactional
@Controller
@SuppressWarnings("unchecked")
public class staffdao {
	@Autowired
	SessionFactory factory;

	public long updateStaff(long staff_id, String staff_name, String gender, String phone, Date birthday,
			String address, long user_id) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE staffs A set staff_name = :staff_name, gender = :gender, birthday = :birthday, A.address = :address, phone = :phone WHERE staff_id = :staff_id and user_id = :user_id";
		Query query = session.createQuery(hql);
		query.setParameter("staff_name", staff_name);
		query.setParameter("gender", gender);
		query.setParameter("birthday", birthday);
		query.setParameter("address", address);
		query.setParameter("phone", phone);
		query.setParameter("staff_id", staff_id);
		query.setParameter("user_id", user_id);

		long result = (long) query.executeUpdate();
		return result;
	}

	public long addStaff(staffs staff) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(staff);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
			System.out.print("lỗi");
			return 0;
		} finally {
			session.close();
		}
		System.out.print("không lỗi");
		return 1;
	}

	public long deleteStaff(long staff_id) {
		Session session = factory.getCurrentSession();
		String hql = "DELETE FROM staffs WHERE staff_id = " + staff_id;
		Query query = session.createQuery(hql);
		int result = query.executeUpdate();
		return result;
	}

	public List<staffs> searchStaff(String key) {
		Session session = factory.getCurrentSession();
		String hql = "From staffs A WHERE A.staff_name LIKE :key";
		Query query = session.createQuery(hql);
		query.setParameter("key", "%" + key + "%");
		List<staffs> list = query.list();
		return list;

	}

	public List<staffs> dsStaff() {
		Session session = factory.getCurrentSession();
		String hql = "FROM staffs ";
		Query query = session.createQuery(hql);
		List<staffs> list = query.list();
		return list;
	}

	public boolean checkPhoneStaffExist(String phone) {
		Session session = factory.getCurrentSession();
		String hql = "FROM staffs where phone = :phone";
		Query query = session.createQuery(hql);
		query.setParameter("phone", phone);
		List<staffs> list = query.list();
		if (list.isEmpty() == true) {
			return false;
		} else {
			return true;
		}
	}

	public boolean checkPhoneStaff(String phone, long satff_id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM staffs WHERE phone = :phone and staff_id = " + satff_id;
		Query query = session.createQuery(hql);
		query.setParameter("phone", phone);
		List<staffs> list = query.list();
		if (list.isEmpty() == true) {
			return false;
		} else {
			return true;
		}
	}

	public List<staffs> staffPage(int pageNumber, int pagesize, String order, String dir) {
		Session session = factory.getCurrentSession();
		String hql = "FROM staffs  ORDER BY " + order + " " + dir;
		Query query = session.createQuery(hql);
		query.setFirstResult((pageNumber - 1) * pagesize);
		query.setMaxResults(pagesize);
		List<staffs> list = query.list();
		return list;
	}

	public long getStaffCount() {
		Session session = factory.getCurrentSession();
		String hql = "SELECT count(staff_name) FROM staffs ";
		Query query = session.createQuery(hql);
		long soluong = (long) query.uniqueResult();
		return soluong;
	}

	public int searchStaffCount(String key) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT count(staff_id) From staffs A WHERE A.staff_name LIKE :key";
		Query query = session.createQuery(hql);
		query.setParameter("key", "%" + key + "%");
		long soluong = (long) query.uniqueResult();
		return (int) soluong;
	}

	public List<users> dsEmailofStaff() {
		Session session = factory.getCurrentSession();
		String hql = " from users A, staffs B where A.user_id = B.user_id";
		Query query = session.createQuery(hql);
		List<users> emails = query.list();
		return emails;
	}

}
