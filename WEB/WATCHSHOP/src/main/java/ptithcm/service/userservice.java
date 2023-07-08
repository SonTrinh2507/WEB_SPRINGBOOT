package ptithcm.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ptithcm.entity.customer;
import ptithcm.entity.staffs;
import ptithcm.entity.users;

@Service
public interface userservice {
	
	@Autowired
	public boolean checkLogin(String username, String password) ;

	@Autowired
	public users getLogin(String username, String password);
	
	@Autowired
	public users  getInfoLogin(String username, String password);
	
	@Autowired
	public staffs getInfoStaffLogin(long staff_id);
	
	@Autowired
	public users updateUserAfterUpdate(String username);
	
	@Autowired
	public List <users > dsUser ();
	
	@Autowired
	public List<users> dsUserByRole();
	
	@Autowired
	public long getUserCount();
	
	@Autowired
	public users getInfoCustomerLogin(String username, String password);
	
	@Autowired
	public boolean checkUsernameExist(String username);
	
	@Autowired
	public boolean checkPhoneExist(String phone) ;
	
	@Autowired
	public boolean checkPhoneCustomer(String phone, long user_id) ;
	
	@Autowired
	public boolean checkEmailExist(String email);
	
	@Autowired
	public boolean checkEmailCustomer(String email, long user_id);
	
	@Autowired
	public boolean checkIDandUsernameExist(String username, long idUser);
	
	@Autowired
	public int addAccount(users  account);
	
	@Autowired
	public users checkInfoGetPasswordExist(String username, String email);
	
	@Autowired
	public int updateUserCustomer(long user_id, String email, String phone,String status, long role_id);
	
	@Autowired
	public long updateUser(long user_id, String email, String phone);
	
	@Autowired
	public boolean checkOldPassWordExactly(String password, String username);
	
	@Autowired
	public int updatePassword(String password, String username);
	
	@Autowired
	public String getStatusUserByUsername(String username);
	
	@Autowired
	public List<customer> customerPage(int pageNumber, int pagesize, String order, String dir) ;
	@Autowired
	public long deleteUser(long user_id);
	
	@Autowired
	public int searchCustomerCount(String key);
	
	@Autowired
	public List<customer> SearchCustomer(String key);
	
	@Autowired
	public List<users> getUserCustomer();
	
	@Autowired
	public staffs  updateStaffAfterUpdate(long staff_id) ;
	
	@Autowired
	public int updateUserStaff(long user_id, String email, String phone,String status, long role_id);
	

	@Autowired
	public long getUser_idByCustomer_id(long customer_id);
}
