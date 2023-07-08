package ptithcm.dao;

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
public class userdao {
	@Autowired
	SessionFactory factory;

	public boolean checkLogin(String username, String password) {
		Session session = factory.getCurrentSession();
		String hql = "FROM users  where username = '" + username + "' AND password = '" + password + "'";
		Query query = session.createQuery(hql);
		List<users> list = query.list();
		if (list.isEmpty() == false) {
			return true;
		}
		return false;
	}

	public users getLogin(String username, String password) {
		Session session = factory.getCurrentSession();
		String hql = "FROM users  where username = '" + username + "' AND password = '" + password + "'";
		Query query = session.createQuery(hql);
		List<users> list = query.list();
		if (list.isEmpty() == false) {
			return list.get(0);
		}
		return null;
	}

	public users getInfoLogin(String username, String password) {
		Session session = factory.getCurrentSession();
		String hql = "FROM users  where role_id = 1 and username = '" + username + "' AND password = '" + password+ "'";
		Query query = session.createQuery(hql);
		List<users> list = query.list();
		if (list.isEmpty() == false) {
			return list.get(0);
		}
		return null;
	}

	public users getInfoCustomerLogin(String username, String password) {
		Session session = factory.getCurrentSession();
		String hql = "FROM users  where role_id = 3 and username = '" + username + "' AND password = '" + password+ "'";
		Query query = session.createQuery(hql);
		List<users> list = query.list();
		if (list.isEmpty() == false) {
			return list.get(0);
		}
		return null;
	}

	public staffs getInfoStaffLogin(long user_id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM  staffs  where user_id =  " + user_id;
		Query query = session.createQuery(hql);
		List<staffs> list = query.list();
		if (list.isEmpty() == false) {
			return list.get(0);
		}
		return null;
	}

	public users updateUserAfterUpdate(String username) {
		Session session = factory.getCurrentSession();
		String hql = "FROM users where username = '" + username + "'";
		Query query = session.createQuery(hql);
		List<users> list = query.list();
		if (list.isEmpty() == false) {
			return list.get(0);
		}
		return null;
	}

	public staffs updateStaffAfterUpdate(long staff_id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM staffs where staff_id = '" + staff_id + "'";
		Query query = session.createQuery(hql);
		List<staffs> list = query.list();
		if (list.isEmpty() == false) {
			return list.get(0);
		}
		return null;
	}

	public List<users> dsUser() {
		Session session = factory.getCurrentSession();
		String hql = "FROM users A ORDER BY A.user_id";
		Query query = session.createQuery(hql);
		List<users> list = query.list();
		return list;
	}

	public List<users> dsUserByRole() {
		Session session = factory.getCurrentSession();
		String hql = "FROM users A where A.role_id = 1 or A.role_id = 2";
		Query query = session.createQuery(hql);
		List<users> list = query.list();
		return list;
	}

	public long getUserCount() {
		Session session = factory.getCurrentSession();
		String hql = "SELECT count(A.customer_name) FROM customer A ";
		Query query = session.createQuery(hql);
		long soluong = (long) query.uniqueResult();
		return soluong;
	}

