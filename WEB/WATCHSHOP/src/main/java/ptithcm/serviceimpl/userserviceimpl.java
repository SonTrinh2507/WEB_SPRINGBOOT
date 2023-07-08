package ptithcm.serviceimpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ptithcm.dao.userdao;
import ptithcm.entity.customer;
import ptithcm.entity.staffs;
import ptithcm.entity.users;
import ptithcm.service.userservice;

@Service
public class userserviceimpl implements userservice {
	@Autowired
	userdao userdao;
	
	@Override
	public boolean checkLogin(String username, String password) {
		return userdao.checkLogin(username, password);
	}
	
	@Override
	public users getLogin(String username, String password) {
		return userdao.getLogin(username, password);
	}
	
	@Override
	public users  getInfoLogin(String username, String password) {
		return userdao.getInfoLogin(username, password);
	}
	
	@Override
	public users getInfoCustomerLogin(String username, String password) {
		return userdao.getInfoCustomerLogin(username, password);
	}
	@Override
	public staffs getInfoStaffLogin(long staff_id) {
		return userdao.getInfoStaffLogin(staff_id);
	}
	@Override
	public users updateUserAfterUpdate(String username) {
		return userdao.updateUserAfterUpdate(username);
	}
	
	@Override
	public List <users > dsUser (){
		return userdao.dsUser();
	}
	
	@Override
	public List<users> dsUserByRole(){
		return userdao.dsUserByRole();
	}
	
	@Override
	public long getUserCount() {
		return userdao.getUserCount();
	}
	
	@Override
	public boolean checkUsernameExist(String username) {
		return userdao.checkUsernameExist(username);
	}
	
	@Override
	public boolean checkPhoneExist(String phone) {
		return userdao.checkPhoneExist(phone);
	}
	
	@Override
	public boolean checkPhoneCustomer(String phone, long user_id) {
		return userdao.checkPhoneCustomer(phone, user_id);
	}
	
	@Override
	public boolean checkIDandUsernameExist(String username, long idUser) {
		return userdao.checkIDandUsernameExist(username, idUser);
	}
	
	
	@Override
	public int addAccount(users  account) {
		return userdao.addAccount(account);
	}
	
	@Override
	public int updateUserCustomer(long user_id, String email, String phone,String status, long role_id) {
		return userdao.updateUserCustomer(user_id, email, phone, status, role_id);
	}
	
	@Override
	public long updateUser(long user_id, String email, String phone) {
		return userdao.updateUser(user_id, email, phone);
	}
	
	@Override
	public boolean checkEmailExist(String email) {
		return userdao.checkEmailExist(email);
	}
	
	@Override
	public boolean checkEmailCustomer(String email, long user_id) {
		return userdao.checkEmailCustomer(email, user_id);
	}
	
	@Override
	public boolean checkOldPassWordExactly(String password, String username) {
		return userdao.checkOldPassWordExactly(password, username);
	}
	
	@Override
	public int updatePassword(String password, String username) {
		return userdao.updatePassword(password, username);
	}
	
	@Override
	public String getStatusUserByUsername(String username) {
		return userdao.getStatusUserByUsername(username);
	}
	
	
	@Override
	public users checkInfoGetPasswordExist(String username, String email) {
		return userdao.checkInfoGetPasswordExist(username, email);
	}
	@Override
	public List<customer> customerPage(int pageNumber, int pagesize, String order, String dir)  {
		// TODO Auto-generated method stub
		return userdao.customerPage(pageNumber, pagesize, order, dir);
	}

	@Override
	public long deleteUser(long user_id) {
		// TODO Auto-generated method stub
		return userdao.deleteUser(user_id);
	}

	@Override
	public int searchCustomerCount(String key) {
		// TODO Auto-generated method stub
		return userdao.searchCustomerCount(key);
	}

	@Override
	public List<customer> SearchCustomer(String key) {
		// TODO Auto-generated method stub
		return userdao.searchCustomer(key);
	}
	@Override
	public List<users> getUserCustomer(){
		return userdao.getUserCustomer();
	}
	
	@Override
	public staffs  updateStaffAfterUpdate(long staff_name) {
		return userdao.updateStaffAfterUpdate(staff_name);
	}
	
	@Override
	public int updateUserStaff(long user_id, String email, String phone,String status, long role_id) {
		return userdao.updateUserStaff(user_id, email, phone, status, role_id);
	}
	
	@Override
	public long getUser_idByCustomer_id(long customer_id) {
		return userdao.getUser_idByCustomer_id(customer_id);
	}
	
	
}
