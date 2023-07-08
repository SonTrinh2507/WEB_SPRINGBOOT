<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css'
	rel='stylesheet'>
<link href="https://cdn.lineicons.com/4.0/lineicons.css"
	rel="stylesheet" />


<title>Admin</title>
<!-- JS -->

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />

<link rel="stylesheet" href="<c:url value = '/assets/css/toast.css' />" />
<link rel="stylesheet"
	href="<c:url value = '/assets/css/manager.css' />">
<link rel="stylesheet" href="<c:url value = '/assets/css/styles.css' />">
<link rel="stylesheet"
	href="<c:url value = '/assets/css/swiper-bundle.min.css' />">


<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	type="text/javascript"></script>

<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css'
	rel='stylesheet'>
<script src="<c:url value = '/include/js/jquery.twbsPagination.js' />"
	type="text/javascript"></script>
<!--=============== SWIPER CSS ===============-->
<link rel="stylesheet" href="../assets/css/swiper-bundle.min.css">

<title>Admin</title>
<!-- JS -->


</head>
<body>
	<!-- HEADER -->
<header class="header" id="header">
        <nav class="nav container">
            <a href="<c:url value = '/home.htm' />" class="nav__logo">
                <i class='bx bxl-medium-old'></i>TS-WATCH
            </a>
    
            <div class="nav__menu" id="nav-menu">
                <ul class="nav__list">
                    <li class="nav__item">
                        <a href="#home" class="nav__link active-link">Home</a>
                    </li>
                    <li class="nav__item">
                        <a href="#featured" class="nav__link">Featured</a>
                    </li>
                    <li class="nav__item">
                        <a href="#new" class="nav__link">New</a>
                    </li>
                    <li class="nav__item">
                        <a href="<c:url value = '/product.htm' />" class="nav__link">Products</a>
                    </li>
                </ul>
                <div class="nav__close" id="nav-close">
                    <i class='bx bx-x' ></i>
                </div>
            </div>
    
            <div class="nav__btns">
                <!-- Theme change button -->
                <form action="" id="search-bar" class="search">
                    <input type="search" placeholder="Type something..." class="search__input">
                    <a href="#"><i class='bx bx-search' ></i></a>
                </form>
                <i class='bx bx-moon change-theme' id="theme-button"></i>
                <div class="nav__shop" id="cart-shop">
                    <i class='bx bx-shopping-bag' ></i>
                </div>
    
                <div class="nav__toggle" id="nav-toggle">
                    <i class='bx bx-grid-alt' ></i>
                </div>
                
                <div class="nav__user" id="info-user">
                    <a href="<c:url value = '/admin/info.htm' />"><i class='bx bx-user'></i></a>
                </div>
            </div>
        </nav>
    </header>
