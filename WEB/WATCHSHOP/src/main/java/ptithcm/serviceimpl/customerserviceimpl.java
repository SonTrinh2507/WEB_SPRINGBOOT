package ptithcm.serviceimpl;


import java.sql.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ptithcm.dao.customerdao;
import ptithcm.entity.customer;
import ptithcm.service.customerservice;

@Service
public class customerserviceimpl implements customerservice{

	@Autowired
	customerdao customerdao;
	
	@Override
	public long updateCustomer(long customer_id,String customername, String gender, String address, String phone, Date birthday,long user_id) {
		return customerdao.updateCustomer(customer_id, customername, gender, address, phone, birthday,user_id);
	}
	
	@Override
	public long addCustomer(customer customer) {
		return customerdao.addCustomer(customer);
	}
	@Override
	public List<customer> CustomerPage(int pageNumber, int pagesize, String order, String dir){
		return customerdao.CustomerPage(pageNumber, pagesize, order, dir);
	}
	

	
	@Override
	public boolean checkPhoneCustomerExist(String phone) {
		return customerdao.checkPhoneCustomerExist(phone);
	}
	
	@Override
	public customer  updateCustomerAfterUpdate(long customer_id) {
		return customerdao.updateCustomerAfterUpdate(customer_id);
	}
	
	@Override
	public customer getInfoCustomerLogin(long user_id) {
		return customerdao.getInfoCustomerLogin(user_id);
	}
	
	@Override
	public List<customer> dsCustomer(){
		return customerdao.dsCustomer();
	}
	
	
	
	@Override
	public long deleteCustomer(long customer_id) {
		return customerdao.deleteCustomer(customer_id);
	}
	
	@Override
	public boolean checkPhoneCustomer(String phone, long customer_id) {
		return customerdao.checkPhoneCustomer(phone, customer_id);
	}
	
	@Override
	public List<customer> searchCustomer(String key){
		return customerdao.searchCustomer(key);
	}
	
	@Override
	public long getCustomerCount() {
		return customerdao.getCustomerCount();
	}
	
	@Override
	public long searchCustomerCount(String key) {
		return customerdao.searchCustomerCount(key);
	}
}
