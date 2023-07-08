package ptithcm.serviceimpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ptithcm.dao.reviewdao;
import ptithcm.entity.reviews;
import ptithcm.service.reviewservice;

@Service
public class reviewserviceimpl implements reviewservice {
	@Autowired
	reviewdao reviewDao;
	
	@Override
	public List<reviews> dsReview() {
		return reviewDao.dsReview();
	}
	
	@Override
	public List<reviews> reviewOfWatch(String watch_id){
		return reviewDao.reviewOfWatch(watch_id);
	}
	
	@Override
	public long getReviewCount(String watch_id) {
		return reviewDao.getReviewCount(watch_id);
	}
	

	@Override
	public List<long[]> getListStarCount(String watch_id){
		return reviewDao.getListStarCount(watch_id);
	}
	
	@Override
	public List<float []> getAVGWatchStar(String watch_id){
		return reviewDao.getAVGWatchStar(watch_id);
	}
	
	
	@Override
	public long addReview(reviews review){
		return reviewDao.addReview(review);
	}
	
	@Override
	public long updateReview(String comments, int star, long user_id, String watch_id) {
		return reviewDao.updateReview(comments, star, user_id, watch_id);
	}

	@Override
	public long deleteReview(String watch_id, long user_id) {
		// TODO Auto-generated method stub
		return reviewDao.deleteReview(watch_id, user_id);
	}
	
	@Override
	public List<String[]> listWatchReview() {
		return reviewDao.listWatchReview();
	}
}
