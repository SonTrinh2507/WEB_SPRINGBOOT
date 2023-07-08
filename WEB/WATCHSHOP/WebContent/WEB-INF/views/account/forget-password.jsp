<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
 
  <title>Forget password</title>
  
  <link rel="stylesheet" href="<c:url value = '/assets/css/toast.css' />" />
  
<link rel="stylesheet"
	href="<c:url value ='/assets/css/login-new.css' />" />
<link href="https://cdn.lineicons.com/4.0/lineicons.css"
	rel="stylesheet" />
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css'
	rel='stylesheet'>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
</head>
<body>
<!-- partial:index.partial.html -->
<div class="container" id="container">
<ul class="notifications"></ul>
<div class="form-container" id="forgetPass-contaniner">
  <form id = "form-pass" action="<c:url value ='/account/login/forgetpass/submit.htm' />"  method = "POST">
    <h1>Quên mật khẩu</h1>
    <input type="text" placeholder="Tên đăng nhập" name = "username">
    <input type="email" placeholder="Email"  name = "email">
  
    <button  class="button"type = "submit">Xác nhận</button>
  </form>
</div>
<div class="overlay-container" >
  <div class="overlay">
<div class="overlay-panel overlay-right">
  <h1 class="title">Chào bạn,</h1>
            <p>Nếu bạn đã có tài khoản, vui lòng đăng nhập tại đây</p>
            <a class="ghost button" id="login" href="<c:url value ='/login.htm' />">Đăng nhập
             <i class="lni lni-arrow-left login"></i>
            </a>
</div>
  </div>
</div>
</div>
	<script src="<c:url value = '/assets/js/toast.js' />"></script>

<script>

document.addEventListener("DOMContentLoaded", function() {
    
		//kiểm tra quên mật khẩu 
		 <%if (request.getAttribute("check_forget") != null && request.getAttribute("check_forget").equals(1)) {%>
	    	createToast('error', 'Username không đúng!');
	    	<%} else if (request.getAttribute("check_forget") != null && request.getAttribute("check_forget").equals(2)) {%>
	    	createToast('error','Email không chính xác!');
	    	<%} else if (request.getAttribute("check_forget") != null && request.getAttribute("check_forget").equals(3)) {%>
	    	createToast('success','Thành công!');
	    	<%}else if (request.getAttribute("check_forget") != null && request.getAttribute("check_forget").equals(4)) {%>
	    	createToast('error','Thất bại!');
			<%}%>
		

});

</script>
</body>
</html>