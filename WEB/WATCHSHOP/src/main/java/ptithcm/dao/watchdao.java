package ptithcm.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import ptithcm.bean.productList;
import ptithcm.entity.watchs;

@Controller
@Transactional
@SuppressWarnings("unchecked")
public class watchdao {
	@Autowired
	SessionFactory factory;

	public List<watchs> getWatch() {
		Session session = factory.openSession();
		String hql = "FROM watchs";
		Query query = session.createQuery(hql);
		List<watchs> list = query.list();
		return list;
	}

	public long insertWatch(watchs watchs) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(watchs);
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

	public Integer deleteWatch(watchs watch) {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.delete(watch);
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			System.out.println("Gia trị cua e: " + e.getMessage());
			return 0;
			// TODO: handle exception
		} finally {
			session.close();
		}
		return 1;

	}

	public Integer updateWatch(watchs watch, watchs watchUpdate) {
		if (watch.getPicture().trim().equals("")) {
			watch.setPicture(watchUpdate.getPicture());
		}
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.update(watch);
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

	public List<watchs> searchWatch(String watch_name) {
		Session session = factory.openSession();
		String hql = "FROM watchs WHERE watch_name LIKE :watch_name";
		Query query = session.createQuery(hql);
		query.setParameter("watch_name", "%" + watch_name + "%");
		List<watchs> list = query.list();
		return list;
	}

	public watchs editWatch(String watch_id) {
		Session session = factory.openSession();
		String hql = "FROM watchs where watch_id = :watch_id";
		Query query = session.createQuery(hql);
		query.setParameter("watch_id", watch_id);
		watchs list = (watchs) query.list().get(0);
		if (session.isOpen()) {
			session.close();
		}
		return list;
	}

	public long updateEditWatch(String watch_id, String watch_name, String describe, String picture, int total_quantity,
			long price, long brand_id, long category_id) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE watchs  A SET A.watch_name = :watch_name, A.describe = :describe,A.picture = :picture,"
				+ "  A.total_quantity = :total_quantity,A.price = :price, A.brand_id= :brand_id, A.category_id = :category_id WHERE A.watch_id = :watch_id";
		Query query = session.createQuery(hql);
		query.setParameter("watch_id", watch_id);
		query.setParameter("watch_name", watch_name);
		query.setParameter("describe", describe);
		query.setParameter("picture", picture);
		query.setParameter("total_quantity", total_quantity);
		query.setParameter("brand_id", brand_id);
		query.setParameter("category_id", category_id);
		query.setParameter("price", price);
		long result = query.executeUpdate();
		if (result == 0) {
			return 0;
		}
		System.out.print("K lỗi");
		return result;
	}

	public long updateSupplierDetailWatch(long supplier_id, String watch_id, int quantity, long price, Date date) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE supplier_detail  A SET A.supplier_id = :supplier_id, A.quantity = :quantity,A.price = :price, A.date = :date where A.watch_id = :watch_id";
		Query query = session.createQuery(hql);
		query.setParameter("supplier_id", supplier_id);
		query.setParameter("watch_id", watch_id);
		query.setParameter("quantity", quantity);
		query.setParameter("price", price);
		query.setParameter("date", date);
		long result = query.executeUpdate();
		if (result == 0) {
			return 0;
		}
		System.out.print("K lỗi");
		return result;
	}

	public long getWatchCount() {
		Session session = factory.getCurrentSession();
		String hql = "SELECT Count(A.watch_id) FROM watchs A";
		Query query = session.createQuery(hql);
		long soluong = (long) query.uniqueResult();
		return soluong;
	}

	public List<watchs> watchPage(int pageNumber, int pageSize, String order, String dir) {
		Session session = factory.getCurrentSession();
		String hql = "FROM watchs ORDER BY " + order + " " + dir;
		Query query = session.createQuery(hql);
		query.setFirstResult((pageNumber - 1) * pageSize);
		query.setMaxResults(pageSize);
		List<watchs> list = query.list();
		return list;
	}

	public List<watchs> dsWatchByIdCategory(long category_id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM watchs A WHERE A.category_id = " + category_id;
		Query query = session.createQuery(hql);
		List<watchs> list = query.list();
		if (list.isEmpty() == false) {
			return list;
		}
		return null;
	}

	public List<watchs> dsWatchByIdBrand(long brand_id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM watchs A WHERE A.brand_id = " + brand_id;
		Query query = session.createQuery(hql);
		List<watchs> list = query.list();
		if (list.isEmpty() == false) {
			return list;
		}
		return null;
	}

	public boolean checkWatch_idExist(String watch_id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM watchs A WHERE A.watch_id = :watch_id";
		Query query = session.createQuery(hql);
		query.setParameter("watch_id", watch_id);
		List<watchs> list = query.list();
		if (list.isEmpty() == true) {
			return false;
		} else {
			return true;
		}
	}

	public String findWatch_id(String watch_id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM watchs C WHERE C.watch_id = :watch_id";
		Query query = session.createQuery(hql);
		query.setParameter("watch_id", watch_id);
		List<watchs> list = query.list();
		if (list.isEmpty() == false) {
			return list.get(0).getWatch_id();
		}
		return null;
	}

	public long searchWatchCount(String key) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT Count(A.watch_id) FROM watchs A WHERE A.watch_name LIKE :key";
		Query query = session.createQuery(hql);
		query.setParameter("key", "%" + key + "%");
		long soluong = (long) query.uniqueResult();
		return (int) soluong;
	}

	public long searchWatchCountByBrand(long key) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT Count(A.watch_id) FROM watchs A WHERE A.brand_id LIKE :key";
		Query query = session.createQuery(hql);
		query.setParameter("key", key);
		long soluong = (long) query.uniqueResult();
		return (int) soluong;

	}

	public long searchWatchCountByCategory(long key) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT Count(A.watch_id) FROM watchs A WHERE A.category_id LIKE :key";
		Query query = session.createQuery(hql);
		query.setParameter("key", key);
		long soluong = (long) query.uniqueResult();
		return (int) soluong;

	}

	public List<watchs> searchWatchByBrand(long brand_id) {
		Session session = factory.openSession();
		String hql = "FROM watchs WHERE brand_id LIKE :brand_id";
		Query query = session.createQuery(hql);
		query.setParameter("brand_id", brand_id);
		List<watchs> list = query.list();
		return list;
	}

	public List<watchs> searchWatchByCategory(long category_id) {
		Session session = factory.openSession();
		String hql = "FROM watchs WHERE category_id LIKE :category_id";
		Query query = session.createQuery(hql);
		query.setParameter("category_id", category_id);
		List<watchs> list = query.list();
		return list;
	}

	public long searchWatchByCategoryAndBrandCount(long category_id, long brand_id) {
		Session session = factory.openSession();
		String hql = "SELECT COUNT(A.watch_id) FROM watchs A WHERE category_id LIKE :category_id and brand_id LIKE :brand_id";
		Query query = session.createQuery(hql);
		query.setParameter("category_id", category_id);
		query.setParameter("brand_id", brand_id);
		Long dem = (Long) query.uniqueResult();

		return dem;

	}

	public List<watchs> searchWatchByCategoryAndBrand(long category_id, long brand_id) {
		Session session = factory.openSession();
		String hql = "FROM watchs WHERE category_id LIKE :category_id and brand_id LIKE :brand_id";
		Query query = session.createQuery(hql);
		query.setParameter("category_id", category_id);
		query.setParameter("brand_id", brand_id);
		List<watchs> list = query.list();
		return list;
	}

	public List<watchs> watchPageByBrand(int pageNumber, int pagesize, Long brand_id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM watchs where brand_id = :brand_id ORDER BY brand_id DESC";
		Query query = session.createQuery(hql);
		query.setParameter("brand_id", brand_id);
		query.setFirstResult((pageNumber - 1) * pagesize);
		query.setMaxResults(pagesize);
		List<watchs> list = query.list();
		return list;
	}

	public List<watchs> watchPageByCategory(int pageNumber, int pagesize, Long category_id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM watchs where category_id = :category_id ORDER BY brand_id DESC";
		Query query = session.createQuery(hql);
		query.setParameter("category_id", category_id);
		query.setFirstResult((pageNumber - 1) * pagesize);
		query.setMaxResults(pagesize);
		List<watchs> list = query.list();
		return list;
	}

	public List<watchs> watchPageByCategoryAndBrand(int pageNumber, int pagesize, Long category_id, Long brand_id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM watchs where category_id = :category_id and brand_id = :brand_id ORDER BY brand_id,category_id DESC";
		Query query = session.createQuery(hql);
		query.setParameter("category_id", category_id);
		query.setParameter("brand_id", brand_id);
		query.setFirstResult((pageNumber - 1) * pagesize);
		query.setMaxResults(pagesize);
		List<watchs> list = query.list();
		return list;
	}

	public List<productList> getWatchBuyNow(String watch_id, int quantity, long price) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT A.watch_id, A.picture, A.watch_name " + "FROM watchs A " + "WHERE A.watch_id = :watch_id";
		Query query = session.createQuery(hql);
		query.setParameter("watch_id", watch_id);

		List<Object[]> rows = query.list();
		List<productList> list = new ArrayList<>();
		for (Object[] row : rows) {
			String id = (String) row[0];
			String picturetemp = (String) row[1];
			String watch_nametemp = (String) row[2];
			list.add(new productList(null, id, quantity, price, picturetemp, watch_nametemp));
		}
		return list;
	}

}
