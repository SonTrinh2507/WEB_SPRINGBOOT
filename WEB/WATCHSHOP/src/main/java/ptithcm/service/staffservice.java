package ptithcm.service;

import java.sql.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ptithcm.entity.staffs;
import ptithcm.entity.users;

@Service
public interface staffservice {
	@Autowired
	public long updateStaff(long staff_id, String staff_name, String gender, String phone, Date birthday,
			String address, long user_id) ;
	
	@Autowired
	public long addStaff(staffs staff) ;
	
	@Autowired
	public long deleteStaff(long staff_id);
	
	@Autowired
	public List<staffs> searchStaff(String key);
	
	@Autowired
	public List<staffs> dsStaff();
	
	@Autowired
	public boolean checkPhoneStaffExist(String phone);
	
	@Autowired
	public boolean checkPhoneStaff(String phone, long satff_id) ;
	
	@Autowired
	public List<users> dsEmailofStaff();
	
	
	@Autowired
	public List<staffs> staffPage(int pageNumber, int pagesize, String order, String dir);
	
	@Autowired
	public long getStaffCount() ;
	
	@Autowired
	public int searchStaffCount(String key);
	
	
}
