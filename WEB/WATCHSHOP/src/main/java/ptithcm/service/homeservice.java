package ptithcm.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ptithcm.entity.watchs;

@Service
public interface homeservice {
	@Autowired
	public List <watchs> dswatchs ();
	
	@Autowired
	public watchs getWatchbyID(String id) ;
	
	@Autowired
	public List<watchs> dsWatchbyBrandID(long brand_id, int pageNumber, int pagesize);
	
	@Autowired
	public List<watchs> findWatch(String key);
	
	
	
	@Autowired
	public long getWatchCount();
	
	@Autowired
	public int addWatch(watchs watch);
	
	@Autowired
	public List <watchs> watchPage (int pageNumber, int pagesize, String order, String dir);
	
	
	
	@Autowired
	public int getWatchQuantybyID(String watch_id);
	
//	@Autowired
//	public int updateWatchQuanty(ArrayList<cartdto> cart) ;
	
	@Autowired
	public List <watchs>  watchPageOfHome(int pageNumber, int pagesize);
	
	@Autowired
	public long getWatchCountOfBrand(long brand_id);
	
	@Autowired
	public long getWatchCountOfCompany(long company_id);
	
	@Autowired
	public long getWatchCountOfCategory(long category_id);
	
	@Autowired
	public List<watchs> watchBestPrice();

}



