package ptithcm.serviceimpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ptithcm.bean.productList;
import ptithcm.dao.itemdao;
import ptithcm.entity.item_detail;
import ptithcm.entity.items;
import ptithcm.service.itemservice;

@Service
public class itemserviceimpl implements itemservice{
	@Autowired
	itemdao itemDao;
	
	@Override
	public List<items> findItemByIDUser(long userID) {
		return itemDao.findItemByIDUser(userID);
	}
	
	@Override
	public long updateItem(long item_id, int total_quantity, long price, long user_id)  {
		return itemDao.updateItem(item_id, total_quantity, price, user_id);
	}
	
	@Override
	public int addItem(items item) {
		return itemDao.addItem(item);
	}
	
	@Override
	public long deleteItem(long item_detail_id) {
		return itemDao.deleteItem(item_detail_id);
	}
	
	
	
	
	
	@Override
	public int addItem_detail(item_detail item_detail) {
		return itemDao.addItem_detail(item_detail);
	}
	
	@Override
	public long updateItem_detail(long item_id, String watch_id, int quantity, long price) {
		return itemDao.updateItem_detail(item_id, watch_id, quantity, price);
	}
	
	@Override
	public long checkItem_detailExist(String id, long item_id){
		return itemDao.checkItem_detailExist(id, item_id);
	}
	
	@Override
	public Long getItem_idByUser_id(long user_id) {
		return itemDao.getItem_idByUser_id(user_id);
	}
	
	@Override
	public List<item_detail> getItem_detail(long item_id){
		return itemDao.getItem_detail(item_id);
	}
	
	@Override
	public int getQuantity_detail(long item_id, String id){
		return itemDao.getQuantity_detail(item_id, id);
	}
	
	@Override
	public int updateQuantity_detail(long item_detail_id,int quantity) {
		return itemDao.updateQuantity_detail(item_detail_id, quantity);
	}
	
	@Override
	public long getTotal_Price(long item_id) {
		return itemDao.getTotal_Price(item_id);
	}
	
	
	
	@Override
	public List<productList> getListDetail(List<Long> item_detail_id,List<String> picture, List<String> watch_name){
		return itemDao.getListDetail(item_detail_id, picture, watch_name);
	}
	
	@Override
	public int getQuantityDetail(long item_detai_id) {
		return itemDao.getQuantityDetail(item_detai_id);
	}
	
	
}
