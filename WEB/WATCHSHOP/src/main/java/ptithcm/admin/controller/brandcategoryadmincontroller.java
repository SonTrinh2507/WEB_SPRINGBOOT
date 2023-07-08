package ptithcm.admin.controller;

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
import ptithcm.entity.brands;
import ptithcm.entity.category;
import ptithcm.serviceimpl.brandserviceimpl;
import ptithcm.serviceimpl.categoryserviceimpl;

@Controller
public class brandcategoryadmincontroller {
	@Autowired
	brandserviceimpl brandserviceimpl;

	@Autowired
	categoryserviceimpl categoryserviceimpl;


	@RequestMapping("admin/brand-category")
	public String brandcategoryPage(HttpServletRequest request, RedirectAttributes ra, ModelMap model,HttpSession ss) {
		//category-page	
		model.addAttribute("category", categoryserviceimpl.dscategory());
		model.addAttribute("brands", brandserviceimpl.dsbrands());
		if(UserController.getUser() != null) {
			if(UserController.getUser().getRole_id() == 1) {
				ss.setAttribute("sudung", true);
			}else {
				ss.setAttribute("sudung", false);
			}
		}
		return "admin/brand-category";
	}
	
	@RequestMapping(value = "admin/brand/add", method = RequestMethod.POST)
	public String brandAdd(@RequestParam("brand-category") String brandName, RedirectAttributes ra) {
		brands A = new brands();
		A.setBrand_name(brandName);
		if(brandName.equals("")) {
			ra.addFlashAttribute("message",1);//thong tin de trong
		}else if(brandserviceimpl.checkNameBrand(-1, brandName) == true) {
			ra.addFlashAttribute("message",2);//brand_name ton tai
		}else {
			long result = brandserviceimpl.addBrand(A);
			System.out.println("ketqua them: " + result);
			if(result > 0) {
				ra.addFlashAttribute("message",3);//thanh cong
			}else {
				ra.addFlashAttribute("message",4);//that bai
			}
		}
		
		
	    return "redirect:/admin/brand-category.htm";
	
	}
	
	@RequestMapping(value = "admin/brand/edit", method =  RequestMethod.POST)
	public String brandEdit(@RequestParam("brand-category-id") long brand_id,@RequestParam("brand-category") String brandName, RedirectAttributes ra) {
		
		if(brandName.equals("")) {
			ra.addFlashAttribute("message",1);//thong tin trong
		}else if(brandserviceimpl.checkNameBrand(brand_id, brandName) == true) {
			ra.addFlashAttribute("message",2);//ten ton tai
		}else {
			long result = brandserviceimpl.editBrand(brand_id, brandName);
			if(result > 0) {
				ra.addFlashAttribute("message",3);
			}else {
				ra.addFlashAttribute("message",4);
			}
		}
		
		return "redirect:/admin/brand-category.htm";
	}
	
	@RequestMapping(value = "admin/brand/delete", method = RequestMethod.POST)
	public String brandDelete(@RequestParam("brand-category-id") long idbrand,  RedirectAttributes ra) {
		
		long result = brandserviceimpl.deleteBrand(idbrand);
		if(result > 0) {
			ra.addFlashAttribute("message",3);
		}else {
			ra.addFlashAttribute("message",4);
		}
		return "redirect:/admin/brand-category.htm";
	}
	
	@RequestMapping(value = "admin/category/add", method = RequestMethod.POST)
	public String categoryAdd(@RequestParam("brand-category") String nameCategory, RedirectAttributes ra) {
		category A = new category();
		A.setCategory_name(nameCategory);
		if(nameCategory.equals("")) {
			ra.addFlashAttribute("message",1);//thong tin de trong
		}else if(categoryserviceimpl.checkNamecategory(-1, nameCategory) == true) {
			ra.addFlashAttribute("message",2);//brand_name ton tai
		}else {
			long result = categoryserviceimpl.addcategory(A);
			System.out.println("ketqua them: " + result);
			if(result > 0) {
				ra.addFlashAttribute("message",3);//thanh cong
			}else {
				ra.addFlashAttribute("message",4);//that bai
			}
		}
		return "redirect:/admin/brand-category.htm";
	}
	@RequestMapping(value = "admin/category/edit", method =  RequestMethod.POST)
	public String categoryEdit(@RequestParam("brand-category-id") long category_id,@RequestParam("brand-category") String categoryName, RedirectAttributes ra) {
		
		if(categoryName.equals("")) {
			ra.addFlashAttribute("message",1);//thong tin trong
		}else if(categoryserviceimpl.checkNamecategory(category_id, categoryName) == true) {
			ra.addFlashAttribute("message",2);//ten ton tai
		}else {
			long result = categoryserviceimpl.editcategory(category_id, categoryName);
			if(result > 0) {
				ra.addFlashAttribute("message",3);
			}else {
				ra.addFlashAttribute("message",4);
			}
		}
		
		return "redirect:/admin/brand-category.htm";
	}
	
	@RequestMapping(value = "admin/category/delete", method = RequestMethod.POST)
	public String categoryDelete(@RequestParam("brand-category-id") long idCategory,  RedirectAttributes ra) {
		
		long result = categoryserviceimpl.deletecategory(idCategory);
		if(result > 0) {
			ra.addFlashAttribute("message",3);
		}else {
			ra.addFlashAttribute("message",4);
		}
		return "redirect:/admin/brand-category.htm";
	}
	
}
