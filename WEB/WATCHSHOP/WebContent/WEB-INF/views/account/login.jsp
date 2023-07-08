<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<title>Login</title>
<link rel="stylesheet" href="<c:url value = '/assets/css/toast.css' />" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="../assets/css/swiper-bundle.min.css">
<link rel="stylesheet"
	href="<c:url value ='/assets/css/login-new.css' />" />
<link href="https://cdn.lineicons.com/4.0/lineicons.css"
	rel="stylesheet" />
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css'
	rel='stylesheet'>

</head>
<body>
	<div class="container" id="container">

		<div class="form-container register-container">
			<form action="<c:url value ='/signup/submit.htm' />" method="post">
				<h1 style="margin-bottom: 10px;">Đăng kí.</h1>
				<input type="text" placeholder="Tên đăng nhập" name="username">
				<input type="password" placeholder="Mật khẩu"  name="password">
				<input type="password" placeholder="Xác nhận mật khẩu"
					name="repassword"> 
<input type="text" class="input_phoneSign" placeholder="Số điện thoại" name="phone" maxlength = "10" pattern="[0-9]{1,}" oninput="this.value=this.value.replace(/[^0-9]/g,'');">
					<input
					type="email" placeholder="Email" name="email"> 
					<button id="btn__sign" class="button btn-success" type = "submit" style="margin: 20px 0;">Đăng kí</button>	
			</form>
			
		</div>
		

		<div class="form-container login-container" id="login-container">
		<ul class="notifications"></ul> 
			<form action="<c:url value ='/login/submit.htm' />" method="post">
				<h1>Đăng nhập</h1>
				<input type="text" name="username" placeholder="Username"> <input
					type="password" placeholder="Password" name="password">
				<div class="content">
					<div class="checkbox">
						<input type="checkbox" name="rememberMe" id="checkbox"> <label>Ghi
							nhớ</label>
					</div>
					<div>
						<a href="<c:url value ='/account/login/forgetpass.htm' />">Quên mật
							khẩu?</a>
					</div>
				</div>
				 <button class="button btn-success" type = "submit">Đăng
					nhập</button>	
			</form>
		</div>

		<div class="overlay-container">
			<div class="overlay" style="color: black;">
				<div class="overlay-panel overlay-left">
					<h1 class="title">Chào bạn,</h1>
					<p>Nếu bạn đã có tài khoản, vui lòng đăng nhập tại đây</p>
					<a class="ghost button" id="login">Đăng nhập <i
						class="lni lni-arrow-left login"></i>
					</a>
				</div>
				<div class="overlay-panel overlay-right">
					<h2 class="title">Trải nghiệm mua sắm cùng</h2>
					<h1 class="logo" style="font-style: oblique;">
						<i class='bx bxl-medium-old'></i> ST WATCH
					</h1>
					<p>Nếu bạn chưa có tài khoản, bạn có thể đăng ki tại đây.</p>
					<a class="ghost button" id="register">Đăng kí <i
						class="lni lni-arrow-right register"></i>
					</a>
				</div>
			</div>
		</div>
	</div>
		<script src="<c:url value = '/assets/js/toast.js' />"></script>
	<script src="<c:url value ='/assets/js/login.js' />">
	
	</script>
	<script> 
	function validateInput(inputId) {
	    var input = document.getElementById(inputId);
	    var value = input.value;
	  
	    // Loại bỏ các ký tự chữ từ giá trị nhập vào
	    value = value.replace(/[a-zA-Z]/g, '');
	  
	    // Giới hạn độ dài của giá trị là 10

	  
	    // Cập nhật giá trị của ô nhập liệu
	    input.value = value;
	}
	document.addEventListener("DOMContentLoaded", function() {
        //Kiểm tra đăng ký
        <%if (request.getAttribute("message") != null && request.getAttribute("message").equals(5)) {%>
    	createToast('success', 'Thành công!');
    	<%} else if (request.getAttribute("message") != null && request.getAttribute("message").equals(1)) {%>
    	createToast('error','Lỗi trống hoặc sai ký tự!');
    	<%} else if (request.getAttribute("message") != null && request.getAttribute("message").equals(2)) {%>
    	createToast('error','Username đã tồn tại!');
    	<%}else if (request.getAttribute("message") != null && request.getAttribute("message").equals(2)) {%>
    	createToast('error','Số điện thoại đã tồn tại!');
   		 <%}  else if (request.getAttribute("message") != null && request.getAttribute("message").equals(3)) {%>
			createToast('error','Email đã tồn tại!');
		<%}else if (request.getAttribute("message") != null && request.getAttribute("message").equals(6)) {%>
			createToast('error','Thất bại!');
		<%}%>
		
		//kiểm tra đăng nhập
		 <%if (request.getAttribute("login_result") != null && request.getAttribute("login_result").equals(4)) {%>
	    	createToast('success', 'Thành công!');
	    	<%} else if (request.getAttribute("login_result") != null && request.getAttribute("login_result").equals(1)) {%>
	    	createToast('error','Lỗi trống hoặc sai ký tự!');
	    	<%} else if (request.getAttribute("login_result") != null && request.getAttribute("login_result").equals(2)) {%>
	    	createToast('error','Username không đúng!');
	    	<%}else if (request.getAttribute("login_result") != null && request.getAttribute("login_result").equals(3)) {%>
	    	createToast('error','Mật khẩu không đúng!');
	   		 <%}  else if (request.getAttribute("login_result") != null && request.getAttribute("login_result").equals(3)) {%>
				createToast('error','Email đã tồn tại!');
			<%}else if (request.getAttribute("login_result") != null && request.getAttribute("login_result").equals(6)) {%>
				createToast('error','Thất bại!');
			<%}else if (request.getAttribute("login_result") != null && request.getAttribute("login_result").equals(5)) {%>
				createToast('error','Tài khoản hiện tại bị khoá, vui lòng liên hệ admin để tiếp tục!');
			<%}%>
			
			//kiểm tra quên mật khẩu 
			 <%if (request.getAttribute("check_forget") != null && request.getAttribute("check_forget").equals(1)) {%>
		    	createToast('success', 'Username không đúng!');
		    	<%} else if (request.getAttribute("check_forget") != null && request.getAttribute("check_forget").equals(2)) {%>
		    	createToast('error','Username và Email không chính xác!');
		    	<%} else if (request.getAttribute("check_forget") != null && request.getAttribute("check_forget").equals(3)) {%>
		    	createToast('error','Thành công!');
		    	<%}else if (request.getAttribute("check_forget") != null && request.getAttribute("check_forget").equals(4)) {%>
		    	createToast('error','Thất bại!');
				<%}%>
			
  
    });
</script>
</body>
</html>