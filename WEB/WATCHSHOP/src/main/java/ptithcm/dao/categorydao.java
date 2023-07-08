package ptithcm.dao;

import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import ptithcm.entity.category;

@Controller
@Transactional
@SuppressWarnings("unchecked")
public class categorydao {
	@Autowired
	SessionFactory factory;

	public List<category> dscategory() {
		Session session = factory.getCurrentSession();
		String hql = "FROM category";
		Query query = session.createQuery(hql);
		List<category> list = query.list();
		return list;
	}

	public String findcategoryName(long category_id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM category C WHERE C.category_id = " + category_id;
		Query query = session.createQuery(hql);
		List<category> list = query.list();
		if (list.isEmpty() == false) {
			return list.get(0).getCategory_name();
		}
		return null;
	}

	public long getcategoryCount() {
		Session session = factory.getCurrentSession();
		String hql = "SELECT Count(C.category_id) FROM category C";
		Query query = session.createQuery(hql);
		long soluong = (long) query.uniqueResult();
		return soluong;
	}

	public List<category> searchcategory(String key) {
		Session session = factory.getCurrentSession();
		String hql = "FROM category C WHERE C.category_name LIKE :key";
		Query query = session.createQuery(hql);
		query.setParameter("key", "%" + key + "%");
		List<category> list = query.list();
		return list;
	}

	public long addcategory(category category) {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.save(category);
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			return 0;
			// TODO: handle exception
		} finally {
			session.close();

		}
		return 1;
	}

	public long editcategory(long category_id, String category_name) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE category C SET category_name = :category_name WHERE C.category_id = " + category_id;
		Query query = session.createQuery(hql);
		query.setParameter("category_name", category_name);
		int result = query.executeUpdate();
		return result;
	}

	public long deletecategory(long category_id) {
		Session session = factory.getCurrentSession();
		String hql = "DELETE FROM category WHERE category_id = " + category_id;
		Query query = session.createQuery(hql);
		int result = query.executeUpdate();
		return result;
	}

	public boolean checkcategoryName(long category_id, String category_name) {
		Session session = factory.getCurrentSession();
		String hql = "FROM category WHERE category_name = :category_name AND category_id <> " + category_id;
		Query query = session.createQuery(hql);
		query.setParameter("category_name", category_name);
		List<category> list = query.list();
		if (list.size() == 0) {
			return false;
		}
		return true;
	}

	public category getcategorybyName(String category_name) {
		Session session = factory.getCurrentSession();
		String hql = "FROM category WHERE category_name = :category_name";
		Query query = session.createQuery(hql);
		query.setParameter("category_name", category_name);
		List<category> list = query.list();
		if (list.isEmpty() == false) {
			return list.get(0);
		}
		return null;
	}
}
