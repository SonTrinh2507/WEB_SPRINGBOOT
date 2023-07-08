<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix = 'c' %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Login Page in HTML with CSS Code Example</title>
  <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

<style>
<%@include file = "/include/css/sign-in.css" %>
</style>



</head>
<body>
   <!-- partial:index.partial.html -->
<div class="box-form">
	<div class="left">
		<div class="overlay">
		<h1>Hello World.</h1>
		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
		Curabitur et est sed felis aliquet sollicitudin</p>
		<span>
			<p>login with social media</p>
			<a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
			<a href="#"><i class="fa fa-twitter" aria-hidden="true"></i> Login with Twitter</a>
		</span>
		</div>
	</div>
	
	 <form action="<c:url value ='/account/verify/submit.htm' />" method="post">
		<div class="right">
            <div class ="sign_up">
                <h5>Change Password</h5>
                  <p>Do you already have an account? <a href="../account/login.htm">Login account</a></p>  
                <!-- <p>Don't have an account? <a href="#">Creat Your Account</a> it takes less than a minute</p> -->
                <div class="inputs">
                    <input type="text" name = "username" placeholder="user name">
                    <br>
                      <input type="text" name = "email" placeholder="email">
                      
                </div>
            </div>
            <div class="remember-me--forget-password">
            <label>
                <input type="checkbox" name="item" checked/>
                <span class="text-checkbox">Remember me</span>
            </label>
            </div>
            <br>
				<button>Confirm</button>
        </div>
        </form>
</div>
    
    <script>
    function createToastHTML(message, type, color, icon){ //#47f764
		var toast_class = document.querySelector(".toast_class");
		var div = document.createElement("div");
		var html = "<div class = 'toast_to_left' style='position:relative; height: 90px;margin-bottom: 10px;'>"+
    	    "<div class='toast_container' style = 'border-left: 8px solid "+color+" !important;'>"+
            "<i class='"+icon+" toast_icon' style = 'color: "+color+" !important;'></i>"+
            "<div class='toast_content'>"+
              "<span style='font-weight: 700; color: "+color+";'>"+type+"</span>"+
              "<span class='toast_content_name' style='color: #656565'>"+message+"</span>"+
           " </div>"+
            "<div>"+
              "<i class='fa fa-times toast_close' style='font-size: 20px; cursor: pointer; color: #656565'aria-hidden='true'></i>"+
            "</div></div></div>";
            div.innerHTML = html;
        toast_class.appendChild(div);
  		var toast_noi_dung = div.querySelector(".toast_content_name");
  	    var toast_container = div.querySelector(".toast_container");
  	    
			setTimeout(() => {
			    toast_container.classList.remove("toast_to_left");
			    toast_container.classList.add("toast_to_right");
			}, 2000);
			
			setTimeout(() => {
			    div.remove();
			}, 3000);

		  	var toast_close = div.querySelector(".toast_close");
		  	console.log(toast_close);
		  	toast_close.addEventListener("click", () => {
		    	div.remove();
		  	});
	}
    
    var result = '${add_result}';
	if(result != ""){
    	if(result == '0'){
	  		createToastHTML("Tên đăng nhập hoặc email bị thiếu.", "ERROR", "#DC3545", "fas fa-exclamation-triangle");
    	}else if(result == '1'){
	  		createToastHTML("Không tìm thấy tài khoản chứa tên đăng nhập và email này!", "ERROR", "#DC3545", "fas fa-exclamation-triangle");
    	}else if(result == '2'){
	  		createToastHTML("Thành công! kiểm tra địa chỉ email để lấy mật khẩu đăng nhập nhé!" , "SUCCESS", "#47f764", "fas fa-check-circle");
    	}else if(result == '3'){
	  		createToastHTML("Lấy lại mật khẩu thất bại!", "ERROR", "#DC3545", "fas fa-exclamation-triangle");
    	}
	}
    
    </script>
</body>
</html>