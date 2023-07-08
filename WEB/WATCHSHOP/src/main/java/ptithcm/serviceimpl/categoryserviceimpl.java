package ptithcm.serviceimpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ptithcm.dao.categorydao;
import ptithcm.entity.category;
import ptithcm.service.categoryservice;

@Service
public class categoryserviceimpl implements categoryservice {
	@Autowired
	private categorydao categoryDao;
	
	@Override
	public List<category> dscategory() {
		return categoryDao.dscategory();
	}

	@Override
	public String findNamecategory(long id_category) {
		return categoryDao.findcategoryName(id_category);
	}
	
	@Override
	public long getcategoryCount() {
		return categoryDao.getcategoryCount();
	}

	
	@Override
	public List<category> searchcategory(String key) {
		return categoryDao.searchcategory(key);
	}

	

	@Override
	public long editcategory(long idcategory, String namecategory) {
		return categoryDao.editcategory(idcategory, namecategory);
	}

	@Override
	public long deletecategory(long idcategory) {
		return categoryDao.deletecategory(idcategory);
	}
		
	@Override
	public boolean checkNamecategory(long idcategory, String brandname) {
		return categoryDao.checkcategoryName(idcategory, brandname);
	}
	
	@Override
	public long  addcategory(category category) {
		return categoryDao.addcategory(category);
	}
	
	@Override
	public category getcategorybyName(String category_name) {
		return categoryDao.getcategorybyName(category_name);
	}

}
