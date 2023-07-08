package ptithcm.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.sql.Date;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ptithcm.entity.users;
import ptithcm.entity.customer;
import ptithcm.entity.items;
import ptithcm.entity.orders;
import ptithcm.entity.reviews;
import ptithcm.entity.staffs;
import ptithcm.serviceimpl.userserviceimpl;
import ptithcm.serviceimpl.brandserviceimpl;
import ptithcm.serviceimpl.categoryserviceimpl;
import ptithcm.serviceimpl.customerserviceimpl;
import ptithcm.serviceimpl.homeserviceimpl;
import ptithcm.serviceimpl.itemserviceimpl;
import ptithcm.serviceimpl.orderdetailserviceimpl;
import ptithcm.serviceimpl.orderserviceimpl;
import ptithcm.serviceimpl.reviewserviceimpl;
import ptithcm.serviceimpl.staffserviceimpl;
import ptithcm.serviceimpl.statisticsserviceimpl;
import ptithcm.security.PasswordGenerator;

@Controller
public class UserController {
	@Autowired
	userserviceimpl accountServiceImpl;

	@Autowired
	itemserviceimpl itemServiceImpl;

	@Autowired
	homeserviceimpl homeServiceImpl;

	@Autowired
	orderserviceimpl orderServiceImpl;

	@Autowired
	statisticsserviceimpl statisticsServiceImpl;

	@Autowired
	staffserviceimpl staffserviceimpl;

	@Autowired
	customerserviceimpl customerserviceimpl;

	@Autowired
	brandserviceimpl brandserviceimpl;

	@Autowired
	categoryserviceimpl categoryserviceimpl;

	@Autowired
	reviewserviceimpl reviewserviceimpl;
	
	@Autowired
	orderdetailserviceimpl orderdetailserviceimpl;
	@Autowired
	JavaMailSender mailer;

	private static users user;
	private static staffs staffs;
	private static customer customer;

	private int currentpage = 1;
	private int maxpage = 1;
	private int pagesize = 1;
	private int hienthi = 1;
	private String order = "order_id"; 
	private String dir = "asc";
	private int status_var;

	@RequestMapping("login")
	public String login(HttpServletRequest request) {
		// testguimail();
		HttpSession session = request.getSession();
		if (session != null) {
			if (session.getAttribute("username") != null && user != null && user.getRole_id() == 3) {
				return "redirect:/account/infoCustomer.htm";
			} else if (session.getAttribute("username") != null && user != null && user.getRole_id() == 2) {
				return "redirect:/staff/info.htm";
			} else if (session.getAttribute("username") != null && user != null && user.getRole_id() == 1) {
				return "redirect:/admin/info.htm";
			}

		}
		return "account/login";
	}

