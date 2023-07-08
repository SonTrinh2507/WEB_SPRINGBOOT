package ptithcm.serviceimpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ptithcm.dao.branddao;
import ptithcm.entity.brands;
import ptithcm.service.brandservice;

@Service
public class brandserviceimpl implements brandservice{
	@Autowired
	branddao BrandDao;
	
	@Override
	public String findBrandName(long brand_id) {
		return BrandDao.findBrandName(brand_id);
	}

	@Override
	public List<brands> dsbrands() {
		return BrandDao.dsbrands();
	}
	
	@Override
	public List <brands> brandPage (int pageNumber, int pagesize, String order, String dir){
		return BrandDao.brandPage(pageNumber, pagesize, order, dir);
	}
	
	@Override
	public List<brands> searchBrand(String key){
		return BrandDao.searchBrand(key);
	}
	
	@Override
	public long searchBrandCount(String key) {
		return BrandDao.searchBrandCount(key);
	}
	
	@Override
	public long addBrand(brands Brand) {
		return BrandDao.addBrand(Brand);
	}
	
	@Override
	public long editBrand(long idBrand, String BrandName) {
		return BrandDao.editBrand(idBrand, BrandName);
	}
	
	@Override
	public long deleteBrand(long idBrand) {
		return BrandDao.deleteBrand(idBrand);
	}
	
	@Override
	public boolean checkNameBrand(long idBrand, String BrandName) {
		return BrandDao.checkBrandName(idBrand, BrandName);
	}
	

}

