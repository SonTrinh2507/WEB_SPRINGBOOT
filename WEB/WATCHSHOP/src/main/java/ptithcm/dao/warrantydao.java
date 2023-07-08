package ptithcm.dao;

import java.sql.SQLException;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.exception.SQLGrammarException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import ptithcm.entity.warranty;
import ptithcm.entity.warranty_detail;

@Controller
@Transactional
@SuppressWarnings("unchecked")
public class warrantydao {

	@Autowired
	SessionFactory factory;

	public List<warranty> getWarrantyList() {
		Session session = factory.getCurrentSession();
		String hql = "FROM warranty ";
		Query query = session.createQuery(hql);
		List<warranty> list = query.list();
		return list;
	}

	public long addwarranty(warranty warranty) {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.save(warranty);
			transaction.commit();
		} catch (SQLGrammarException e) {
			// Lỗi SQL của Hibernate
			SQLException sqlException = (SQLException) e.getCause();
			System.out.println("Lỗi SQL: " + sqlException.getMessage());
			transaction.rollback();
			return 0;
		} finally {
			session.close();

		}
		return 1;
	}

	public long getWarrantyCount() {
		Session session = factory.getCurrentSession();
		String hql = "SELECT Count(A.warranty_id) FROM warranty A";
		Query query = session.createQuery(hql);
		long soluong = (long) query.uniqueResult();
		return soluong;
	}

	public List<warranty> warrantyPage(int pageNumber, int pageSize, String order, String dir) {
		Session session = factory.getCurrentSession();
		String hql = "FROM warranty ORDER BY " + order + " " + dir;
		Query query = session.createQuery(hql);
		query.setFirstResult((pageNumber - 1) * pageSize);
		query.setMaxResults(pageSize);
		List<warranty> list = query.list();
		return list;
	}

	public List<warranty_detail> getListWarranty_detail() {
		Session session = factory.getCurrentSession();
		String hql = "FROM warranty_detail ";
		Query query = session.createQuery(hql);
		List<warranty_detail> list = query.list();
		return list;
	}

}
