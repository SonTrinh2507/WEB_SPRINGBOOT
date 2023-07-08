
package ptithcm.dao;

import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import ptithcm.entity.brands;

@Controller
@Transactional

@SuppressWarnings("unchecked")
public class branddao {
	@Autowired
	SessionFactory factory;

	public String findBrandName(long brand_id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM brands";
		Query query = session.createQuery(hql);
	
		List<brands> list = query.list();
		for (brands brands : list) {
			if (brands.getBrand_id() == brand_id) {
				return brands.getBrand_name();
			}
		}
		return null;
	}

	public List<brands> dsbrands() {
		Session session = factory.getCurrentSession();
		String hql = "FROM brands ";
		Query query = session.createQuery(hql);
		List<brands> list = query.list();
		return list;
	}

	public List<brands> brandPage(int pageNumber, int pageSize, String order, String dir) {
		Session session = factory.getCurrentSession();
		String hql = "FROM brands ORDER BY " + order + " " + dir;
		Query query = session.createQuery(hql);
		query.setFirstResult((pageNumber - 1) * pageSize);
		query.setMaxResults(pageSize);
		List<brands> list = query.list();
		return list;
	}

	public List<brands> searchBrand(String key) {
		Session session = factory.getCurrentSession();
		String hql = "FROM brands A WHERE A.brand_name LIKE :key";
		Query query = session.createQuery(hql);
		query.setParameter("key", "%" + key + "%");
		List<brands> list = query.list();
		return list;
	}

	public long searchBrandCount(String key) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT Count(A.brand_id) FROM brands A WHERE A.brand_name LIKE :key";
		Query query = session.createQuery(hql);
		query.setParameter("key", "%" + key + "%");
		long soluong = (long) query.uniqueResult();
		return (int) soluong;
	}

	public long addBrand(brands brands) {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.save(brands);
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

	public long editBrand(long brand_id, String brand_name) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE brands A SET brand_name = :brand_name WHERE brand_id = " + brand_id;
		Query query = session.createQuery(hql);
		query.setParameter("brand_name", brand_name);
		int result = query.executeUpdate();
		return result;
	}

	public long deleteBrand(long brand_id) {
		Session session = factory.getCurrentSession();
		String hql = "DELETE FROM brands WHERE brand_id = " + brand_id;
		Query query = session.createQuery(hql);
		int result = query.executeUpdate();
		return result;
	}

	public boolean checkBrandName(long brand_id, String brand_name) {
		Session session = factory.getCurrentSession();
		String hql = "FROM brands WHERE brand_name = :brand_name AND brand_id <> " + brand_id;
		Query query = session.createQuery(hql);
		query.setParameter("brand_name", brand_name);
		List<brands> list = query.list();
		if (list.size() == 0) {
			return false;
		}
		return true;
	}

}
