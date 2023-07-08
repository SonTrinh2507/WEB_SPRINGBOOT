package ptithcm.admin.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ptithcm.controller.UserController;
import ptithcm.entity.users;
import ptithcm.security.PasswordEncoderUtil;
import ptithcm.entity.customer;
import ptithcm.serviceimpl.userserviceimpl;
import ptithcm.serviceimpl.brandserviceimpl;
import ptithcm.serviceimpl.categoryserviceimpl;
import ptithcm.serviceimpl.customerserviceimpl;
import ptithcm.serviceimpl.statisticsserviceimpl;

@Controller
public class customeradmincontroller {
	@Autowired
	userserviceimpl accountServiceImpl;

	@Autowired
	statisticsserviceimpl statisticsServiceImpl;

	@Autowired
	categoryserviceimpl categoryserviceimpl;

	@Autowired
	brandserviceimpl brandserviceimpl;

	@Autowired
	customerserviceimpl customerserviceimpl;
	private static customer customer;
	private static users users;
	private int currentpage = 1;
	private int maxpage = 1;
	private int pagesize = 1;
	private int hienthi = 5;
	private int page = 1;
	private String order = "customer_name";
	private String dir = "asc";

	@RequestMapping("admin/customer")
	public String staffAdmin(ModelMap model, RedirectAttributes ra, HttpServletRequest request, HttpSession ss) {
		model.addAttribute("categories", categoryserviceimpl.dscategory());
		model.addAttribute("brands", brandserviceimpl.dsbrands());
		if (request.getParameter("page") != "" && request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		if (request.getParameter("keyword") != "" && request.getParameter("keyword") != null) {
			request.setAttribute("count", customerserviceimpl.searchCustomerCount(request.getParameter("keyword")));
			request.setAttribute("customer", customerserviceimpl.searchCustomer(request.getParameter("keyword")));
			request.setAttribute("maxpage", 0);
			request.setAttribute("currentpage", 1);
			request.setAttribute("pagesize", 0);
		} else {
			model.addAttribute("maxpage", (int) Math.ceil((double) customerserviceimpl.getCustomerCount() / hienthi));
			model.addAttribute("currentpage", page);
			model.addAttribute("pagesize", pagesize);
			model.addAttribute("customer", customerserviceimpl.CustomerPage(page, hienthi, order, dir));
			model.addAttribute("count", customerserviceimpl.getCustomerCount());
		}
		List<users> users = accountServiceImpl.dsUser();
		for(users list:users) {
			 String encodedPassword = PasswordEncoderUtil.encodePassword(list.getPassword());
			 list.setPassword(encodedPassword);
			    System.out.println(list.getPassword());
		}
		model.addAttribute("userLogin", UserController.getUser());
		model.addAttribute("total_staff", customerserviceimpl.getCustomerCount());
		model.addAttribute("customerList", customerserviceimpl.dsCustomer());
		model.addAttribute("users", users);
		if(UserController.getUser() != null) {
			if(UserController.getUser().getRole_id() == 1) {
				ss.setAttribute("sudung", true);
			}else {
				ss.setAttribute("sudung", false);
			}
		}
		return "admin/customer";
	}

		@RequestMapping(value = "admin/customer/add",method = RequestMethod.POST)
		public String customerEdit(ModelMap model,@RequestParam("user_id") Long user_id,@RequestParam("email") String email,
				@RequestParam("phone") String phone, @RequestParam("status") String status,@RequestParam("role_id") long role_id,@RequestParam("username") String username,  RedirectAttributes ra) throws ParseException {
			if(user_id != null) {
				model.addAttribute("emailError", "LỖI RỒI THUÝ ƠI");
				int result = accountServiceImpl.updateUserCustomer(user_id, email, phone, status, role_id);
				ra.addFlashAttribute("message",6);//update thanh cong

			}else {
				if(email.equals("") || phone.equals("") || status.equals("") || username.equals("")) {
					ra.addFlashAttribute("message",1);//thong tin khong duoc de trong
				}else if(accountServiceImpl.checkUsernameExist(username) == true) {
					ra.addFlashAttribute("message",2);//username ton tai
				}
				else if(accountServiceImpl.checkEmailExist(email) == true ) {
					ra.addFlashAttribute("message",3);//email ton tai
				}else if(accountServiceImpl.checkPhoneExist(phone) == true) {
					ra.addFlashAttribute("message",4);//phone ton tai
				}
				else if( !accountServiceImpl.checkEmailExist(email) && !accountServiceImpl.checkPhoneExist(phone) && !accountServiceImpl.checkUsernameExist(username) ) {
				users A = new users();
				customer B = new customer();
				String birthday = "2002-01-01";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date date = sdf.parse(birthday);
				java.sql.Date sqlDate = new Date(date.getTime());
				System.out.println("String converted to java.sql.Date :" + sqlDate);
				A.setUsername(username);
				A.setEmail(email);
				A.setPassword(phone);
				A.setPhone(phone);
				A.setRole_id(role_id);
				A.setStatus(status);
				long kq = accountServiceImpl.addAccount(A);
				B.setBirthday(null);
				B.setCustomer_name(username);
				B.setPhone(phone);
				B.setUser_id(A.getUser_id());
			long kq1 = customerserviceimpl.addCustomer(B);
			ra.addFlashAttribute("message",5);//'them thanh cong
				
				}
			}
			return "redirect:/admin/customer.htm";
		}
		
		@RequestMapping(value = "admin/customer/delete", method = RequestMethod.POST)
		public String deleteCustomer(@RequestParam("customerid") Long customer_id,  RedirectAttributes ra) {	
			if(customer_id != null) {
				long user_id = accountServiceImpl.getUser_idByCustomer_id(customer_id);
				System.out.println("user_id la: " + user_id);
				if(user_id != 0) {
					long result = customerserviceimpl.deleteCustomer(customer_id);
					System.out.println("ketqua xoa 1: " + result);
					if(result != 0) {
						
						long result1 = accountServiceImpl.deleteUser(user_id);
						System.out.println("ket qua xoa 2: " + result1);
					ra.addFlashAttribute("message",7);//xoá khách hàng thành công
					}else {
						ra.addFlashAttribute("message",8);//xoá khách hàng thất bại
					}
				}				
			}					
			return "redirect:/admin/customer.htm";	
			
		}
		
		@RequestMapping(value = "admin/customer", params = "keyword")
		public String customerSearch(@RequestParam(required = true) String keyword, HttpServletRequest request) {
			getMaxPage();
			request.setAttribute("count", customerserviceimpl.searchCustomerCount(keyword));
			request.setAttribute("customers", customerserviceimpl.searchCustomer(keyword));
			request.setAttribute("maxpage", 0);
			request.setAttribute("currentpage", 1);
			request.setAttribute("pagesize", 0);
			request.setAttribute("orderLink", "asc");
			
		    return "admin/customer";
		}
		public int getMaxPage() {
			int brandcount = (int) customerserviceimpl.getCustomerCount();
			if(brandcount == 0) {
				hienthi = 1;
			}else if(brandcount < 6) {
				hienthi = brandcount;
				pagesize = 1;
			}
			else if(brandcount < 11) {
				hienthi = 5;
				pagesize = 2;
			}else {
				hienthi = 5;
				pagesize = 3;
			}
			if(brandcount % hienthi == 0) {
				maxpage = brandcount / hienthi;
			}else {
				maxpage = (int)(brandcount / hienthi) + 1;
			}
			return maxpage;
		}
		public static customer getCustomer() {
			return customer;
		}

}
