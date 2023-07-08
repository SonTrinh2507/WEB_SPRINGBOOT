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
import ptithcm.entity.reviews;

@Controller
@Transactional
@SuppressWarnings("unchecked")
public class reviewdao {
	@Autowired
	SessionFactory factory;

	public List<reviews> dsReview() {
		Session session = factory.getCurrentSession();
		String hql = "FROM reviews ";
		Query query = session.createQuery(hql);
		List<reviews> list = query.list();
		return list;
	}

	public List<long[]> getListStarCount(String watch_id) {
		Session session = factory.getCurrentSession();
		String hql = "Select AVG(star), count(A.watch_id) from reviews A where watch_id = :watch_id "
				+ " group by watch_id order by watch_id desc";
		Query query = session.createQuery(hql);
		query.setParameter("watch_id", watch_id);
		List<long[]> list = query.list();
		return list;
	}

	public List<float[]> getAVGWatchStar(String watch_id) {
		Session session = factory.getCurrentSession();
		String hql = "Select AVG(star) from reviews where watch_id = :watch_id";
		Query query = session.createQuery(hql);
		query.setParameter("watch_id", watch_id);
		List<float[]> list = query.list();
		return list;
	}

	public List<reviews> reviewOfWatch(String watch_id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM reviews where watch_id = :watch_id";
		Query query = session.createQuery(hql);
		query.setParameter("watch_id", watch_id);
		List<reviews> list = query.list();
		return list;
	}

	public long getReviewCount(String watch_id) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT count(A.review_id) FROM reviews A where A.watch_id = :watch_id ";
		Query query = session.createQuery(hql);
		query.setParameter("watch_id", watch_id);
		long soluong = (long) query.uniqueResult();
		return soluong;
	}

	public long addReview(reviews review) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(review);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			System.out.println("LỖI = " + e);
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	public long updateReview(String comments, int star, long user_id, String watch_id) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			String hql = "UPDATE reviews R SET R.comments = :comments, R.time = :dateA, R.star = " + star
					+ " WHERE R.id.user_id = " + user_id + " AND R.id.watch+_id = " + watch_id;
			Query query = session.createQuery(hql);
			query.setParameter("comments", comments);
			query.setParameter("dateA", new Date());
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

	public long deleteReview(String watch_id, long user_id) {
		Session session = factory.getCurrentSession();
		String hql = "DELETE FROM reviews WHERE user_id = " + user_id + " AND watch_id =" + watch_id;
		Query query = session.createQuery(hql);
		int result = query.executeUpdate();
		return result;
	}

	public List<String[]> listWatchReview() {
		Session session = factory.getCurrentSession();
		String hql = "SELECT DISTINCT A.watch_id, A.watch_name, A.picture " + "FROM watchs A, reviews B "
				+ "WHERE A.watch_id = B.watch_id";
		Query query = session.createQuery(hql);
		List<String[]> result = query.list();
		return result;
	}

}
