package ptithcm.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ptithcm.controller.UserController;
import ptithcm.serviceimpl.brandserviceimpl;
import ptithcm.serviceimpl.categoryserviceimpl;
import ptithcm.serviceimpl.warrantyserviceimpl;

@Controller
public class warrantyadmincontroller {
	@Autowired
	warrantyserviceimpl warrantyserviceimpl;

	@Autowired
	categoryserviceimpl categoryserviceimpl;

	@Autowired
	brandserviceimpl brandserviceimpl;
	private int currentpage = 1;
	private int maxpage = 1;
	private int pagesize = 1;
	private int hienthi = 1;
	private String order = "warranty_id"; // brand_name / brand_id
	private String dir = "asc";

	@RequestMapping("admin/warranty")
	public String brandAdmin(HttpServletRequest request, RedirectAttributes ra, ModelMap model) {
		getMaxPage();

		ra.addFlashAttribute("username", UserController.getUser().getUsername());
		if (order.equals("warranty_id")) {
			request.setAttribute("orderpage", "id");
		}
		request.setAttribute("dirpage", dir);
		if (dir.equals("asc")) {
			request.setAttribute("orderLink", "desc");
		} else {
			request.setAttribute("orderLink", "asc");
		}
		model.addAttribute("categories", categoryserviceimpl.dscategory());
		model.addAttribute("warranty", warrantyserviceimpl.getWarrantyList());
		model.addAttribute("warranty_detail", warrantyserviceimpl.getListWarranty_detail());
		request.setAttribute("count", warrantyserviceimpl.getWarrantyCount());
		request.setAttribute("warranty", warrantyserviceimpl.warrantyPage(1, hienthi, order, dir));
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("currentpage", 1);
		request.setAttribute("pagesize", pagesize);
		return "admin/warranty";
	}

	@RequestMapping(value = "admin/warranty", params = "page")
	public String brandPage(@RequestParam(required = true) int page, @RequestParam("order") String o,
			@RequestParam("dir") String d, HttpServletRequest request) {
		if (o.equals("id")) {
			order = "warranty_id";
		}
		if (d.equals("asc")) {
			dir = "asc";
		} else if (d.equals("desc")) {
			dir = "desc";
		}

		getMaxPage();
		if (page > maxpage) {
			page = 1;
		}
		request.setAttribute("count", warrantyserviceimpl.getWarrantyCount());
		request.setAttribute("warranty", warrantyserviceimpl.warrantyPage(page, hienthi, order, dir));
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("currentpage", page);
		currentpage = page;
		request.setAttribute("pagesize", pagesize);

		if (order.equals("warranty_id")) {
			request.setAttribute("orderpage", "id");
		}
		request.setAttribute("dirpage", dir);
		if (dir.equals("asc")) {
			request.setAttribute("orderLink", "desc");
		} else {
			request.setAttribute("orderLink", "asc");
		}

		return "admin/warranty";
	}

	public int getMaxPage() {
		int brandcount = (int) warrantyserviceimpl.getWarrantyCount();
		if (brandcount == 0) {
			hienthi = 1;
		} else if (brandcount < 6) {
			hienthi = brandcount;
			pagesize = 1;
		} else if (brandcount < 11) {
			hienthi = 5;
			pagesize = 2;
		} else {
			hienthi = 5;
			pagesize = 3;
		}
		if (brandcount % hienthi == 0) {
			maxpage = brandcount / hienthi;
		} else {
			maxpage = (int) (brandcount / hienthi) + 1;
		}
		return maxpage;
	}
}
