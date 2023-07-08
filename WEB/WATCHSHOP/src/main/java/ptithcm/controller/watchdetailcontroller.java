package ptithcm.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ptithcm.bean.productList;
import ptithcm.entity.item_detail;
import ptithcm.entity.items;
import ptithcm.entity.watchs;
import ptithcm.serviceimpl.brandserviceimpl;
import ptithcm.serviceimpl.categoryserviceimpl;
import ptithcm.serviceimpl.discountserviceimpl;
import ptithcm.serviceimpl.homeserviceimpl;
import ptithcm.serviceimpl.itemserviceimpl;
import ptithcm.serviceimpl.orderdetailserviceimpl;
import ptithcm.serviceimpl.reviewserviceimpl;
import ptithcm.serviceimpl.userserviceimpl;
import ptithcm.serviceimpl.watchserviceimpl;

@Transactional
@Controller
public class watchdetailcontroller {
	@Autowired
	homeserviceimpl homeServiceImpl;

	@Autowired
	userserviceimpl accountServiceImpl;

	@Autowired
	reviewserviceimpl reviewServiceImpl;

	@Autowired
	orderdetailserviceimpl orderDetailImpl;

	@Autowired
	watchserviceimpl watchserviceimpl;

	@Autowired
	discountserviceimpl discountserviceimpl;

	@Autowired
	itemserviceimpl itemserviceimpl;

	@Autowired
	brandserviceimpl brandserviceimpl;

	@Autowired
	categoryserviceimpl categoryserviceimpl;

	@RequestMapping("/watch/{watch_id}")
	public String viewBook(@PathVariable("watch_id") String watch_id, ModelMap model, HttpSession session) {

		if (homeServiceImpl.getWatchbyID(watch_id) == null) {
			return "redirect:/404.htm";
		} else {
			Long price_discount = discountserviceimpl.getPriceDiscountByWatch_id(watch_id);
			if (price_discount != null) {
				session.setAttribute("price", price_discount);
				session.setAttribute("price_discount", price_discount);
				System.out.println("price_discount" + price_discount);
			} else {
				session.setAttribute("price", homeServiceImpl.getWatchbyID(watch_id).getPrice());
				session.setAttribute("price_discount", null);
			}
			Long discount_id = discountserviceimpl.getDiscount_idByWatch_id(watch_id);
			System.out.println("percent" + discount_id);
			if (discount_id != null) {
				Float discount_percent = discountserviceimpl.getPercentWatch(discount_id, watch_id);
				System.out.println("percent" + discount_percent);
				int discount_percenr_round = (int) Math.round(discount_percent * 100);
				session.setAttribute("percent_discount", discount_percenr_round + "%");
			} else {
				session.setAttribute("percent_discount", null);

			}
			int soluonghang = homeServiceImpl.getWatchQuantybyID(watch_id);
			if (soluonghang > 0) {
				session.setAttribute("tinhtrang", "Còn hàng");

			} else {
				session.setAttribute("tinhtrang", "Hết hàng");
			}
			if (UserController.getUser() != null) {

				Long item_id = itemserviceimpl.getItem_idByUser_id(UserController.getUser().getUser_id());
				if (item_id != null) {
					List<item_detail> itemdetail = itemserviceimpl.getItem_detail(item_id);
					if (itemdetail != null) {
						model.addAttribute("cart_item", itemdetail);
					}
				}
			}
			int id_brand = (int) homeServiceImpl.getWatchbyID(watch_id).getBrands().getBrand_id(); // NULL NẾU KHÔNG TÌM
			List<watchs> watchOfBrandList = homeServiceImpl.dsWatchbyBrandID(id_brand, 1, 4);
			List<Long> discount = new ArrayList<>();
			for (watchs watch : watchOfBrandList) {
				Long discountPrice = discountserviceimpl.getPriceDiscountByWatch_id(watch.getWatch_id());
				if (discountPrice != null) {

					discount.add(discountPrice);
				}
			}
			List<Long> price = new ArrayList<>();
			if (discount != null) {
				for (watchs watch : watchOfBrandList) {
					Long discountPrice = discountserviceimpl.getPriceDiscountByWatch_id(watch.getWatch_id());
					if (discountPrice != null) {

						price.add(discountPrice);

					} else {
						price.add(watch.getPrice());
					}
				}
			}
			model.addAttribute("discount_prices", discount);
			model.addAttribute("price_buy", price);
			model.addAttribute("reviews", reviewServiceImpl.reviewOfWatch(watch_id));
			session.setAttribute("review_count", reviewServiceImpl.getReviewCount(watch_id));
			System.out.println(watch_id);
			model.addAttribute("watch_id", watch_id);
			model.addAttribute("watch", homeServiceImpl.getWatchbyID(watch_id));

			model.addAttribute("watchofbrand", homeServiceImpl.dsWatchbyBrandID(id_brand, 1, 4));
			return "watch";
		}
	}

