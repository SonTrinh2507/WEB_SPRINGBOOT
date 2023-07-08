<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Boxicons -->
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css'
	rel='stylesheet'>
<link href="https://cdn.lineicons.com/4.0/lineicons.css"
	rel="stylesheet" />

<!-- My CSS -->
<link rel="stylesheet" href="<c:url value = '/assets/css/toast.css' />" />
<link rel="stylesheet" href="<c:url value ='/assets/css/manager.css' />">
<link rel="stylesheet" href="<c:url value ='/assets/css/styles.css' />">
<link rel="stylesheet"
	href="<c:url value ='/assets/css/swiper-bundle.min.css' />">
<link rel="stylesheet"
	href="<c:url value ='/assets/css/progress.css' />">
<link rel="stylesheet" href="<c:url value ='/assets/css/user.css' />">


<title>CUSTOMER-INFO</title>
<!-- JS -->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/2.2.1/js.cookie.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<body>

	<!--=============== SCROLL UP ===============-->

	<header class="header" id="header">
		<nav class="nav container">
			<a href="<c:url value ='/home.htm' />" class="nav__logo"> <i
				class='bx bxs-watch nav__logo-icon'></i> T3S WATCH
			</a>

			<div class="nav__menu" id="nav-menu">
				<ul class="nav__list">
					<li class="nav__item"><a href="<c:url value ='/home.htm' />"
						class="nav__link active-link">Home</a></li>
					<li class="nav__item"><a href="<c:url value ='/product.htm' />"
						class="nav__link">Products</a></li>
					</ul>
				<div class="nav__close" id="nav-close">
					<i class='bx bx-x'></i>
				</div>
			</div>

			<div class="nav__btns">
				<!-- Theme change button -->
				<form action="" class="search" id="search-bar">
					<input type="search" placeholder="Type something..."
						class="search__input">
				</form>
				<i class='bx bx-moon change-theme' id="theme-button"></i>
				<div class="nav__shop" id="cart-shop">
					<i class='bx bx-shopping-bag'></i>
				</div>

				<div class="nav__toggle" id="nav-toggle">
					<i class='bx bx-grid-alt'></i>
				</div>

				<div class="nav__user" id="info-user">
					<a href="<c:url value = '/account/infoCustomer.htm' />"><i
						class='bx bx-user'></i></a>
				</div>
			</div>
		</nav>
	</header>
	<!-- SIDEBAR -->
	<section id="sidebar">
		<ul class="notifications"></ul>
		<ul class="side-menu top">
			<li class="active"><a
				href="<c:url value ='/account/infoCustomer.htm' />"> <i
					class='bx bxs-info-circle'></i> <span class="text">Thông tin
						tài khoản</span>
			</a></li>
			<li><a href="<c:url value ='/account/order.htm' />"> <i
					class='bx bxs-cart-alt'></i> <span class="text">Đơn mua</span>
			</a></li>
			<li><a href="<c:url value ='/logout.htm' />"
				class="logout"> <i class='bx bxs-log-out-circle'></i> <span
					class="text">Đăng xuất</span>
			</a></li>
		</ul>
		<!-- <ul class="side-menu">
			<li>
				<a href="#">
					<i class='bx bxs-cog' ></i>
					<span class="text">Brands</span>
				</a>
			</li>
			<li>
				<a href="#" class="logout">
					<i class='bx bxs-log-out-circle' ></i>
					<span class="text">Categorys</span>
				</a>
			</li>
		</ul> -->
	</section>
	<!-- SIDEBAR -->

	<!-- CONTENT -->
	<section id="content">
	
		<!-- NAVBAR -->
		<nav>

			<a href="#" class="nav-link"><i class='bx bx-menu'></i></a> <a
				href="#" class="btn-download"> <i class='bx bxs-cloud-download'></i>
				<span class="text">Download PDF</span>
			</a>
		</nav>
		<!-- NAVBAR -->

		<!-- MAIN -->
		<main>
			<div id="main_infoUser">
				<div class="head-title">
					<div class="left">
						<h1>Thay đổi thông tin tài khoản</h1>
						<!-- <ul class="breadcrumb">
                                <li>
                                    <a href="#">statistics</a>
                                </li>
                                <li><i class='bx bx-chevron-right'	 ></i></li>
                                <li>
                                    <a class="active" href="#">Home</a>
                                </li>
                            </ul> -->
					</div>
				</div>
				<div class="form-info">
					<form method="POST" class="form-input">
						<ul id="">
							<li><label class="form-label">Họ và tên</label> <input
								type="text" id="input_customerName" name="customer_name"
								value="${customer.customer_name}"
								class="field-style field-full align-none"
								placeholder="Nhập họ và tên"></li>
							<li><label class="form-label">Tên đăng nhập</label> <input
								readonly type="text" id="input__userName" name="username"
								disabled value="${user.username}"
								class="field-style field-full align-none"
								placeholder="Tên đăng nhập"></li>
							<li><label class="form-label">Email</label> <input readonly
								type="text" id="input__email" name="email" value="${user.email}"
								class="field-style field-full align-none"
								placeholder="Nhập email"></li>

							<li><label class="form-label">Số điện thoại</label> <input
								id="input__phone" type="text"
								class="field-style field-full align-none"
								placeholder="Nhập số điện thoại" name="phone"
								value="${user.phone}"></li>
							<li><label class="form-label">Địa chỉ</label> <input
								id="input__address" type="text"
								class="field-style field-full align-none"
								placeholder="Nhập địa chỉ" name="address"
								value="${customer.address}"></li>
							<li><input id="input_birthday" type="date"
								class="field-style field-split align-left" name="birthday"
								value="${customer.birthday}" placeholder="Ngày sinh"> 
								<select
								type="text" id="input_gender"
								class="field-style field-split align-right" name="gender">
									<option value="0">Giới tính</option>
									<option value="Nam"
										${customer.gender == 'Nam' ? 'selected' : ''}>Nam</option>
									<option value="Nữ" ${customer.gender == 'Nữ' ? 'selected' : ''}>Nữ</option>

							</select></li>
							<li style="margin-top: 20px;"><input value=${user.role_id }
								name="role_id" type="hidden" /> <input value=${user.user_id }
								name="user_id" type="hidden" /> <input
								value=${customer.customer_id } name="customer_id" type="hidden" />
								<input type="submit" value="Cập nhật" /></li>

						</ul>
					</form>
				</div>
				<div class="head-title">
					<div class="left">
						<h1>Đổi mật khẩu</h1>
						<!-- <ul class="breadcrumb">
                                <li>
                                    <a href="#">statistics</a>
                                </li>
                                <li><i class='bx bx-chevron-right'	 ></i></li>
                                <li>
                                    <a class="active" href="#">Home</a>
                                </li>
                            </ul> -->
					</div>
				</div>
				<div class="form-changePass">
					<form action="<c:url value ='/account/updatepassword.htm' />"
						method="post" class="form-input">
						<ul id="">
							<li><label class="form-label">Mật khẩu hiện tại</label> <input
								type="password" id="input_oldPass" name="oldpassword"
								class="field-style field-full align-none"
								placeholder="Nhập mật khẩu hiện tại"></li>
							<li><label class="form-label">Mật khẩu mới</label> <input
								type="password" id="input__newPass" name="newpassword"
								class="field-style field-full align-none"
								placeholder="Nhập mật khẩu mới"></li>
							<li><label class="form-label">Xác nhận mật khẩu mới</label>
								<input type="password" id="input__email" name="renewpassword"
								class="field-style field-full align-none"
								placeholder="Nhập lại mật khẩu mới"></li>
							<li style="margin-top: 20px;"><input type="submit"
								value="Xác nhận" /></li>
						</ul>
					</form>
				</div>
			</div>
		</main>
	</section>
	<a href="#" class="scrollup" id="scroll-up"> <i
		class='bx bx-up-arrow-alt scrollup__icon'></i>
	</a>

	<!--=============== SWIPER JS ===============-->
	<script src="<c:url value = '/assets/js/swiper-bundle.min.js' />"></script>


	<!--=============== MAIN JS ===============-->
	<script src="<c:url value = '/assets/js/main.js' />"></script>
	<script src="<c:url value = '/assets/js/chart.js' />"></script>
	<script src="<c:url value = '/assets/js/mgr_script.js' />"></script>
	<script src="<c:url value = '/assets/js/staff.js' />"></script>
