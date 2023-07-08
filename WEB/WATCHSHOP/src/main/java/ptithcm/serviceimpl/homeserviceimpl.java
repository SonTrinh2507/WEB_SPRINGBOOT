package ptithcm.serviceimpl;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ptithcm.dao.homedao;
import ptithcm.entity.watchs;
import ptithcm.service.homeservice;

@Service
public class homeserviceimpl implements homeservice {
	@Autowired
	private homedao homeDao;
	
	@Override
	public List<watchs> dswatchs() {
		return homeDao.dswatchs();
	}

	@Override
	public watchs getWatchbyID(String watch_id) {
		return homeDao.getWatchbyID(watch_id);
	}
	
	@Override
	public List<watchs> dsWatchbyBrandID(long brand_id, int pageNumber, int pagesize){
		return homeDao.dsWatchbyBrandID(brand_id, pageNumber, pagesize);
	}

	@Override
	public List<watchs> findWatch(String key) {
		return homeDao.findWatch(key);
	}

	
	@Override
	public long getWatchCount() {
		return homeDao.getWatchCount();
	}
	
	@Override
	public int addWatch(watchs watch) {
		return homeDao.addWatch(watch);
	}
	
	@Override
	public List <watchs> watchPage (int pageNumber, int pagesize, String order, String dir){
		return homeDao.watchPage(pageNumber, pagesize, order, dir);
	}
	
	
	
	@Override
	public int getWatchQuantybyID(String watch_id) {
		return homeDao.getWatchQuantybyID(watch_id);
	}

//	@Override
//	public int updateWatchQuanty(ArrayList<cartdto> cart) {
//		return homeDao.updateWatchQuanty(cart);
//	}
	
	@Override
	public List <watchs> watchPageOfHome(int pageNumber, int pagesize){
		return homeDao.watchPageOfHome(pageNumber, pagesize);
	}

	@Override
	public long getWatchCountOfBrand(long brand_id) {
		return homeDao.getWatchCountOfBrand(brand_id);
	}

	@Override
	public long getWatchCountOfCompany(long company_id) {
		return homeDao.getWatchCountOfCompany(company_id);
	}

	@Override
	public long getWatchCountOfCategory(long category_id) {
		return homeDao.getWatchCountOfCategory(category_id);
	}

	@Override
	public List<watchs> watchBestPrice(){
		return homeDao.watchBestPrice();
	}

}
