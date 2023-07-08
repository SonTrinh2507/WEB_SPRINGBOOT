package ptithcm.service;


import java.sql.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ptithcm.entity.customer;

@Service
public interface customerservice {
	@Autowired
	public long updateCustomer(long customer_id,String customername, String gender, String address,String phone, Date birthday,long user_id);
	
	@Autowired
	public long addCustomer(customer customer);
	
	@Autowired
	public List<customer> CustomerPage(int pageNumber, int pagesize, String order, String dir);
	

	@Autowired
	public boolean checkPhoneCustomerExist(String phone);
	
	@Autowired
	public customer  updateCustomerAfterUpdate(long customer_id) ;
	
	@Autowired
	public customer getInfoCustomerLogin(long user_id);
	
	@Autowired
	public List<customer> dsCustomer();
	

	@Autowired
	public long deleteCustomer(long customer_id) ;
	
	@Autowired
	public boolean checkPhoneCustomer(String phone, long customer_id);
	
	@Autowired
	public List<customer> searchCustomer(String key);
	
	@Autowired
	public long getCustomerCount();
	
	@Autowired
	public long searchCustomerCount(String key) ;
}