<script src="<c:url value = '/assets/js/toast.js' />"></script>

	<script type="text/javascript">
    
	 document.addEventListener("DOMContentLoaded", function() {
		 
		 	//kiểm tra thông tin
	        <%if (request.getAttribute("update") != null && request.getAttribute("update").equals(1)) {%>
	        	createToast('success','cập nhập thông tin thành công !');
	        <%} else if (request.getAttribute("update") != null && request.getAttribute("update").equals(2)) {%>
	        	createToast('error','Sửa thông tin thất bại');
	        <%}%>
	        
	        
	        //Kiểm tra mật khẩu
	        <%if (request.getAttribute("message") != null && request.getAttribute("message").equals(4)) {%>
     	createToast('success', 'Cập nhập mật khẩu thành công!');
     	<%} else if (request.getAttribute("message") != null && request.getAttribute("message").equals(5)) {%>
     	createToast('error','Cập nhập mật khẩu thất bại!');
     	<%} else if (request.getAttribute("message") != null && request.getAttribute("message").equals(1)) {%>
     	createToast('error','Lỗi trống hoặc sai ký tự!');
     	<%}else if (request.getAttribute("message") != null && request.getAttribute("message").equals(2)) {%>
     	createToast('error','Mật khẩu cũ không chính xác!');
    		 <%}  else if (request.getAttribute("message") != null && request.getAttribute("message").equals(3)) {%>
 			createToast('error','Hai mật khẩu không trùng nhau!');
 		<%}%>
   
	    });
	
	 
    
    </script>
</body>
</html>
