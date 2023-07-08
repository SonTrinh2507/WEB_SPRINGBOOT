package ptithcm.serviceimpl;

import java.sql.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ptithcm.dao.staffdao;
import ptithcm.entity.staffs;
import ptithcm.entity.users;
import ptithcm.service.staffservice;

@Service
public class staffserviceimpl implements staffservice {
	@Autowired
	staffdao staffdao;
	
	@Override
	public long updateStaff(long staff_id, String staff_name, String gender, String phone, Date birthday,
			String address, long user_id) {
		return staffdao.updateStaff(staff_id, staff_name, gender, phone, birthday, address,user_id);
	}
	
	@Override
	public long addStaff(staffs staff) {
		return staffdao.addStaff(staff);
	}
		
	@Override
	public long deleteStaff(long staff_id) {
		return staffdao.deleteStaff(staff_id);
	}
	
	@Override
	public List<staffs> searchStaff(String key){
		return staffdao.searchStaff(key);
	}
	
	@Override
	public List<staffs> dsStaff(){
		return staffdao.dsStaff();
	}
	
	@Override
	public boolean checkPhoneStaffExist(String phone) {
		return staffdao.checkPhoneStaffExist(phone);
	}
	
	@Override
	public boolean checkPhoneStaff(String phone, long satff_id) {
		return staffdao.checkPhoneStaff(phone, satff_id);
	}
	

	@Override
	public List<staffs> staffPage(int pageNumber, int pagesize, String order, String dir){
		return staffdao.staffPage(pageNumber, pagesize, order, dir);
	}
	
	@Override
	public long getStaffCount() {
		return staffdao.getStaffCount();
	}
	
	@Override
	public int searchStaffCount(String key) {
		return staffdao.searchStaffCount(key);
	}
	
	@Override
	public List<users> dsEmailofStaff(){
		return staffdao.dsEmailofStaff();
	}
	
	
	
}
