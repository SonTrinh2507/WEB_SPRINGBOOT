package ptithcm.service;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ptithcm.bean.productList;
import ptithcm.entity.watchs;

@Service
public interface watchservice {
	@Autowired
	public List<watchs> getWatch();

	@Autowired
	public long insertWatch(watchs pd);

	@Autowired
	public Integer deleteWatch(watchs pd);

	@Autowired
	public Integer updateWatch(watchs pd, watchs watchupdate);

	@Autowired
	public List<watchs> searchWatch(String watch_name);

	@Autowired
	public watchs editWatch(String watch_id);

	@Autowired
	public long searchWatchCount(String key);

	@Autowired
	public long updateEditWatch(String watch_id, String watch_name, String describe, String picture, int total_quantity,
			long price, long brand_id, long category_id);

	@Autowired
	public long getWatchCount();
	
	
	@Autowired
	public String findWatch_id(String watch_id);
	@Autowired
	public boolean checkWatch_idExist(String watch_id);

	@Autowired
	public List<watchs> watchPage(int pageNumber, int pageSize, String order, String dir);

	@Autowired
	public List<watchs> dsWatchByIdCategory(long category_id);

	@Autowired
	public List<watchs> dsWatchByIdBrand(long brand_id);
	
	@Autowired
	public long searchWatchCountByBrand(long key);
	
	@Autowired
	public long searchWatchCountByCategory(long key);
	
	@Autowired
	public List<watchs> searchWatchByBrand(long brand_id);
	
	@Autowired
	public List<watchs> searchWatchByCategory(long brand_id);
	
	@Autowired
	public long searchWatchByCategoryAndBrandCount(long category_id,long brand_id);
	
	@Autowired
	public List<watchs> searchWatchByCategoryAndBrand(long category_id,long brand_id) ;
	
	@Autowired
	public List<watchs> watchPageByBrand(int pageNumber, int pagesize,Long brand_id);
	
	@Autowired
	public List<watchs> watchPageByCategory(int pageNumber, int pagesize,Long category_id);
	
	@Autowired
	public List<watchs> watchPageByCategoryAndBrand(int pageNumber, int pagesize,Long category_id,Long brand_id);
	
	@Autowired
	public List<productList> getWatchBuyNow(String watch_id,int quantity,long price);
}
