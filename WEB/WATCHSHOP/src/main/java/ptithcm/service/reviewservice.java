package ptithcm.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ptithcm.entity.reviews;

@Service
public interface reviewservice {
	@Autowired
	public List <reviews> dsReview ();
	
	
	@Autowired
	public List<long[]> getListStarCount(String watch_id);
	@Autowired
	public List<float []> getAVGWatchStar(String watch_id); 
	@Autowired
	public List<reviews> reviewOfWatch(String watch_id);
	
	@Autowired
	public long getReviewCount(String watch_id);

	@Autowired
	public long addReview(reviews review);
	@Autowired
	public long updateReview(String comments, int star, long userID, String watch_id);
	
	@Autowired
	public long deleteReview(String watch_id, long user_id);
	
	@Autowired
	public List<String[]> listWatchReview();
}
