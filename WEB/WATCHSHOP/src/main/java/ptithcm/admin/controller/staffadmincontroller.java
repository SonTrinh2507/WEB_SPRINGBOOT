package ptithcm.admin.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ptithcm.controller.UserController;
import ptithcm.entity.staffs;
import ptithcm.entity.users;
import ptithcm.security.PasswordEncoderUtil;
import ptithcm.serviceimpl.brandserviceimpl;
import ptithcm.serviceimpl.categoryserviceimpl;
import ptithcm.serviceimpl.staffserviceimpl;
import ptithcm.serviceimpl.userserviceimpl;

@Controller
public class staffadmincontroller {
	@Autowired
	staffserviceimpl staffserviceimpl;

	@Autowired
	brandserviceimpl brandserviceimpl;

	@Autowired
	userserviceimpl accountServiceImpl;

	@Autowired
	categoryserviceimpl categoryserviceimpl;
	private int maxpage = 1;
	private int pagesize = 1;
	private int hienthi = 5;
	private int page = 1;
	private String order = "staff_name";
	private String dir = "asc";

	@RequestMapping("admin/staff")
	public String staffAdmin(ModelMap model, RedirectAttributes ra, HttpServletRequest request, HttpSession ss) {
		model.addAttribute("categories", categoryserviceimpl.dscategory());
		model.addAttribute("brands", brandserviceimpl.dsbrands());
		if (request.getParameter("page") != "" && request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		if (request.getParameter("keyword") != "" && request.getParameter("keyword") != null) {
			request.setAttribute("count", staffserviceimpl.searchStaffCount(request.getParameter("keyword")));
			request.setAttribute("staffs", staffserviceimpl.searchStaff(request.getParameter("keyword")));
			request.setAttribute("maxpage", 0);
			request.setAttribute("currentpage", 1);
			request.setAttribute("pagesize", 0);
		} else {
			model.addAttribute("maxpage", (int) Math.ceil((double) staffserviceimpl.getStaffCount() / hienthi));
			model.addAttribute("currentpage", page);
			model.addAttribute("pagesize", pagesize);
			model.addAttribute("staffs", staffserviceimpl.staffPage(page, hienthi, order, dir));
			model.addAttribute("count", staffserviceimpl.getStaffCount());
		}

		List<users> users = accountServiceImpl.dsUserByRole();
		model.addAttribute("users", users);
		for (users list : users) {
			String encodedPassword = PasswordEncoderUtil.encodePassword(list.getPassword());
			list.setPassword(encodedPassword);
			System.out.println(list.getPassword());
		}

		ss.setAttribute("check_role", UserController.getUser().getRole_id());
		model.addAttribute("userLogin", UserController.getUser());
		model.addAttribute("total_staff", staffserviceimpl.getStaffCount());
		model.addAttribute("staffList", staffserviceimpl.dsStaff());

		ss.setAttribute("userid", UserController.getUser().getUser_id());
		int kq = (int) ss.getAttribute("role_id");
		System.out.println("KQ: " + kq);
		long result = (long) ss.getAttribute("staff_id");
		System.out.println("KQ1: " + result);
		if (UserController.getUser() != null) {
			if (UserController.getUser().getRole_id() == 1) {
				ss.setAttribute("sudung", true);
			} else {
				ss.setAttribute("sudung", false);
			}
		}
		return "admin/staff";
	}

	@RequestMapping(value = "admin/staff/edit", method = RequestMethod.POST)
	public String staffUserEdit(ModelMap model, @RequestParam("user_id") Long user_id,
			@RequestParam("email") String email, @RequestParam("phone") String phone,
			@RequestParam("status") String status, @RequestParam("role_id") long role_id,
			@RequestParam("username") String username, RedirectAttributes ra) throws ParseException {
		if (user_id != null) {
			model.addAttribute("emailError", "LỖI RỒI THUÝ ƠI");
			int result = accountServiceImpl.updateUserStaff(user_id, email, phone, status, role_id);
			ra.addFlashAttribute("message", 6);// update thanh cong
			System.out.println(result);
		} else {
			if (email.equals("") || phone.equals("") || status.equals("") || username.equals("")) {
				ra.addFlashAttribute("message", 1);// thong tin khong duoc de trong
			} else if (accountServiceImpl.checkUsernameExist(username) == true) {
				ra.addFlashAttribute("message", 2);// username ton tai
			} else if (accountServiceImpl.checkEmailExist(email) == true) {
				ra.addFlashAttribute("message", 3);// email ton tai
			} else if (accountServiceImpl.checkPhoneExist(phone) == true) {
				ra.addFlashAttribute("message", 4);// phone ton tai
			} else if (!accountServiceImpl.checkEmailExist(email) && !accountServiceImpl.checkPhoneExist(phone)
					&& !accountServiceImpl.checkUsernameExist(username)) {
				users A = new users();
				staffs B = new staffs();
				String birthday = "2002-01-01";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date date = sdf.parse(birthday);
				java.sql.Date sqlDate = new Date(date.getTime());
				System.out.println("String converted to java.sql.Date :" + sqlDate);
				A.setUsername(username);
				A.setEmail(email);
				A.setPhone(phone);
				A.setPassword(phone);
				A.setRole_id(role_id);
				A.setStatus(status);
				long kq = accountServiceImpl.addAccount(A);
				B.setBirthday(null);
				B.setStaff_name(username);
				B.setAddress("");
				B.setPhone(phone);
				B.setUser_id(A.getUser_id());
				long kq1 = staffserviceimpl.addStaff(B);
				ra.addFlashAttribute("message", 5);// them thanh cong
			}
		}
		return "redirect:/admin/staff.htm";

	}

	@RequestMapping(value = "admin/staff/delete", method = RequestMethod.POST)
	public String brandEdit(@RequestParam("customerid") long idcustomer, RedirectAttributes ra) {
		System.out.println(idcustomer);
		long result = staffserviceimpl.deleteStaff(idcustomer);
		long result1 = accountServiceImpl.deleteUser(idcustomer);
		System.out.println(result);
		return "redirect:/admin/staff.htm";

	}

	@RequestMapping(value = "admin/staff", params = "keyword")
	public String staffSearch(@RequestParam(required = true) String keyword, HttpServletRequest request) {
		getMaxPage();
		request.setAttribute("count", staffserviceimpl.searchStaffCount(keyword));
		request.setAttribute("customers", staffserviceimpl.searchStaff(keyword));
		request.setAttribute("maxpage", 0);
		request.setAttribute("currentpage", 1);
		request.setAttribute("pagesize", 0);
		request.setAttribute("orderLink", "asc");

		return "admin/customer";
	}

	public int getMaxPage() {
		int staffcount = (int) staffserviceimpl.getStaffCount();
		if (staffcount == 0) {
			hienthi = 1;
		} else if (staffcount < 6) {
			hienthi = staffcount;
			pagesize = 1;
		} else if (staffcount < 11) {
			hienthi = 5;
			pagesize = 2;
		} else {
			hienthi = 5;
			pagesize = 3;
		}
		if (staffcount % hienthi == 0) {
			maxpage = staffcount / hienthi;
		} else {
			maxpage = (int) (staffcount / hienthi) + 1;
		}
		return maxpage;
	}
	
}