<!-- SIDEBAR -->
<section id="sidebar">
    <!-- <a href="#" class="brand">
        <i class='bx bxs-smile'></i>
        <span class="text">AdminHub</span>
    </a> -->
    <ul class="notifications"></ul>
    <ul class="side-menu top">		
        <li >
            <a href="<c:url value = '/admin/statistics.htm' />" class="active">
                <i class='bx bx-bar-chart-alt'></i>
                <span class="text">Thống kê</span>
            </a>
        </li>
        <li>
            <a href="<c:url value = '/admin/watch.htm' />">
                <i class='bx bxs-watch-alt'></i>
                <span class="text">Sản phẩm</span>
            </a>
        </li>
        <li>
            <a href="<c:url value = '/admin/order.htm' />">
                <i class='bx bxs-cart-alt'></i>
                <span class="text">Đơn đặt hàng</span>
            </a>
        </li>
        <li>
            <a href="<c:url value = '/admin/review.htm' />">
                <i class='bx bxs-pen'></i>
                <span class="text">Đánh giá</span>
            </a>
        </li>
        <li>
            <a href="<c:url value = '/admin/staff.htm' />">
                <i class='bx bxs-group' ></i>
                <span class="text">Nhân viên</span>
            </a>
        </li>
        <li>
            <a href="<c:url value = '/admin/customer.htm' />">
                <i class='bx bxs-user-detail'></i>
                <span class="text">Khách hàng</span>
            </a>
        </li>
        <li >
            <a href="<c:url value = '/admin/brand-category.htm' />">
                <i class='bx bxs-component'></i>
                <span class="text">Hãng/Loại đồng hồ</span>
            </a>
        </li>
        <li class="active">
            <a href="<c:url value = '/admin/discount.htm' />">
                <i class='bx bxs-city'></i>
                <span class="text">Khuyến mãi</span>
            </a>
        </li>
        <li >
            <a href="<c:url value = '/admin/warranty.htm' />">
                <i class='bx bxs-city'></i>
                <span class="text">Bảo hành</span>
            </a>
        </li>

        <li>	
            <a href="<c:url value = '/login.htm' />" class="logout">
                <i class='bx bxs-log-out-circle' ></i>
                <span class="text">Đăng xuất</span>
            </a>
        </li>
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
			<div id=main__km>
				<div class="head-title">
					<div class="left">
						<h1>Khuyến mãi</h1>
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
				<div class="dialog" id="confirmDialog_">
					<div class="dialog-content">
						<h2>Xác nhận xóa</h2>
						<p>Bạn có chắc chắn muốn xóa đợt khuyến mãi</p>
						<form action = "<c:url value = '/admin/discount/delete.htm' />" method = "POST" id = "form-delete">
						<input id="id_" name = "discount_id"value = ""></input></form>
						<div class="dialog-buttons">
							<button type = "submit" id="confirmBtn" onclick = "submitDelete()">Đồng ý</button>
							<button id="cancelBtn">Hủy bỏ</button>
						</div>
					</div>
				</div>
				<div class="table-data">
					<div class="order">
						<div class="head">
							<h3>Danh sách khuyến mãi</h3>
							<form action="" id="search-bar" class="search">
								<input type="search" placeholder="Type something..."
									class="search__input"> <a href="#"><i
									class='bx bx-search'></i></a>
							</form>
							<a href="#"><i class="lni lni-circle-plus"
								onclick="openDetail_ad()"></i></a>
						</div>
						<table>
							<thead>
								<tr>
									<th>ID</th>
									<th>Lí do khuyến mãi</th>
									<th>Nhân viên tạo khuyến mãi</th>
									<th>Ngày bắt đầu</th>
									<th>Ngày kết thúc</th>
									<th>Phần trăm khuyến mãi</th>
									<th>Chỉnh sửa</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${discount}">
									<tr>
										<td><p>${item.discount_id}</p></td>
										<td><p>${item.discount_name}</p></td>
										<td><p>${item.getStaff().getStaff_name()}</p></td>
										<td><p>${date_start}</p></td>
										<td><p>${date_end}</p></td>
										<td><p>${item.discount_percent}</p></td>
										<td class="btn"><a class="btn__xoa" href="#delete" onclick = "getDiscount_id('${item.discount_id}')"><i
												class='bx bxs-trash'></i></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</main>
		<div class="detail" id="detail">
			<div class="detail-content">
				<span class="close_chitiet" onclick="closeDetail()">&times;</span>
				<form action = "<c:url value = '/admin/discount/add.htm' />" class="form-input" method = "POST">
					<ul id="myList">
						
						<li><input type="text" id="input__reasons" name="discount_name"
							class="field-style field-full align-none"
							placeholder="Lí do khuyến mãi"></li>
						<li><input type="date" id="input__dateStar"
							class="field-style field-split align-left" name="date_start"
							placeholder="Ngày bắt đầu"></input> <input type="date"
							id="input__dateEnd" class="field-style field-split align-right"
							name="date_end" placeholder="Ngày kết thúc"></input></li>
						<li><input type="text" id="input__precent"
							class="field-style field-full align-none" name="percent"
							placeholder="Phần trăm khuyến mãi"></input></li>
					</ul>
							<input type = "submit" value = "Save"/>
				</form>
			</div>
		</div>
	</section>
	<!-- CONTENT -->

	<!--=============== SCROLL UP ===============-->
	<a href="#" class="scrollup" id="scroll-up"> <i
		class='bx bx-up-arrow-alt scrollup__icon'></i>
	</a>

	<!--=============== SWIPER JS ===============-->
	<script src="../assets/js/swiper-bundle.min.js"></script>
	<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"
	integrity="sha512-37T7leoNS06R80c8Ulq7cdCDU5MNQBwlYoy1TX/WUsLFC2eYNqtKlV0QjH7r8JpG/S0GUMZwebnVFLPd6SU5yg=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<!--=============== MAIN JS ===============-->
	<script src="<c:url value = '/assets/js/toast.js' />"></script>
	<script src="<c:url value = '/assets/js/main.js' />"></script>
	<script src="<c:url value = '/assets/js/chart.js' />"></script>
	<script src="<c:url value = '/assets/js/mgr_script.js' />"></script>
	<script>
	// Lấy đối tượng form
	
	// Gắn sự kiện click vào nút "Đồng ý"
	
	function getDiscount_id(id){
		var discount_id = document.getElementById("id_");
		discount_id.value = id;
		console.log(discount_id.value);
		
	}
	function submitDelete() {
		var form = document.getElementById("form-delete");

		// Lấy đối tượng nút "Đồng ý"
		var confirmBtn = document.getElementById("confirmBtn");

	  // Submit form
	  form.submit();
	}
	document.addEventListener("DOMContentLoaded", function() {
		 //Kiểm tra xác nhận đơn hàng
       <%if (request.getAttribute("message") != null && request.getAttribute("message").equals(1)) {%>
	createToast('error', 'Thông tin không được để trống!');
	<%} else if (request.getAttribute("message") != null && request.getAttribute("message").equals(2)) {%>
	createToast('success','Thêm thành công!');
	<%} else if (request.getAttribute("message") != null && request.getAttribute("message").equals(3)) {%>
	createToast('success','Xoá thành công!');
	<%}%> 

  });
	</script>
</body>
</html>
