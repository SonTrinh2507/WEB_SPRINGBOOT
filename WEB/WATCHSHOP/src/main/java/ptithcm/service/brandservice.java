package ptithcm.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ptithcm.entity.brands;

@Service
public interface brandservice {
	@Autowired
	public String findBrandName(long brand_id);
	
	@Autowired
	public List <brands> dsbrands();
	
	
	
	@Autowired
	public List <brands> brandPage (int pageNumber, int pagesize, String order, String dir);
	
	@Autowired
	public List<brands> searchBrand(String key);
	
	@Autowired
	public long searchBrandCount(String key);
	
	@Autowired
	public long addBrand(brands brand);
	
	@Autowired
	public long editBrand(long brand_id, String brand_name);
	
	@Autowired
	public long deleteBrand(long brand_id);
	
	@Autowired
	public boolean checkNameBrand(long brand_id, String brand_name);
	
	
}