	public int updateUserCustomer(long user_id, String email, String phone, String status, long role_id) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE users  A SET  A.email = :email, A.phone = :phone, A.status = :status, A.role_id = :role_id WHERE A.user_id = :user_id";
		Query query = session.createQuery(hql);
		query.setParameter("email", email);
		query.setParameter("phone", phone);
		query.setParameter("status", status);
		query.setParameter("role_id", role_id);
		query.setParameter("user_id", user_id);
		int result = query.executeUpdate();
		if (result == 0) {
			return 0;
		}
		System.out.print("K lỗi");
		return result;
	}

	public int updateUserStaff(long user_id, String email, String phone, String status, long role_id) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE users  A SET  A.email = :email, A.phone = :phone, A.status = :status, A.role_id = :role_id WHERE A.user_id = :user_id";
		Query query = session.createQuery(hql);
		query.setParameter("email", email);
		query.setParameter("phone", phone);
		query.setParameter("status", status);
		query.setParameter("role_id", role_id);
		query.setParameter("user_id", user_id);
		int result = query.executeUpdate();
		if (result == 0) {
			return 0;
		}
		System.out.print("K lỗi");
		return result;
	}

	public long updateUser(long user_id, String email, String phone) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE users  A SET  A.email = :email, A.phone = :phone WHERE A.user_id = :user_id";
		Query query = session.createQuery(hql);
		query.setParameter("email", email);
		query.setParameter("phone", phone);
		query.setParameter("user_id", user_id);
		int result = query.executeUpdate();
		return result;

	}

	public boolean checkUsernameExist(String username) {
		Session session = factory.getCurrentSession();
		String hql = "FROM users A WHERE A.username = :username";
		Query query = session.createQuery(hql);
		query.setParameter("username", username);
		List<users> list = query.list();
		if (list.isEmpty() == true) {
			return false;
		} else {
			return true;
		}
	}

	public String getStatusUserByUsername(String username) {
		Session session = factory.getCurrentSession();
		String hql = "SELECt A.status FROM users A WHERE A.username = :username ";
		Query query = session.createQuery(hql);
		query.setParameter("username", username);
		String status = (String) query.uniqueResult();
		System.out.print(status);
		return (String) status;
	}

	public boolean checkEmailExist(String email) {
		Session session = factory.getCurrentSession();
		String hql = "FROM users A WHERE A.email = :email";
		Query query = session.createQuery(hql);
		query.setParameter("email", email);
		List<users> list = query.list();
		if (list.isEmpty() == true) {
			return false;
		} else {
			return true;
		}
	}

	public boolean checkEmailCustomer(String email, long user_id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM users A WHERE A.email = :email and A.user_id = " + user_id;
		Query query = session.createQuery(hql);
		query.setParameter("email", email);
		List<users> list = query.list();
		if (list.isEmpty() == true) {
			return false;
		} else {
			return true;
		}
	}

	public boolean checkPhoneExist(String phone) {
		Session session = factory.getCurrentSession();
		String hql = "FROM users  A WHERE A.phone = :phone";
		Query query = session.createQuery(hql);
		query.setParameter("phone", phone);
		List<users> list = query.list();
		if (list.isEmpty() == true) {
			return false;
		} else {
			return true;
		}
	}

	public boolean checkPhoneCustomer(String phone, long user_id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM users A WHERE A.phone = :phone and A.user_id = " + user_id;
		Query query = session.createQuery(hql);
		query.setParameter("phone", phone);
		List<users> list = query.list();
		if (list.isEmpty() == true) {
			return false;
		} else {
			return true;
		}
	}

	public boolean checkIDandUsernameExist(String username, long idUser) {
		Session session = factory.getCurrentSession();
		String hql = "FROM users A WHERE A.username = :username AND A.user_id = " + idUser;
		Query query = session.createQuery(hql);
		query.setParameter("username", username);

		List<users> list = query.list();
		if (list.isEmpty() == true) {
			return false;
		} else {
			return true;
		}
	}

	public int addAccount(users account) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(account);
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
		int id = (int) account.getUser_id();
		return id;
	}

	public users checkInfoGetPasswordExist(String username, String email) {
		Session session = factory.getCurrentSession();
		String hql = "FROM users  A WHERE A.username = :username AND A.email = :email";
		Query query = session.createQuery(hql);
		query.setParameter("username", username);
		query.setParameter("email", email);
		List<users> list = query.list();
		if (list.isEmpty() == true) {
			return null;
		} else {
			return list.get(0);
		}
	}

	public boolean checkOldPassWordExactly(String password, String username) {
		Session session = factory.getCurrentSession();
		String hql = "FROM users A WHERE A.username = :username AND A.password = :password";
		Query query = session.createQuery(hql);
		query.setParameter("username", username);
		query.setParameter("password", password);
		List<users> list = query.list();
		if (list.isEmpty() == true) {
			return false;
		} else {
			return true;
		}
	}

	public int updatePassword(String password, String username) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE users  A SET A.password = :password WHERE A.username = :username";
		Query query = session.createQuery(hql);
		query.setParameter("password", password);
		query.setParameter("username", username);
		int result = query.executeUpdate();
		return result;
	}

	public List<customer> customerPage(int pageNumber, int pagesize, String order, String dir) {
		Session session = factory.getCurrentSession();
		String hql = "FROM customer  ORDER BY " + order + " " + dir;
		Query query = session.createQuery(hql);
		query.setFirstResult((pageNumber - 1) * pagesize);
		query.setMaxResults(pagesize);
		List<customer> list = query.list();
		return list;
	}

	public long deleteUser(long user_id) {
		Session session = factory.getCurrentSession();
		String hql = "DELETE FROM users A WHERE A.user_id = :user_id";
		Query query = session.createQuery(hql);
		query.setParameter("user_id", user_id);
		int result = query.executeUpdate();
		return result;
	}
	
	public int searchCustomerCount(String key) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT count(A.customer_id) From customer  A WHERE A.customer_name LIKE :key";
		Query query = session.createQuery(hql);
		query.setParameter("key", "%" + key + "%");
		long soluong = (long) query.uniqueResult();
		System.out.print(soluong);
		return (int) soluong;
	}


	public List<customer> searchCustomer(String key) {
		Session session = factory.getCurrentSession();
		String hql = "From customer  A WHERE A.customer_name LIKE :key";
		Query query = session.createQuery(hql);
		query.setParameter("key", "%" + key + "%");

		List<customer> list = query.list();
		return list;
	}

	public List<users> getUserCustomer() {
		Session session = factory.getCurrentSession();
		String hql = "FROM users A where A.role_id = 3 ";
		Query query = session.createQuery(hql);
		List<users> list = query.list();
		return list;
	}

	public long getUser_idByCustomer_id(long customer_id) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT A.user_id From customer  A WHERE A.customer_id = :customer_id";
		Query query = session.createQuery(hql);
		query.setParameter("customer_id", customer_id);
		long user_id = (long) query.uniqueResult();
		System.out.print(user_id);
		return (long) user_id;
	}

}