	public boolean SentNewPassWord(String email, String username, String password) {
		try {
			String from = "T3SWATCH.PTIT.HCM";
			String to = email;
			String body = "<h2>Thế giới đồng hồ số một Việt Nam xin cập nhật mật khẩu đăng nhập hiện tại của bạn là: "
					+ password + "</h2>";
			String subject = "Cấp lại mật khẩu đăng nhập của tài khoản " + username
					+ " để đăng nhập vào kênh thế giới mua sắm đồng hồ số một Việt Nam";
			MimeMessage mail = mailer.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mail);
			helper.setFrom(from, from);
			helper.setTo(to);
			helper.setReplyTo(from, from);
			helper.setSubject(subject);
			helper.setText(body, true);
			mailer.send(mail);
			System.out.println("Gửi mail thành công");
			return true;
		} catch (Exception e) {
			System.out.println("Gửi mail thất bại");
			return false;
		}
	}

	public boolean checkLogin(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session != null) {
			if (session.getAttribute("username") != null && user != null && user.getRole_id() == 3) {
				return true;
			}
		}
		return false;
	}

	public boolean checkAmin(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session != null) {
			if (session.getAttribute("username") != null && user != null && user.getRole_id() == 1) {
				return true;
			}
		}
		return false;
	}

	public boolean checkStaff(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session != null) {
			if (session.getAttribute("username") != null && user != null && user.getRole_id() == 2) {
				return true;
			}
		}
		return false;
	}

	@RequestMapping("signup")
	public String signup(HttpSession session) {
		if (session != null) {
			if (session.getAttribute("username") != null && user != null) {
				return "redirect:/account/infoCustomer.htm";
			}
		}
		return "account/signup";
	}

	@RequestMapping("account/login/verify")
	public String verify(HttpSession session) {
		if (session != null) {
			if (session.getAttribute("username") != null && user != null) {
				return "redirect:/account/infoCustomer.htm";
			}
		}
		return "account/verify";
	}

	@RequestMapping("account/login/forgetpass")
	public String forgetpass(HttpSession session) {
		if (session != null) {
			if (session.getAttribute("username") != null && user != null) {
				return "redirect:/account/infoCustomer.htm";
			}
		}
		return "account/forget-password";
	}

	@RequestMapping(value = "account/login/forgetpass/submit", method = RequestMethod.POST)
	public String register(@RequestParam("username") String username, @RequestParam("email") String email,
			RedirectAttributes ra) {
		username = username.trim();
		email = email.trim();
		if (username.length() < 3 || email.length() == 0 || username.contains(" ") == true
				|| email.contains(" ") == true || email.length() == 0 || accountServiceImpl.checkUsernameExist(username) == false) {
			ra.addFlashAttribute("check_forget", 1); // Lỗi username...
		} else if (accountServiceImpl.checkInfoGetPasswordExist(username, email) == null) {
			ra.addFlashAttribute("check_forget", 2); // Username + email chưa chính xác
		} else {
			users B = accountServiceImpl.checkInfoGetPasswordExist(username, email);
			String passwordRandom = PasswordGenerator.generateRandomPassword(6);
			System.out.println("passrandom : " + passwordRandom);
			long kq = accountServiceImpl.updatePassword(passwordRandom, username);
			if(kq > 0) {
				boolean result = SentNewPassWord(email, username, passwordRandom);
				if (result == true) {
					ra.addFlashAttribute("check_forget", 3); // Thành công
					
				} else {
					ra.addFlashAttribute("check_forget", 4); // Thất bại /account/updatepassword/submit.htm
				}
			}

		}
		return "redirect:/account/login/forgetpass.htm";

	}

	@RequestMapping(value = "account/updatepassword", method = RequestMethod.POST)
	public String updatepasswordsubmit(@RequestParam("oldpassword") String oldpassword,
			@RequestParam("newpassword") String newpassword, @RequestParam("renewpassword") String renewpassword,
			RedirectAttributes ra) {
		oldpassword = oldpassword.trim();
		renewpassword = renewpassword.trim();
		newpassword = newpassword.trim();
		String username_login = UserController.getUser().getUsername();
		if (oldpassword.equals("") || oldpassword.equals("") || newpassword.equals("")) {
			ra.addFlashAttribute("message",1); // Lỗi trống hoặc sai ký tự
		} else if (accountServiceImpl.checkOldPassWordExactly(oldpassword, username_login) == false) {
			ra.addFlashAttribute("message", 2); // Mật khẩu cũ không chính xác
		} else if (renewpassword.equals(newpassword) == false) {
			ra.addFlashAttribute("message", 3); // Hai mật khẩu không chính xác
		} else {
			int result = accountServiceImpl.updatePassword(renewpassword, username_login);
			if (result > 0) {
				ra.addFlashAttribute("message", 4); // Thành công
			} else {
				ra.addFlashAttribute("message", 5); // Thất bại
			}
		}

		return "redirect:/account/infoCustomer.htm";

	}

	@RequestMapping(value = "admin/updatepassword", method = RequestMethod.POST)
	public String updatepasswordsubmitAdmin(@RequestParam("oldpassword") String oldpassword,
			@RequestParam("newpassword") String newpassword, @RequestParam("renewpassword") String renewpassword,
			RedirectAttributes ra,HttpSession ss) {
		oldpassword = oldpassword.trim();
		renewpassword = renewpassword.trim();
		newpassword = newpassword.trim();
		String username_login = UserController.getUser().getUsername();
		if (oldpassword.equals("") || oldpassword.equals("") || newpassword.equals("")) {
			ra.addFlashAttribute("message",1); // Lỗi trống hoặc sai ký tự
		} else if (accountServiceImpl.checkOldPassWordExactly(oldpassword, username_login) == false) {
			ra.addFlashAttribute("message", 2); // Mật khẩu cũ không chính xác
		} else if (renewpassword.equals(newpassword) == false) {
			ra.addFlashAttribute("message", 3); // Hai mật khẩu không chính xác
		} else {
			int result = accountServiceImpl.updatePassword(renewpassword, username_login);
			if (result > 0) {
				ra.addFlashAttribute("message", 4); // Thành công
			} else {
				ra.addFlashAttribute("message", 5); // Thất bại
			}
		}

		return "redirect:/admin/info.htm";

	}

	@RequestMapping(value = "signup/submit", method = RequestMethod.POST)
	public String register(@RequestParam("username") String username, @RequestParam("phone") String phone,
			@RequestParam("password") String password, @RequestParam("repassword") String repassword,
			RedirectAttributes ra, @RequestParam("email") String email) {
		username = username.trim();
		phone = phone.trim();
		repassword = repassword.trim();
		password = password.trim();
		java.util.Date currentDate = new java.util.Date();
		if(username.equals("") || phone.equals("") || password.equals("") ||repassword.equals("") || email.equals("")) {
			ra.addFlashAttribute("message",1); //ký tự trống
		}else if(accountServiceImpl.checkUsernameExist(username)) {
			ra.addFlashAttribute("message",2);//username tồn tại
		}else if(accountServiceImpl.checkPhoneExist(phone)) {
			ra.addFlashAttribute("message",3);//trùng sdt
		}else if(accountServiceImpl.checkEmailExist(email)) {
			ra.addFlashAttribute("message",4);//trung email
		}else {
		// Chuyển đổi thành java.sql.Date
		java.sql.Date sqlDate = new java.sql.Date(currentDate.getTime());		
			long role = 3;
			String status = "0";
			users A = new users();
			A.setRole_id(role);
			A.setPhone(phone);
			A.setUsername(username);
			A.setPassword(password);
			A.setEmail(email);
			A.setStatus(status);
			int result = accountServiceImpl.addAccount(A);
			if(result > 0 ) {
			customer B = new customer();
			B.setAddress("");
			B.setBirthday(null);
			B.setCustomer_name(A.getUsername());
			B.setGender("");
			B.setPhone(phone);
			B.setUser_id(A.getUser_id());
			long result1 = customerserviceimpl.addCustomer(B);
			if(result1 > 0) {
				items C = new items();
				C.setUser_id(A.getUser_id());
				long result2 = itemServiceImpl.addItem(C);
				System.out.println("ket qua item :" + result2);
				if(result > 0 && result1 > 0 && result2 > 0 ) {
					ra.addFlashAttribute("message",5);//thành công
			}else {
				System.out.println("ERORR");
				ra.addFlashAttribute("message",6);
			}
			}
			
			
		}
			
		}
		
		return "redirect:/login.htm";

	}

	@RequestMapping("account/infoCustomer")
	public String info(ModelMap model, HttpServletRequest request) {
		if (checkLogin(request) == false) {
			return "redirect:/login.htm"; // "account/login";
		}
		// Đang đăng nhập mà nếu bị xóa tài khoản thì sẽ bị logout
		if (user != null && accountServiceImpl.checkIDandUsernameExist(UserController.getUser().getUsername(),
				UserController.getUser().getUser_id()) == false) {
			return "redirect:/logout.htm";
		}
		System.out.println("GT" + customer.getGender());
		model.addAttribute("user", user);
		model.addAttribute("customer", customer);
		model.addAttribute("customers", customerserviceimpl.dsCustomer());
		model.addAttribute("brands", brandserviceimpl.dsbrands());
		model.addAttribute("categories", categoryserviceimpl.dscategory());
		long user_id = UserController.getUser().getUser_id();
		model.addAttribute("amountspent", statisticsServiceImpl.amountSpentbyIdUser(user_id));
		model.addAttribute("pendingordercount", statisticsServiceImpl.getPendingOrderCountbyIdUser(user_id));
		model.addAttribute("ordersuccesscount", statisticsServiceImpl.getOrderSuccessCountbyIdUser(user_id));
		return "account/infoCustomer";

	}

	@RequestMapping("admin/info")
	public String infoAdmin(ModelMap model, HttpServletRequest request) {
		if (checkAmin(request) == false) {
			return "redirect:/login.htm"; // "account/login";
		}
		// Đang đăng nhập mà nếu bị xóa tài khoản thì sẽ bị logout
		if (user != null && accountServiceImpl.checkIDandUsernameExist(UserController.getUser().getUsername(),
				UserController.getUser().getUser_id()) == false) {
			return "redirect:/logout.htm";
		}

		model.addAttribute("brands", brandserviceimpl.dsbrands());
		model.addAttribute("categories", categoryserviceimpl.dscategory());
		model.addAttribute("user", user);
		model.addAttribute("staff", staffs);
		System.out.println("gioi tinh " + staffs.getGender());
		long user_id = UserController.getUser().getUser_id();
		model.addAttribute("amountspent", statisticsServiceImpl.amountSpentbyIdUser(user_id));
		model.addAttribute("pendingordercount", statisticsServiceImpl.getPendingOrderCountbyIdUser(user_id));
		model.addAttribute("ordersuccesscount", statisticsServiceImpl.getOrderSuccessCountbyIdUser(user_id));
		return "admin/info";

	}

	@RequestMapping("staff/info")
	public String infoStaff(ModelMap model, HttpServletRequest request) {
		if (checkStaff(request) == false) {
			return "redirect:/login.htm"; // "account/login";
		}
		// Đang đăng nhập mà nếu bị xóa tài khoản thì sẽ bị logout
		if (user != null && accountServiceImpl.checkIDandUsernameExist(UserController.getUser().getUsername(),
				UserController.getUser().getUser_id()) == false) {
			return "redirect:/account/logout.htm";
		}

		model.addAttribute("brands", brandserviceimpl.dsbrands());
		model.addAttribute("categories", categoryserviceimpl.dscategory());
		model.addAttribute("user", user);
		model.addAttribute("staff", staffs);
		long user_id = UserController.getUser().getUser_id();
		model.addAttribute("amountspent", statisticsServiceImpl.amountSpentbyIdUser(user_id));
		model.addAttribute("pendingordercount", statisticsServiceImpl.getPendingOrderCountbyIdUser(user_id));
		model.addAttribute("ordersuccesscount", statisticsServiceImpl.getOrderSuccessCountbyIdUser(user_id));
		return "admin/info";

	}

	@RequestMapping(value = "account/infoCustomer", method = RequestMethod.POST)
	public String updateInfo(@RequestParam("email") String email, @RequestParam("phone") String phone,
			@RequestParam("customer_name") String customer_name, @RequestParam("birthday") Date birthday,
			@RequestParam("address") String address, @RequestParam("gender") String gender,
			@RequestParam("customer_id") long customer_id, @RequestParam("role_id") int role_id,
			@RequestParam("user_id") long user_id, ModelMap model, RedirectAttributes ra, HttpServletRequest request)
			throws ParseException {
		String username = user.getUsername();

		SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd");

		if (checkLogin(request) == false) {
			return "redirect:/login.htm"; // "account/login";
		}
		email = email.trim();
		phone = phone.trim();
		String email_login = UserController.getUser().getEmail();
		String phone_login = UserController.getUser().getPhone();
		if (email.equals(email_login) == false && email.length() != 0) {
			if (accountServiceImpl.checkEmailExist(email) == true) {
				System.out.println("VAO DAY LAM 1");
				ra.addFlashAttribute("check_edit", 1);
				return "redirect:/account/infoCustomer.htm";
			}
		}

		if (phone.equals(phone_login) == false && phone.length() != 0
				&& accountServiceImpl.checkPhoneCustomer(phone, user_id) == false) {
			if (accountServiceImpl.checkPhoneExist(phone) == true) {
				System.out.println("VAO DAY LAM 2");
				ra.addFlashAttribute("check_edit", 1);//trung sdt
				return "redirect:/account/infoCustomer.htm";
			}
		}

		long result = accountServiceImpl.updateUser(user_id, email, phone);
		long result1 = customerserviceimpl.updateCustomer(customer_id, customer_name, gender, address, phone, birthday,
				user_id);

		if (result > 0 && result1 > 0) {
			user = accountServiceImpl.updateUserAfterUpdate(username);
			customer = customerserviceimpl.updateCustomerAfterUpdate(customer_id);
			ra.addFlashAttribute("check_edit", 2);//thanh cong
		} else {
			ra.addFlashAttribute("check_edit", 3);//that bai
		}

		// INFO ******
		ra.addFlashAttribute("user", user);
		ra.addFlashAttribute("customer", customer);
		System.out.println("CUSTOMERNAME NEW = " + customer.getCustomer_name());
		System.out.println("GENDER NEW = " + customer.getGender());
		System.out.println("SAU KHI EDIT");
		System.out.println("USERNAME NEW = " + user.getEmail());
		return "redirect:/account/infoCustomer.htm";
	}

	@RequestMapping(value = "admin/info/edit", method = RequestMethod.POST)
	public String updateAdminInfo(@RequestParam("email") String email, @RequestParam("phone") String phone,
			@RequestParam("staff_name") String staff_name, @RequestParam("birthday") Date birthday,
			@RequestParam("address") String address, @RequestParam("gender") String gender,
			@RequestParam("staff_id") long staff_id, @RequestParam("user_id") long user_id, ModelMap model,
			RedirectAttributes ra, HttpServletRequest request) throws ParseException {
		String username = user.getUsername();
		if (checkAmin(request) == false) {
			return "redirect:/login.htm"; // "account/login";
		}

		email = email.trim();
		phone = phone.trim();
		String email_login = UserController.getUser().getEmail();
		String phone_login = UserController.getUser().getPhone();
		System.out.println(email_login + phone_login);

		if (phone.equals(phone_login) == false && phone.length() != 0
				&& accountServiceImpl.checkPhoneCustomer(phone, user_id) == false) {
			if (accountServiceImpl.checkPhoneExist(phone) == true) {
				System.out.println("VAO DAY LAM 2");
				ra.addFlashAttribute("check_edit", 3);//trung sodt
				return "redirect:/admin/info.htm";
			}
		}
		long result = accountServiceImpl.updateUser(user_id, email, phone);
		long result1 = staffserviceimpl.updateStaff(staff_id, staff_name, gender, phone, birthday, address, user_id);
		System.out.println("update" + result1);
		if (result > 0 && result1 > 0) {
			user = accountServiceImpl.updateUserAfterUpdate(username);
			staffs = accountServiceImpl.updateStaffAfterUpdate(staff_id);
			
			ra.addFlashAttribute("check_edit", 2);//thanh cong
		} else {
			ra.addFlashAttribute("check_edit", 3);//that bai
		}

		// INFO ******
		ra.addFlashAttribute("user", user);
		ra.addFlashAttribute("staff", staffs);
		System.out.println("gender" + staffs.getGender());
		return "redirect:/admin/info.htm";
	}

	@RequestMapping(value = "login/submit", method = RequestMethod.POST)
	public String checklogin(HttpSession ss, HttpServletRequest request, @RequestParam("username") String username,
			@RequestParam("password") String password, HttpServletResponse response, ModelMap model,RedirectAttributes ra) {
		System.out.println("URL LOGIN = " + request.getRequestURI());
		if(username.equals("") || password.equals("")) {
			ra.addFlashAttribute("login_result",1);
			return "redirect:/login.htm";//Login không hợp lệ
		}else if(accountServiceImpl.checkUsernameExist(username) == false) {
			System.out.println(accountServiceImpl.checkUsernameExist(username));
			ra.addFlashAttribute("login_result",2);
			return "redirect:/login.htm";//username không hợp lệ
		}else if(accountServiceImpl.checkOldPassWordExactly(password, username)== false) {
			System.out.println(accountServiceImpl.checkOldPassWordExactly(password, username));
			ra.addFlashAttribute("login_result", 3);
			return "redirect:/login.htm";//sai pass
		}else if(accountServiceImpl.getStatusUserByUsername(username).equals("1")) {
			ra.addFlashAttribute("login_result",5);//check status
			return "redirect:/login.htm";//sai pass
		}
		if(accountServiceImpl.getLogin(username, password) != null) {
		user = accountServiceImpl.getLogin(username, password);
		
		if (user != null && user.getRole_id() == 1) {
			staffs = accountServiceImpl.getInfoStaffLogin(user.getUser_id());
			ss.setAttribute("username", username);
			ss.setAttribute("staff_name", staffs.getStaff_name());
			SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
			String jdate = date.format(staffs.getBirthday());

			ss.setAttribute("birthday", jdate);
			ss.setAttribute("address", staffs.getAddress());
			ss.setAttribute("staff_id", staffs.getStaff_id());
			ss.setAttribute("gender", staffs.getGender());
			if (user.getRole_id() == 1) {
				ss.setAttribute("role_id", 1);
			} else if (user.getRole_id() == 2) {
				ss.setAttribute("role_id", 2);
			} else {
				ss.setAttribute("role_id", 3);
			}
			HttpSession session = request.getSession();
			System.out.println("url_forward = " + session.getAttribute("url_forward"));
			System.out.println("role_id = " + session.getAttribute("role_id"));
			System.out.println("staff_id = " + staffs.getStaff_id());
			System.out.println("User = " + user.getUsername());
			System.out.println("staff_name = " + staffs.getStaff_name());
			System.out.println("birthday = " + jdate);
			System.out.println("address = " + staffs.getAddress());
			System.out.println("gender = " + staffs.getGender());
			ra.addFlashAttribute("login_result",4);//thành công
			if (session != null) {
				if (session.getAttribute("url_forward") != null && ss.getAttribute("role_id") != null
						&& (int) ss.getAttribute("role_id") == 1) {
					return "redirect:" + session.getAttribute("url_forward") + "";
				}
			}
			return "redirect:/admin/info.htm"; // "account/info";
		} else if (user != null && user.getRole_id() == 2) {
			staffs = accountServiceImpl.getInfoStaffLogin(user.getUser_id());
			ss.setAttribute("username", username);
			ss.setAttribute("staff_name", staffs.getStaff_name());
			SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
			//String jdate = date.format();

			ss.setAttribute("birthday", staffs.getBirthday());
			ss.setAttribute("address", staffs.getAddress());
			ss.setAttribute("staff_id", staffs.getStaff_id());
			ss.setAttribute("gender", staffs.getGender());
			if (user.getRole_id() == 1) {
				ss.setAttribute("role_id", 1);
			} else if (user.getRole_id() == 2) {
				ss.setAttribute("role_id", 2);
			} else {
				ss.setAttribute("role_id", 3);
			}
			HttpSession session = request.getSession();
			
			ra.addFlashAttribute("login_result",4);//thành công
			if (session != null) {
				if (session.getAttribute("url_forward") != null && ss.getAttribute("role_id") != null
						&& (int) ss.getAttribute("role_id") == 1) {
					return "redirect:" + session.getAttribute("url_forward") + "";
				}
			}
			return "redirect:/staff/info.htm"; // "account/info";
		}

		else if (user != null && user.getRole_id() == 3) {
			user = accountServiceImpl.getInfoCustomerLogin(username, password);
			customer = customerserviceimpl.getInfoCustomerLogin(user.getUser_id());
			ss.setAttribute("username", username);
			ss.setAttribute("customer_name", customer.getCustomer_name());
			
			if(customer.getBirthday() != null) {
				ss.setAttribute("birthday",customer.getBirthday());
			}else {
				ss.setAttribute("birthday","");
			}
			
			ss.setAttribute("address", customer.getAddress());
			ss.setAttribute("customer_id", customer.getCustomer_id());
			ss.setAttribute("gender", customer.getGender());
			if (user.getRole_id() == 1) {
				ss.setAttribute("role_id", 1);
			} else if (user.getRole_id() == 2) {
				ss.setAttribute("role_id", 2);
			} else {
				ss.setAttribute("role_id", 3);
			}
			HttpSession session = request.getSession();
			ra.addFlashAttribute("login_result",4);//thành công
			
			if (session != null) {
				if (session.getAttribute("url_forward") != null && ss.getAttribute("role_id") != null
						&& (int) ss.getAttribute("role_id") == 1) {
					return "redirect:" + session.getAttribute("url_forward") + "";
				}
			}

			return "redirect:/home.htm"; // "account/info";
		}
		}
		
		
		return "account/login";
	}

	@RequestMapping("account/order")
	public String orderAdmin(ModelMap model, RedirectAttributes ra, HttpServletRequest request) {
		ra.addFlashAttribute("username", UserController.getUser().getUsername());
		getMaxPage(0);
		status_var = 0;
		if(order.equals("order_id")) {
			model.addAttribute("orderpage", "id");
		}else if(order.equals("order_day")){
			model.addAttribute("orderpage", "date");
		}else if(order.equals("total_price")){
			model.addAttribute("orderpage", "price");
		}
		
		model.addAttribute("dirpage", dir);
		if(dir.equals("asc")) {
			model.addAttribute("orderLink", "desc");
		}else {
			model.addAttribute("orderLink", "asc");
		}
		
		model.addAttribute("bill",orderServiceImpl.getListBill());
		model.addAttribute("count", orderServiceImpl.getOrderCount(0));
		model.addAttribute("orders", orderServiceImpl.orderPageCustomer(currentpage, hienthi, order, dir, 0,UserController.getUser().getUser_id()));
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("status", 0);
		model.addAttribute("currentpage", 1);
		model.addAttribute("pagesize", pagesize);
		model.addAttribute("ds",orderdetailserviceimpl.dsOrder_detail());
		
		
		for(orders sOrders :  orderServiceImpl.orderPageCustomer(currentpage, hienthi, order, dir, 0,UserController.getUser().getUser_id())) {
			long kq = orderServiceImpl.setTotal_price(sOrders.getOrder_id());
		}

		return "account/order";
	}

	@RequestMapping(value = "account/review",method = RequestMethod.POST)
	public String userReview(@RequestParam("idProduct") String idProduct, @RequestParam("star") int star,@RequestParam("contentInput") String content ) {

		LocalDate currentDate = LocalDate.now();
		java.sql.Date sqlDate = Date.valueOf(currentDate);


			
		reviews A = new reviews();
		A.setComments(content);
		A.setDate(sqlDate);
		A.setStar(star);
		A.setUser_id(UserController.getUser().getUser_id());
		A.setWatch_id(idProduct);
		long addReview = reviewserviceimpl.addReview(A);
		System.out.println(addReview);
		System.out.println(sqlDate);
		System.out.println(content);
		System.out.println(star);
		System.out.println(UserController.getUser().getUser_id());
		System.out.println(idProduct);
		return "redirect:/account/order.htm";
	}

	@RequestMapping(value = "account/order", params = "page")
	public String orderPage(@RequestParam(required = true) int page, @RequestParam("order") String o,
			@RequestParam("dir") String d, @RequestParam("status") int status, HttpServletRequest request,
			ModelMap model) {
		System.out.println("status " + status_var);
		status_var = status;
		if(o.equals("id")) {
			order = "order_id";
		}else if(o.equals("name")) {
			order = "receiver_name";
		}else if(o.equals("date")) {
			order = "order_day";
		}else if(o.equals("price")) {
			order = "total_price";
		}
		
		if(d.equals("asc")) {
			dir = "asc";
		}else if(d.equals("desc")) {
			dir = "desc";
		}
		
		getMaxPage(status);
		if(page > maxpage) {
			page = 1;
		}
		request.setAttribute("orders", orderServiceImpl.orderPageCustomer(page, hienthi, order, dir, status,UserController.getUser().getUser_id()));
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("currentpage", page);
		request.setAttribute("pagesize", pagesize);
		request.setAttribute("status", status);
		request.setAttribute("count", orderServiceImpl.getOrderCount(status_var));
		model.addAttribute("ds", orderdetailserviceimpl.dsOrder_detail());
		for (orders sOrders : orderServiceImpl.orderPageCustomer(currentpage, hienthi, order, dir, 0,UserController.getUser().getUser_id())) {
			long kq = orderServiceImpl.setTotal_price(sOrders.getOrder_id());
		}
		currentpage = page;
		
		if(order.equals("order_id")) {
			request.setAttribute("orderpage", "id");
		}else if(order.equals("order_day")){
			request.setAttribute("orderpage", "date");
		}else if(order.equals("total_price")){
			request.setAttribute("orderpage", "price");
		}
		
		request.setAttribute("dirpage", dir);
		if(dir.equals("asc")) {
			request.setAttribute("orderLink", "desc");
		}else {
			request.setAttribute("orderLink", "asc");
		}

		return "account/order";
	}

	public int getMaxPage(int status) {
		int ordercount = (int) orderServiceImpl.getOrderCountCustomer(status,UserController.getUser().getUser_id());
		if (ordercount == 0) {
			hienthi = 1;
		} else if (ordercount < 6) {
			hienthi = ordercount;
			pagesize = 1;
		} else if (ordercount < 11) {
			hienthi = 5;
			pagesize = 2;
		} else {
			hienthi = 5;
			pagesize = 3;
		}
		if (ordercount % hienthi == 0) {
			maxpage = ordercount / hienthi;
		} else {
			maxpage = (int) (ordercount / hienthi) + 1;
		}
		return maxpage;
	}

	@RequestMapping("logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("username");
		session.removeAttribute("role_id");
		user = null;
		// session.setAttribute(null, session);
		session.setAttribute("cart", null);
		return "redirect:/login.htm"; // "account/login";
	}

	public static users getUser() {
		return user;
	}

	public static staffs getStaff() {
		return staffs;
	}

	public static customer getCustomer() {
		return customer;
	}

}
