package ptithcm.serviceimpl;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ptithcm.dao.orderdao;
import ptithcm.entity.address;
import ptithcm.entity.bill;
import ptithcm.entity.orders;
import ptithcm.service.orderservice;

@Service
public class orderserviceimpl implements orderservice {
	@Autowired
	orderdao orderDao;
	
	@Override
	public List<orders> dsOrder() {
		return orderDao.dsOrder();
	}

	@Override
	public List <orders> orderPage (int pageNumber, int pagesize, String order, String dir, int status){
		return orderDao.orderPage(pageNumber, pagesize, order, dir, status);
	}

	@Override
	public List<orders> orderPageCustomer(int pageNumber, int pagesize, String order, String dir, int status,long user_id) {
		return orderDao.orderPageCustomer(pageNumber, pagesize, order, dir, status, user_id);
	}
	
	@Override
	public List<orders> searchOrder(Date dateA, Date dateB) {
		return orderDao.searchOrder(dateA, dateB);
	}
	
	@Override
	public boolean checkOldStatusExactly(int oldStatus, long oder_id) {
		return orderDao.checkOldStatusExactly(oldStatus, oder_id);
	}
	
	@Override
	public int saveOrder(int newStatus, long oder_id) {
		return orderDao.saveOrder(newStatus, oder_id);
	}
	
	
	
	@Override
	public long addOrder(orders order) {
		return orderDao.addOrder(order);
	}
	

	
	@Override
	public long getOrderCount(int order_status) {
		return orderDao.getOrderCount(order_status);
	}
	
	@Override
	public long getOrderCountCustomer(int order_status,long user_id) {
		return orderDao.getOrderCountCustomer(order_status, user_id);
	}
	
	@Override
	public long setTotal_price(long order_id) {
		return orderDao.setTotal_price(order_id);
	}
	
	@Override
	public long getOrder_idByUser_id(long user_id) {
		return orderDao.getOrder_idByUser_id(user_id);
	}
	
	@Override
	public List<address> getAdressByUser_id(long user_id){
		return orderDao.getAdressByUser_id(user_id);
	}
	@Override
	public long getOrder_idByAddress_id(long address_id) {
		return orderDao.getOrder_idByAddress_id(address_id);
	}
	
	@Override
	public long updateStatusOrderDelivery(long order_id,int order_status,long user_delivery) {
		return orderDao.updateStatusOrderDelivery(order_id, order_status,user_delivery);
	}
	
	@Override
	public long updateStaffOrder(long order_id,int order_status,long user_accept) {
		return orderDao.updateStaffOrder(order_id, order_status,user_accept);
	}
	
	@Override
	public List<bill> getListBill(){
		return orderDao.getListBill();
	}
	
	@Override
	public List<orders> orderDelivery(){
		return orderDao.orderDelivery();
	}
	
	@Override
	public long updateQuantityCart(String watch_id,int quantity) {
		return orderDao.updateQuantityCart(watch_id, quantity);
	}
	
	@Override
	public long addAddress(address address) {
		return orderDao.addAddress(address);
	}
	
	@Override
	public long deleteAddress(long address_id) {
		return orderDao.deleteAddress(address_id);
	}
	
	@Override
	public long staffSuccessOrder(long order_id,long user_id) {
		return orderDao.staffSuccessOrder(order_id, user_id);
	}

}
