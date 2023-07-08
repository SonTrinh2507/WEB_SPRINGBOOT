package ptithcm.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ptithcm.entity.category;

@Service
public interface categoryservice {
	@Autowired
	public List <category> dscategory ();
	@Autowired
	public String findNamecategory(long category_id);
	@Autowired
	public long getcategoryCount();
	
	@Autowired
	public List<category> searchcategory(String key);
	
	@Autowired
	public long editcategory(long idcategory, String category_name);
	
	@Autowired
	public long deletecategory(long idcategory);
	
	@Autowired
	public boolean checkNamecategory(long  category_id, String category_name);
	
	@Autowired
	public long addcategory(category category);
	
	@Autowired
	public category getcategorybyName(String category_name);
}
