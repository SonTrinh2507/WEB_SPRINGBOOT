package ptithcm.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ptithcm.bean.productList;
import ptithcm.entity.item_detail;
import ptithcm.entity.items;

@Service
public interface itemservice {
	@Autowired
	public List <items> findItemByIDUser (long userID);
	
	@Autowired
	public long updateItem(long item_id, int total_quantity, long price, long user_id) ;
	
	@Autowired
	public int addItem(items item);
	
	@Autowired
	public long deleteItem(long item_detail_id);
	
	
	@Autowired
	public int addItem_detail(item_detail item_detail) ;
	
	@Autowired
	public long updateItem_detail(long item_id, String watch_id, int quantity, long price) ;
	
	@Autowired
	public long checkItem_detailExist(String id, long item_id);
	@Autowired
	public Long getItem_idByUser_id(long user_id);
	
	@Autowired
	public List<item_detail> getItem_detail(long item_id);
	
	@Autowired
	public int getQuantity_detail(long item_id, String watch_id) ;
	
	@Autowired
	public int updateQuantity_detail(long item_detail_id,int quantity);
	
	@Autowired
	public long getTotal_Price(long item_id) ;
	
	
	
	@Autowired
	public List<productList> getListDetail(List<Long> item_detail_id,List<String> picture, List<String> watch_name);
	
	@Autowired
	public int getQuantityDetail(long item_detai_id) ;
	
}
