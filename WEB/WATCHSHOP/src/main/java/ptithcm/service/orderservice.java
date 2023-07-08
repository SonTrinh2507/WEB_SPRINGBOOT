package ptithcm.service;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ptithcm.entity.address;
import ptithcm.entity.bill;
import ptithcm.entity.orders;

@Service
public interface orderservice {
	@Autowired
	public List <orders> dsOrder ();
	
	@Autowired
	public List <orders> orderPage (int pageNumber, int pagesize, String order, String dir, int status);
	
	@Autowired
	public List<orders> orderPageCustomer(int pageNumber, int pagesize, String order, String dir, int status,long user_id) ;
	
	@Autowired
	public List<orders> searchOrder(Date dateA, Date dateB);
	
	@Autowired
	public boolean checkOldStatusExactly(int oldStatus, long order_id);
	
	@Autowired
	public int saveOrder(int newStatus, long order_id);
	
	@Autowired
	public long addOrder(orders order);
	
	
	@Autowired
	public long getOrderCount(int order_status) ;
	
	@Autowired
	public long getOrderCountCustomer(int order_status,long user_id);
	
	@Autowired
	public long setTotal_price(long order_id) ;
	
	@Autowired
	public long getOrder_idByUser_id(long user_id);
	
	@Autowired
	public List<address> getAdressByUser_id(long user_id);
	
	@Autowired
	public long getOrder_idByAddress_id(long address_id);
	
	@Autowired
	public long updateStatusOrderDelivery(long order_id,int order_status,long user_delivery) ;
	
	@Autowired
	public long updateStaffOrder(long order_id,int order_status,long user_accept) ;
	
	@Autowired
	public List<bill> getListBill();
	
	@Autowired
	public List<orders> orderDelivery();
	
	@Autowired
	public long updateQuantityCart(String watch_id,int quantity);
	
	@Autowired
	public long addAddress(address address) ;
	
	@Autowired
	public long deleteAddress(long address_id);
	
	@Autowired
	public long staffSuccessOrder(long order_id,long user_id);

}
