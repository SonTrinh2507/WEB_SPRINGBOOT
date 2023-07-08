
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix = 'c' %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Login Page in HTML with CSS Code Example</title>
  <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="../assets/css/swiper-bundle.min.css">

<!--=============== CSS ===============-->
<link rel="stylesheet" href="../assets/css/infoAmin.css">
<link rel="stylesheet" href="../assets/css/login-new.css">
<link rel="stylesheet" href="../assets/css/styles.css">
<link rel="stylesheet" href="<c:url value = '/assets/css/toast.css' />" />
<link rel="icon" href="/favico.png" sizes="32x32" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" >
<link rel="stylesheet" href="../assets/css/login-signup-forget.css">
<style>
  p,h1{
    visibility: hidden;
  }
  h5{
    margin-bottom: 0;
  }

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
	<form action="<c:url value ='/account/signup/submit.htm' />" method="post" class="form_signup">
		<div class="right">
            <div class ="sign_up">
                <h5>Sign Up</h5>
                
                <p>Don't have an account? <a href="#">Creat Your Account</a> it takes less than a minute</p>
                <div class="inputs">
                    <input type="text" name = "username" placeholder="User name">
                    <br>
                    <input type="password" name = "password" placeholder="Password">
                    <br>
                    <input type="password" name = "repassword" placeholder="Confirm password">
                    <br>
                    <input type="text"  name = "email" placeholder="Email">
                    <br>
                    <input type="text"  name = "phone" placeholder="Number phone">
                    <br>

                </div>
             
            </div>
            <div class="remember-me--forget-password">
            <label>
                <input type="checkbox" name="item" checked/>
                <span class="text-checkbox">Remember me</span>
            </label>
            </div>
            <br>
				<button>Sign Up</button>
        </div> 
          </form>
</div>
	<script src="<c:url value = '/assets/js/toast.js' />"></script>
 <script>
 
 document.addEventListener("DOMContentLoaded", function() {
        //Kiểm tra mật khẩu
        <%if (request.getAttribute("message") != null && request.getAttribute("message").equals(5)) {%>
    	createToast('success', 'Đăng ký thành công!');
    	<%} else if (request.getAttribute("message") != null && request.getAttribute("message").equals(1)) {%>
    	createToast('error','Lỗi trống hoặc sai ký tự!');
    	<%} else if (request.getAttribute("message") != null && request.getAttribute("message").equals(2)) {%>
    	createToast('error','Username đã tồn tại!');
    	<%}else if (request.getAttribute("message") != null && request.getAttribute("message").equals(2)) {%>
    	createToast('error','Số điện thoại đã tồn tại!');
   		 <%}  else if (request.getAttribute("message") != null && request.getAttribute("message").equals(3)) {%>
			createToast('error','Email đã tồn tại!');
		<%}%>
  
    });

    
    </script>
</body>