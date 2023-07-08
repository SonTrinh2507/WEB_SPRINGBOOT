package ptithcm.admin.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.sql.Date;
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
import ptithcm.entity.discount;
import ptithcm.serviceimpl.brandserviceimpl;
import ptithcm.serviceimpl.categoryserviceimpl;
import ptithcm.serviceimpl.discountserviceimpl;
import ptithcm.serviceimpl.staffserviceimpl;
import ptithcm.serviceimpl.userserviceimpl;

@Controller
public class discountadmincontroller {
	@Autowired
	discountserviceimpl discountserviceimpl;

	@Autowired
	brandserviceimpl brandServiceImpl;

	@Autowired
	categoryserviceimpl categoryServiceImpl;

	@Autowired
	staffserviceimpl staffserviceimpl;

	@Autowired
	userserviceimpl userserviceimpl;

	@RequestMapping("admin/discount")
	public String discountshow(HttpServletRequest request, RedirectAttributes ra, ModelMap model) {
		Timestamp startDate = null;
		Timestamp endDate = null;
		List<Object[]> results = discountserviceimpl.getStartAndEndDate();
		if (!results.isEmpty()) {
			Object[] row = results.get(0); // Assuming only one row is returned
			startDate = (Timestamp) row[0];
			endDate = (Timestamp) row[1];
		}
		if(startDate != null && endDate != null) {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String formattedStartDate = dateFormat.format(startDate);
			String formattedEndDate = dateFormat.format(endDate);
			
			model.addAttribute("date_start", formattedStartDate);
			model.addAttribute("date_end", formattedEndDate);
		}
		

		model.addAttribute("discount", discountserviceimpl.dsDiscounts());
		model.addAttribute("categories", categoryServiceImpl.dscategory());
		return "admin/discount";
	}

	@RequestMapping(value = "admin/discount/add", method = RequestMethod.POST)
	public String brandAdd(@RequestParam("discount_name") String discountname,
			@RequestParam("date_start") Date date_start, @RequestParam("date_end") Date date_enDate,
			@RequestParam("percent") float percent, RedirectAttributes ra, HttpSession ss) {

		if (discountname.equals("") || date_start == null || date_enDate == null || percent < 0) {
			ra.addFlashAttribute("message", 1);// thong tin khong de trong
		} else {
			System.out.println("hienthi" + UserController.getUser().getUser_id());
			discount A = new discount();
			A.setDiscount_name(discountname);
			float discount_percent = percent / 100;
			A.setDiscount_percent(discount_percent);
			A.setStaff_id(UserController.getUser().getUser_id());
			long result = discountserviceimpl.addDiscount(A);
			System.out.println("ketqua discount: " + result);
			if (result > 0) {
				long result1 = discountserviceimpl.addDiscount_detail(A.getDiscount_id(), date_start, date_enDate);
				System.out.println("ketqua discount: " + result1);
				ra.addFlashAttribute("message", 2);// them thanh cong
			}
		}

		return "redirect:/admin/discount.htm";
	}
	
	@RequestMapping(value = "admin/discount/delete", method = RequestMethod.POST)
	public String deleteDiscout(@RequestParam("discount_id") long discount_id,RedirectAttributes ra) {
		
		long result = discountserviceimpl.deleteDiscount_detail(discount_id);
		if(result > 0) {
			long result1 = discountserviceimpl.deleteDiscount(discount_id);
			ra.addFlashAttribute("message",3);//xoa thanh cong
		}
		return "redirect:/admin/discount.htm";
	}

}
