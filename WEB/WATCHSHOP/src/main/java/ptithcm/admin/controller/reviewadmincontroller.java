package ptithcm.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ptithcm.controller.UserController;
import ptithcm.serviceimpl.brandserviceimpl;
import ptithcm.serviceimpl.categoryserviceimpl;
import ptithcm.serviceimpl.homeserviceimpl;
import ptithcm.serviceimpl.reviewserviceimpl;
import ptithcm.serviceimpl.statisticsserviceimpl;

@Controller
public class reviewadmincontroller {
	@Autowired
	homeserviceimpl homeServiceImpl;
	
	@Autowired
	reviewserviceimpl reviewServiceImpl;
	
	@Autowired
	statisticsserviceimpl statisticsServiceImpl;
	
	@Autowired
	brandserviceimpl brandserviceimpl;
	
	 @Autowired
	 categoryserviceimpl categoryserviceimpl;
	private int currentpage = 1;
	private int maxpage = 1;
	private int pagesize = 1;
	private int hienthi = 1;
	private String order = "watch_name"; // id_Watch / Watch_name
	private String dir = "asc";
	
	
	@RequestMapping("admin/review")
	public String reviewAdmin(ModelMap model, RedirectAttributes ra) {
		ra.addFlashAttribute("username", UserController.getUser().getUsername());
		getMaxPage();
		model.addAttribute("categories", categoryserviceimpl.dscategory());
		model.addAttribute("brands",brandserviceimpl.dsbrands());
		if(order.equals("watch_id")) {
			model.addAttribute("orderpage", "id");
		}else {
			model.addAttribute("orderpage", "name");
		}
		model.addAttribute("dirpage", dir);
		if(dir.equals("asc")) {
			model.addAttribute("orderLink", "desc");
		}else {
			model.addAttribute("orderLink", "asc");
		}
		model.addAttribute("count", homeServiceImpl.getWatchCount());
		//model.addAttribute("watchs", homeServiceImpl.watchPage(currentpage, hienthi, order, dir));
		model.addAttribute("watchs",reviewServiceImpl.listWatchReview());
		model.addAttribute("reviews", reviewServiceImpl);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("currentpage", 1);
		model.addAttribute("pagesize", pagesize);
		
		return "admin/review";
	}
	
	@RequestMapping(value = "admin/review", params = "keyword")
	public String brandSearch(@RequestParam(required = true) String keyword, HttpServletRequest request) {
		keyword = keyword.trim();
		getMaxPage();
		request.setAttribute("count", homeServiceImpl.findWatch(keyword).size());
		request.setAttribute("watchs", homeServiceImpl.findWatch(keyword));
		request.setAttribute("reviews", reviewServiceImpl);
		request.setAttribute("maxpage", 0);
		request.setAttribute("currentpage", 1);
		request.setAttribute("pagesize", 0);
		request.setAttribute("orderLink", "asc");
		request.setAttribute("total_profit", statisticsServiceImpl.getProfitThisYear());
		request.setAttribute("total_orders", statisticsServiceImpl.getOrdersCountThisYear());
		request.setAttribute("total_users", statisticsServiceImpl.getUsersCount());
	    return "admin/review";
	}
	
	@RequestMapping(value = "admin/review", params = "page")
	public String brandPage(@RequestParam(required = true) int page, @RequestParam("order") String o,
			@RequestParam("dir") String d, HttpServletRequest request) {
		if(o.equals("id")) {
			order = "watch_id";
		}else if(o.equals("name")) {
			order = "watch_name";
		}
		
		if(d.equals("asc")) {
			dir = "asc";
		}else if(d.equals("desc")) {
			dir = "desc";
		}
		
		getMaxPage();
		if(page > maxpage) {
			page = 1;
		}
		request.setAttribute("count", homeServiceImpl.getWatchCount());
		request.setAttribute("watchs", homeServiceImpl.watchPage(page, hienthi, order, dir));
		request.setAttribute("reviews", reviewServiceImpl);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("currentpage", page);
		request.setAttribute("pagesize", pagesize);
		request.setAttribute("total_profit", statisticsServiceImpl.getProfitThisYear());
		request.setAttribute("total_orders", statisticsServiceImpl.getOrdersCountThisYear());
		request.setAttribute("total_users", statisticsServiceImpl.getUsersCount());
		//
		currentpage = page;
		
		if(order.equals("watch_id")) {
			request.setAttribute("orderpage", "id");
		}else {
			request.setAttribute("orderpage", "name");
		}
		request.setAttribute("dirpage", dir);
		if(dir.equals("asc")) {
			request.setAttribute("orderLink", "desc");
		}else {
			request.setAttribute("orderLink", "asc");
		}
		
	    return "admin/review";
	}
	
	public int getMaxPage() {
		int Watchcount = (int) homeServiceImpl.getWatchCount();
		if(Watchcount == 0) {
			hienthi = 1;
		}else if(Watchcount < 6) {
			hienthi = Watchcount;
			pagesize = 1;
		}
		else if(Watchcount < 11) {
			hienthi = 5;
			pagesize = 2;
		}else {
			hienthi = 5;
			pagesize = 3;
		}
		if(Watchcount % hienthi == 0) {
			maxpage = Watchcount / hienthi;
		}else {
			maxpage = (int)(Watchcount / hienthi) + 1;
		}
		return maxpage;
	}
	@RequestMapping(value = "watch/review/delete", method = RequestMethod.POST)
	public String ReviewDelete(@RequestParam String idWatch,@RequestParam int idUser,ModelMap model) {
		
		reviewServiceImpl.deleteReview(idWatch, idUser);
		 return "redirect:/watch/"+idWatch+".htm";
	}
}
