package ptithcm.serviceimpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ptithcm.dao.warrantydao;
import ptithcm.entity.warranty;
import ptithcm.entity.warranty_detail;
import ptithcm.service.warrantyservice;

@Service
public class warrantyserviceimpl implements warrantyservice {

	@Autowired
	warrantydao warrantydao;
	
	@Override
	public List<warranty> getWarrantyList(){
		return warrantydao.getWarrantyList();
	}
	
	@Override
	public long addwarranty(warranty warranty) {
		return warrantydao.addwarranty(warranty);
	}
	
	@Override
	public List<warranty> warrantyPage(int pageNumber, int pageSize, String order, String dir){
		return warrantydao.warrantyPage(pageNumber, pageSize, order, dir);
	}
	
	@Override
	public long getWarrantyCount() {
		return warrantydao.getWarrantyCount();
	}
	
	@Override
	public List<warranty_detail> getListWarranty_detail(){
		return warrantydao.getListWarranty_detail();
	}
	
	
}
