package ptithcm.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ptithcm.entity.discount_detail;
import ptithcm.entity.item_detail;
import ptithcm.entity.items;
import ptithcm.entity.watchs;
import ptithcm.serviceimpl.brandserviceimpl;
import ptithcm.serviceimpl.categoryserviceimpl;
import ptithcm.serviceimpl.discountserviceimpl;
import ptithcm.serviceimpl.homeserviceimpl;
import ptithcm.serviceimpl.itemserviceimpl;
import ptithcm.serviceimpl.orderdetailserviceimpl;

@Controller
@Transactional
public class HomeController {
	@Autowired
	homeserviceimpl homeServiceImpl;

	@Autowired
	orderdetailserviceimpl orderDetailImpl;

	@Autowired
	itemserviceimpl itemserviceimpl;

	@Autowired
	categoryserviceimpl categoryserviceimpl;

	@Autowired
	brandserviceimpl brandserviceimpl;

	@Autowired
	discountserviceimpl discountserviceimpl;
	private int currentpage = 1;
	private int maxpage = 1;
	private int pagesize = 1;
	private int hienthi = 1;

	@RequestMapping("home")
	public String home(ModelMap model, HttpSession session) {
		getMaxPage();
		model.addAttribute("categories", categoryserviceimpl.dscategory());
		model.addAttribute("brands", brandserviceimpl.dsbrands());
		model.addAttribute("disscount_detail", discountserviceimpl.getListDiscount_detail());
		List<watchs> watchs = homeServiceImpl.dswatchs();
		model.addAttribute("watches", watchs);
		List<discount_detail> discount_detail = discountserviceimpl.getListDiscount_detail();
		// danh sách lấy giá của discount
		List<Long> price_discount = new ArrayList<>();

		for (watchs watch : watchs) {
			// lấy discountPrice trong danh sách đồng hồ
			Long discountPrice = discountserviceimpl.getPriceDiscountByWatch_id(watch.getWatch_id());

			if (discountPrice != null) {
				// nếu có thì add vô list
				price_discount.add(discountPrice);
			}
			Long discount_id = discountserviceimpl.getDiscount_idByWatch_id(watch.getWatch_id());
			if (discount_id != null) {
				Float discount_percent = discountserviceimpl.getPercentWatch(discount_id, watch.getWatch_id());
				System.out.println("percent" + discount_percent);
				int discount_percenr_round = (int) Math.round(discount_percent * 100);
				session.setAttribute("percent_discount", discount_percenr_round + "%");
			} else {
				session.setAttribute("percent_discount", null);

			}
		}
		// danh sách giá discount
		List<Long> price = new ArrayList<>();
		if (price_discount != null) {
			for (watchs watch : watchs) {
				Long discountPrice = discountserviceimpl.getPriceDiscountByWatch_id(watch.getWatch_id());
				if (discountPrice != null) {

					price.add(discountPrice);

				} else {
					price.add(watch.getPrice());
				}
			}
		}
		model.addAttribute("discount_prices", price_discount);
		model.addAttribute("price_buy", price);
		if (UserController.getUser() != null) {
			if (UserController.getUser().getRole_id() == 1 || UserController.getUser().getRole_id() == 2) {
				return "home";
			} else {
				Long cart_id = itemserviceimpl.getItem_idByUser_id(UserController.getUser().getUser_id());
				if (cart_id == null) {
					return "redirect:/account/login.htm";
				} else {
					model.addAttribute("cart_item", itemserviceimpl.getItem_detail(cart_id));
				}
			}
		}
		currentpage = 1;
		if (maxpage == 1) {
			model.addAttribute("maxpage", 0);
		} else {
			model.addAttribute("maxpage", maxpage);
		}
		model.addAttribute("watch_best",homeServiceImpl.watchBestPrice());
		model.addAttribute("currentpage", currentpage);
		model.addAttribute("pagesize", pagesize);
		// model.addAttribute("watchrecommend",
		// homeServiceImpl.dsWatchRecommend(100000));
		return "home";
	}

	@RequestMapping(value = "home", params = "page")
	public String brandPage(@RequestParam(required = true) int page, ModelMap model) {
		getMaxPage();
		if (page > maxpage) {
			page = 1;
		}
		model.addAttribute("watches", homeServiceImpl.dswatchs());

		model.addAttribute("watchs", homeServiceImpl.watchPageOfHome(page, hienthi));
		// model.addAttribute("topbuy", orderDetailImpl.getTopTheBestWatch());
		model.addAttribute("categories", categoryserviceimpl.dscategory());
		model.addAttribute("brands", brandserviceimpl.dsbrands());
		model.addAttribute("maxpage", maxpage);
		// model.addAttribute("watchrecommend",
		// homeServiceImpl.dsWatchRecommend(100000));
		model.addAttribute("currentpage", page);
		currentpage = page;
		model.addAttribute("pagesize", pagesize);
		return "home";

	}