	@RequestMapping(value = "/account/buynow", method = RequestMethod.POST)
	public String BuyNow(@RequestParam("quantity_detail") int quantity_detail,
			@RequestParam("watch_id") String watch_id, @RequestParam("price_detail") long price_detail,
			HttpServletRequest request, HttpSession session, ModelMap model) {
		if (UserController.getUser() == null) {
			return "redirect:/login.htm";
		}
		List<productList> list = watchserviceimpl.getWatchBuyNow(watch_id, quantity_detail, price_detail);
		session.setAttribute("testcart", list);

		return "redirect:/account/checkout.htm";
	}

	@RequestMapping(value = "/account/add/cartnow", method = RequestMethod.POST)
	public String addToCart(@RequestParam("quantity_detail") int quantity_detail,
			@RequestParam("watch_id") String watch_id, @RequestParam("price_detail") long price_detail,
			HttpServletRequest request, HttpSession session, ModelMap model, RedirectAttributes ra) {
		if (UserController.getUser() == null) {
			return "redirect:/login.htm";
		}
		long item_id = itemserviceimpl.getItem_idByUser_id(UserController.getUser().getUser_id());
		int sum = 0;

		if (itemserviceimpl.checkItem_detailExist(watch_id, item_id) > 0) {
			int quantity = itemserviceimpl.getQuantity_detail(item_id, watch_id);
			sum = quantity + quantity_detail;
			long kq = itemserviceimpl.updateItem_detail(item_id, watch_id, sum, price_detail);
			
			System.out.println("SL sau update: " + sum);
			System.out.println("kq: " + kq);
			ra.addFlashAttribute("message", 1);
			return "redirect:/watch/" + watch_id + ".htm";
		} else {
			item_detail A = new item_detail();
			A.setWatch_id(watch_id);
			A.setItem_id(item_id);
			A.setQuantity(quantity_detail);
			A.setPrice(price_detail);
			int result = itemserviceimpl.addItem_detail(A);
			
			ra.addFlashAttribute("message", 1);
			return "redirect:/watch/" + watch_id + ".htm";
		}

	}

	@RequestMapping(value = "/account/watch/quantity", method = RequestMethod.POST)
	public String editCart(@RequestParam("watch_id") String watch_id, @RequestParam("item_id_detail") long id,
			@RequestParam("quantity_edit") int quantity, HttpSession session, RedirectAttributes ra) {
		long item_id = itemserviceimpl.getItem_idByUser_id(UserController.getUser().getUser_id());

		if (item_id != 0) {
			long kq = itemserviceimpl.updateQuantity_detail(id, quantity);
			ra.addFlashAttribute("message", 2);
		} else {
			ra.addFlashAttribute("message", 3);
		}

		return "redirect:/watch/" + watch_id + ".htm";
	}

	@RequestMapping(value = "account/watch/delete", method = RequestMethod.POST)
	public String deleteCart(HttpSession session, @RequestParam("watch_id") String watch_id,
			@RequestParam("item_id_delete") int item_detial_id, RedirectAttributes ra) {
		long result = itemserviceimpl.deleteItem(item_detial_id);
		ra.addFlashAttribute("message", 4);
		System.out.println(result);
		return "redirect:/watch/" + watch_id + ".htm";
	}

	@RequestMapping(value = "search/watch", params = "keyword")
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

}
