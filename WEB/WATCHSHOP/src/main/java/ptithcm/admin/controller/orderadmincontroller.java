package ptithcm.admin.controller;

import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ptithcm.controller.UserController;
import ptithcm.entity.orders;
import ptithcm.serviceimpl.brandserviceimpl;
import ptithcm.serviceimpl.categoryserviceimpl;
import ptithcm.serviceimpl.orderdetailserviceimpl;
import ptithcm.serviceimpl.orderserviceimpl;
import ptithcm.serviceimpl.statisticsserviceimpl;

@Controller
public class orderadmincontroller {
	@Autowired
	orderserviceimpl orderServiceImpl;
	
	@Autowired
	statisticsserviceimpl statisticsServiceImpl;
	
	@Autowired
	brandserviceimpl brandserviceimpl;
	
	@Autowired
	categoryserviceimpl categoryserviceimpl;
	
	@Autowired
	orderdetailserviceimpl orderdetailserviceimpl;
	private int currentpage = 1;
	private int maxpage = 1;
	private int pagesize = 1;
	private int hienthi = 1;
	private String order = "order_id";
	private String dir = "asc";
	private int status_var;
	
	@RequestMapping("admin/order")
	public String orderAdmin(ModelMap model, RedirectAttributes ra,HttpServletRequest request) {
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
		
		model.addAttribute("count", orderServiceImpl.getOrderCount(0));
		model.addAttribute("orders", orderServiceImpl.orderPage(currentpage, hienthi, order, dir, 0));
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("status", 0);
		model.addAttribute("currentpage", 1);
		model.addAttribute("pagesize", pagesize);
		model.addAttribute("ds",orderdetailserviceimpl.dsOrder_detail());
		
		
		for(orders sOrders :  orderServiceImpl.orderPage(currentpage, hienthi, order, dir, 0)) {
			long kq = orderServiceImpl.setTotal_price(sOrders.getOrder_id());
		}
		
		
			return "admin/order";
	}
	

	@RequestMapping(value = "admin/order", params = "page")
	public String brandPage(@RequestParam(required = true) int page, @RequestParam("order") String o,
			@RequestParam("dir") String d, @RequestParam("status") int status,  HttpServletRequest request, ModelMap model) {
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
		request.setAttribute("orders", orderServiceImpl.orderPage(page, hienthi, order, dir, status));
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("currentpage", page);
		request.setAttribute("pagesize", pagesize);
		request.setAttribute("status", status);
		request.setAttribute("count", orderServiceImpl.getOrderCount(status_var));
		model.addAttribute("ds", orderdetailserviceimpl.dsOrder_detail());
		for (orders sOrders : orderServiceImpl.orderPage(currentpage, hienthi, order, dir, 0)) {
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
	    return "admin/order";
	}
	
	@RequestMapping(value = "admin/order/search", params = "startDate")
	public String orderSearch(@RequestParam(required = true) @DateTimeFormat(pattern="yyyy-MM-dd") Date startDate, @RequestParam("endDate") @DateTimeFormat(pattern="yyyy-MM-dd") Date endDate,  HttpServletRequest request) {
		request.setAttribute("orders", orderServiceImpl.searchOrder(startDate, endDate));
		request.setAttribute("count", orderServiceImpl.searchOrder(startDate, endDate).size());
		request.setAttribute("maxpage", 0);
		request.setAttribute("currentpage", 1);
		request.setAttribute("pagesize", 0);
		request.setAttribute("orderLink", "asc");
		request.setAttribute("status", 0);
	    return "admin/order";
	}
	
	@RequestMapping("admin/order/save")
	public String orderSave(@RequestParam("page") int page, @RequestParam("idOrder") int idOrder, 
			@RequestParam("statusNew") int statusNew, RedirectAttributes ra,
			@RequestParam("statusOld") int statusOld, HttpServletResponse response, ModelMap model) {
		if(orderServiceImpl.checkOldStatusExactly(statusOld, idOrder) == false) { // Khong dung thong tin
			ra.addFlashAttribute("kq", 0);
		}else {
			if(orderServiceImpl.saveOrder(statusNew, idOrder) > 0) {
				ra.addFlashAttribute("kq", 1);
			}else {
				ra.addFlashAttribute("kq", 2);
			}
		}
		getMaxPage(status_var);
		ra.addFlashAttribute("count", orderServiceImpl.getOrderCount(status_var));
		ra.addFlashAttribute("orders", orderServiceImpl.orderPage(page, hienthi, order, dir, status_var));
		ra.addFlashAttribute("maxpage", maxpage);
		ra.addFlashAttribute("status", status_var);
		ra.addFlashAttribute("currentpage", page);
		ra.addFlashAttribute("pagesize", pagesize);
		String od = "";
		if(order.equals("order_id")) {
			od = "id";
		}else if(order.equals("order_day")){
			od = "date";
		}else if(order.equals("total_price")){
			od = "price";
		}		
		return "redirect:/admin/order.htm?page="+page+"&order="+od+"&dir="+dir+"&status="+status_var;
	}
	
	public int getMaxPage(int status) {
		int ordercount = (int) orderServiceImpl.getOrderCount(status);
		if(ordercount == 0) {
			hienthi = 1;
		}else if(ordercount < 6) {
			hienthi = ordercount;
			pagesize = 1;
		}
		else if(ordercount < 11) {
			hienthi = 5;
			pagesize = 2;
		}else {
			hienthi = 5;
			pagesize = 3;
		}
		if(ordercount % hienthi == 0) {
			maxpage = ordercount / hienthi;
		}else {
			maxpage = (int)(ordercount / hienthi) + 1;
		}
		return maxpage;
	}
	
	@RequestMapping(value = "admin/accept/status", method = RequestMethod.POST)
	public String xacNhanStatus(@RequestParam("order_status") int status,@RequestParam("order_id") long order_id,RedirectAttributes ra) {
		
		long update = orderServiceImpl.updateStaffOrder(order_id, status,UserController.getUser().getUser_id());
		if(update != 0 ) {
			ra.addFlashAttribute("message",1);//thanh cong
		}else {
			ra.addFlashAttribute("message",2);//that bai
		}
		return "redirect:/admin/order.htm";
	}

	
}
