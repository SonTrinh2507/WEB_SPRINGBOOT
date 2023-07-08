package ptithcm.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.UriComponentsBuilder;
import ptithcm.controller.UserController;
@Component
public class AuthorizationInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	    String url = request.getRequestURI();
	    

	    if (UserController.getUser() != null) {
	    	System.out.println("URL = " + url);
	    	
		    Integer role_id = (int) request.getSession().getAttribute("role_id");
		    System.out.println("ROLE_ID " + role_id);
		    if (role_id == 1 || role_id == 2)  { // Admin role
		        if (url.startsWith(request.getContextPath() + "/home.htm")  || url.startsWith(request.getContextPath() + "/admin/") ||url.startsWith(request.getContextPath() + "/watch/") || url.startsWith(request.getContextPath() + "/product/") || url.startsWith(request.getContextPath() + "/staff/")) {
		        	  
		            // Nếu đường dẫn bắt đầu bằng "/admin/" thì cho phép truy cập
		            return true;
		        } else {
		            // Nếu không thì redirect về trang "/admin/"
		            response.sendRedirect(request.getContextPath() + "/404.htm");
		            return false;
		        }
		     
		    } else if (role_id == 3) { // Customer role
		        if (url.startsWith(request.getContextPath() + "/product/") ||url.startsWith(request.getContextPath() + "/account/") ||url.startsWith(request.getContextPath() + "/watch/") ) {
		            // Nếu đường dẫn bắt đầu bằng "/customer/" thì cho phép truy cập
		            return true;
		        } else {
		            // Nếu không thì redirect về trang "/customer/"
		            response.sendRedirect(request.getContextPath() + "/404.htm");
		            return false;
		        }
		    } else { // Không phải role hợp lệ
		    	 response.sendRedirect(request.getContextPath() + "/account/login.htm");
		    	 response.sendRedirect(request.getContextPath() + "/account/forgetpass.htm");
		        return false;
		    }

	    }else {

	    	if(url.startsWith(request.getContextPath() + "/watch/") || url.startsWith(request.getContextPath() + "/find/") || url.startsWith(request.getContextPath() + "/account/login/") || url.startsWith(request.getContextPath() + "/search/")) {
	    		return true;
	    	}else {
	        String loginUrl =request.getContextPath() +  "/login.htm";
	        String redirectUrl = UriComponentsBuilder.fromPath(loginUrl)
	                .build().toUriString();
	        response.sendRedirect(redirectUrl);
	        return false; // Dừng xử lý các interceptor và controller khác
	    }
	    }
	 
	    
	   
	    

	    
	}
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2,
			org.springframework.web.servlet.ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}
}