	@RequestMapping(value = "account/cart/add/home", method = RequestMethod.POST)
	public String addCart(HttpSession session, @RequestParam("input_price") long price,
			@RequestParam("input_quantity") int quanty, @RequestParam("input_id") String watch_id,
			RedirectAttributes ra) {
		System.out.println("idcuadiohang: " + watch_id);
		long item_id = itemserviceimpl.getItem_idByUser_id(UserController.getUser().getUser_id());
		System.out.println("idcuacheck:" + itemserviceimpl.checkItem_detailExist(watch_id, item_id));

		int sum = 0;

		if (itemserviceimpl.checkItem_detailExist(watch_id, item_id) > 0) {
			int quantity_detail = itemserviceimpl.getQuantity_detail(item_id, watch_id);
			sum = quantity_detail + 1;
			long kq = itemserviceimpl.updateItem_detail(item_id, watch_id, sum, price);
			
			System.out.println("SL sau update: " + sum);
			System.out.println("kq: " + kq);
			ra.addFlashAttribute("message", 1);
			return "redirect:/home.htm";
		} else {
			item_detail A = new item_detail();
			A.setWatch_id(watch_id);
			A.setItem_id(item_id);
			A.setQuantity(quanty);
			A.setPrice(price);
			int result = itemserviceimpl.addItem_detail(A);
		
			ra.addFlashAttribute("message", 1);
			System.out.println("id: " + watch_id);
			System.out.println("itemid: " + item_id);
			System.out.println("quanti: " + quanty);
			System.out.println("price: " + price);
			System.out.println("result: " + result);
			return "redirect:/home.htm";
		}

	}

	@RequestMapping(value = "account/home/edit-quantity", method = RequestMethod.POST)
	public String editCart(@RequestParam("item_id_detail") long id, @RequestParam("quantity_edit") int quantity,
			HttpSession session, RedirectAttributes ra) {
		long item_id = itemserviceimpl.getItem_idByUser_id(UserController.getUser().getUser_id());
		System.out.println("sau khi sua so luong id:" + id);
		System.out.println("sau khi sua so luong quantity:" + quantity);
		ra.addFlashAttribute("message", 3);// update so luong
		long kq = itemserviceimpl.updateQuantity_detail(id, quantity);
		System.out.print("sau khi sua so luong:" + kq);
		return "redirect:/home.htm";
	}

	@RequestMapping(value = "account/home/delete", method = RequestMethod.POST)
	public String deleteCart(HttpSession session, @RequestParam("item_detail_id") int item_detial_id,
			RedirectAttributes ra) {
		long result = itemserviceimpl.deleteItem(item_detial_id);
		ra.addFlashAttribute("message", 2);
		System.out.println(result);
		return "redirect:/home.htm";
	}

	@RequestMapping(value = "search/watch/home", params = "keyword")
	public String getFoos(@RequestParam(required = true) String keyword, ModelMap model) {
		if(keyword.equals("")) {
			return "account/cart";
		}else {
		model.addAttribute("keyword", keyword);
		model.addAttribute("watch", homeServiceImpl.findWatch(keyword));
		if (UserController.getUser() != null) {
			List<items> items = itemserviceimpl.findItemByIDUser(UserController.getUser().getUser_id());
			Long item_id = itemserviceimpl.getItem_idByUser_id(UserController.getUser().getUser_id());
			model.addAttribute("cart", itemserviceimpl.findItemByIDUser(UserController.getUser().getUser_id()));
			if (item_id != null) {
				model.addAttribute("cart_item", itemserviceimpl.getItem_detail(item_id));
			}
		}
		model.addAttribute("brands", brandserviceimpl.dsbrands());
		model.addAttribute("category", categoryserviceimpl.dscategory());
		}
		// Giới hạn số lượng sản phẩm trả về trên trang đầu tiên
		return "account/cart";
	}

	@RequestMapping("404")
	public String page404() {
		return "404";
	}

	public int getMaxPage() {
		int watchcount = (int) homeServiceImpl.getWatchCount();
		if (watchcount == 0) {
			hienthi = 1;
			currentpage = 0;
		} else if (watchcount < 9) {
			hienthi = watchcount;
			pagesize = 1;
		} else if (watchcount < 17) {
			hienthi = 8;
			pagesize = 2;
		} else {
			hienthi = 8;
			pagesize = 3;
		}
		if (watchcount % hienthi == 0) {
			maxpage = watchcount / hienthi;
		} else {
			maxpage = (int) (watchcount / hienthi) + 1;
		}
		return maxpage;
	}
}
