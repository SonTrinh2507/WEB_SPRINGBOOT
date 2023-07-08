package ptithcm.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ptithcm.controller.UserController;
import ptithcm.serviceimpl.orderdetailserviceimpl;
import ptithcm.serviceimpl.orderserviceimpl;

@Controller
public class deliverystaffcontroller {
	@Autowired
	orderserviceimpl orderserviceimpl;
	@Autowired
	orderdetailserviceimpl orderdetailserviceimpl;
	
	@RequestMapping("staff/delivery")
	public String staffDelivery(ModelMap model) {
		
		model.addAttribute("delivery",orderserviceimpl.orderDelivery());	
		model.addAttribute("detail",orderdetailserviceimpl.dsOrder_detail());
		return "admin/delivery-staff";
	}
	
	@SuppressWarnings("unused")
	@RequestMapping( value = "staff/update/status",method = RequestMethod.POST)
	public String staffUpdateStatus(@RequestParam("order_id") long order_id,RedirectAttributes ra) {
		Long check_user_id = UserController.getUser().getUser_id();
		if(check_user_id != null) {
			long updateStatus = orderserviceimpl.updateStatusOrderDelivery(order_id, 3,UserController.getUser().getUser_id());
			System.out.println(updateStatus);
			ra.addFlashAttribute("messgae",1);//thanh cong
		}else {
			ra.addFlashAttribute("messgae",2);//that bai
		}
		
		return "redirect:/staff/delivery.htm";
		
	}
	
	@SuppressWarnings("unused")
	@RequestMapping( value = "staff/success/order",method = RequestMethod.POST)
	public String staffOrderSuccess(@RequestParam("order_id") long order_id,RedirectAttributes ra) {
		Long check_user_id = UserController.getUser().getUser_id();
		if(check_user_id != null) {
			long updateStatus = orderserviceimpl.updateStatusOrderDelivery(order_id, 4,UserController.getUser().getUser_id());
			if(updateStatus > 0) {
				long staffSuccess = orderserviceimpl.staffSuccessOrder(order_id,UserController.getUser().getUser_id());
			}
			
			System.out.println(updateStatus);
			ra.addFlashAttribute("messgae",1);//thanh cong
		}else {
			ra.addFlashAttribute("messgae",2);//that bai
		}
		
		return "redirect:/staff/delivery.htm";
		
	}
}
