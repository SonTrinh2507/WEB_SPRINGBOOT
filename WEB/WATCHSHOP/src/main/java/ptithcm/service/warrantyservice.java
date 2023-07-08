package ptithcm.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ptithcm.entity.warranty;
import ptithcm.entity.warranty_detail;

@Service
public interface warrantyservice  {
	@Autowired
	public List<warranty> getWarrantyList();
	
	@Autowired
	public long addwarranty(warranty warranty) ;
	
	@Autowired
	public long getWarrantyCount();
	
	@Autowired
	public List<warranty> warrantyPage(int pageNumber, int pageSize, String order, String dir);
	
	@Autowired
	public List<warranty_detail> getListWarranty_detail();

}
