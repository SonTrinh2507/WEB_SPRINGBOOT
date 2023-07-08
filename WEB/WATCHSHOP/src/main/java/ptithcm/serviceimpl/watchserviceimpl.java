package ptithcm.serviceimpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ptithcm.bean.productList;
import ptithcm.dao.watchdao;
import ptithcm.entity.watchs;
import ptithcm.service.watchservice;

@Service
public class watchserviceimpl implements watchservice {
	@Autowired
	watchdao WatchDao;
	
	@Override
	public List<watchs> getWatch() {
		return WatchDao.getWatch();
	}

	@Override
	public long insertWatch(watchs pd) {
		// TODO Auto-generated method stub
		return WatchDao.insertWatch(pd);
	}

	@Override
	public Integer deleteWatch(watchs pd) {
		// TODO Auto-generated method stub
		return WatchDao.deleteWatch(pd);
	}
	
	@Override
	public boolean checkWatch_idExist(String watch_id) {
		return WatchDao.checkWatch_idExist(watch_id);
	}
	@Override
	public String findWatch_id(String watch_id) {
		return WatchDao.findWatch_id(watch_id);
	}

	@Override
	public Integer updateWatch(watchs pd, watchs WatchUpdate) {
		// TODO Auto-generated method stub
		return WatchDao.updateWatch(pd, WatchUpdate);
	}

	
	
	@Override
	public List<watchs> searchWatch(String Watch_name) {
		// TODO Auto-generated method stub
		return WatchDao.searchWatch(Watch_name);
	}

	@Override
	public watchs editWatch(String id_Watch) {
		// TODO Auto-generated method stub
		return WatchDao.editWatch(id_Watch);
	}
	
	
	
	@Override
	public long updateEditWatch(String watch_id, String watch_name, String describe,String picture, int total_quantity,long price,long brand_id, long category_id) {
		return WatchDao.updateEditWatch(watch_id, watch_name, describe, picture, total_quantity,price, brand_id, category_id);
	}
	
	@Override
	public long searchWatchCount(String key) {
		return WatchDao.searchWatchCount(key);
	}
	
	@Override
	public long getWatchCount() {
		return WatchDao.getWatchCount();
	}
	
	@Override
	public List<watchs> watchPage(int pageNumber, int pageSize, String order, String dir){
		return WatchDao.watchPage(pageNumber, pageSize, order, dir);
	}
	
	@Override
	public List<watchs> dsWatchByIdCategory(long category_id){
		return WatchDao.dsWatchByIdCategory(category_id);
	}
	
	@Override
	public List<watchs> dsWatchByIdBrand(long brand_id) {
		return WatchDao.dsWatchByIdBrand(brand_id);
	}
	
	@Override
	public long searchWatchCountByCategory(long key) {
		return WatchDao.searchWatchCountByCategory(key);
	}
	
	@Override
	public long searchWatchCountByBrand(long key) {
		return WatchDao.searchWatchCountByBrand(key);
	}
	
	@Override
	public List<watchs> searchWatchByBrand(long brand_id){
		return WatchDao.searchWatchByBrand(brand_id);
	}
	
	@Override
	public List<watchs> searchWatchByCategory(long category_id){
		return WatchDao.searchWatchByCategory(category_id);
	}
	
	@Override
	public long searchWatchByCategoryAndBrandCount(long category_id,long brand_id) {
		return WatchDao.searchWatchByCategoryAndBrandCount(category_id, brand_id);
	}
	
	@Override
	public List<watchs> searchWatchByCategoryAndBrand(long category_id,long brand_id) {
		return WatchDao.searchWatchByCategoryAndBrand(category_id, brand_id);
	}
	
	@Override
	public List<watchs> watchPageByBrand(int pageNumber, int pagesize,Long brand_id){
		return WatchDao.watchPageByBrand(pageNumber, pagesize, brand_id);
	}
	
	@Override
	public List<watchs> watchPageByCategory(int pageNumber, int pagesize,Long category_id){
		return WatchDao.watchPageByCategory(pageNumber, pagesize, category_id);
	}
	
	@Override
	public List<watchs> watchPageByCategoryAndBrand(int pageNumber, int pagesize,Long category_id,Long brand_id){
		return WatchDao.watchPageByCategoryAndBrand(pageNumber, pagesize, category_id, brand_id);
		}
	
	@Override
	public List<productList> getWatchBuyNow(String watch_id,int quantity,long price){
		return WatchDao.getWatchBuyNow(watch_id, quantity, price);
	}
}