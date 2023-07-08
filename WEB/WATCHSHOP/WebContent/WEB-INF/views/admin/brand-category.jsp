<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet" href="<c:url value = '/assets/css/toast.css' />" />
<link rel="stylesheet"
	href="<c:url value = '/assets/css/manager.css' />" />
<link rel="stylesheet" href="<c:url value = '/assets/css/styles.css' />" />
<link rel="stylesheet"
	href="<c:url value = '/assets/css/progress.css' />" />
<link rel="stylesheet"
	href="<c:url value = '/assets/css/swiper-bundle.min.css' />" />
	
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="<c:url value = '/include/js/jquery.twbsPagination.js' />"
	type="text/javascript"></script>
<link href="https://cdn.lineicons.com/4.0/lineicons.css"
	rel="stylesheet" />
<title>Admin</title>
<!-- JS -->

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<body>
	<header class="header" id="header">
		<nav class="nav container">
			<a href="home.html" class="nav__logo"> <i
				class='bx bxl-medium-old'></i>TS-WATCH
			</a>

			<div class="nav__menu" id="nav-menu">
				<ul class="nav__list">
					<li class="nav__item"><a href="#home"
						class="nav__link active-link">Home</a></li>
					<li class="nav__item"><a href="#featured" class="nav__link">Featured</a>
					</li>
					<li class="nav__item"><a href="#new" class="nav__link">New</a>
					</li>
					<li class="nav__item"><a href="user_product.html"
						class="nav__link">Products</a></li>
				</ul>
				<div class="nav__close" id="nav-close">
					<i class='bx bx-x'></i>
				</div>
			</div>

			<div class="nav__btns">
				<!-- Theme change button -->
				<form action="" id="search-bar" class="search">
					<input type="search" placeholder="Type something..."
						class="search__input"> <a href="#"><i
						class='bx bx-search'></i></a>
				</form>
				<i class='bx bx-moon change-theme' id="theme-button"></i>
				<div class="nav__shop" id="cart-shop">
					<i class='bx bx-shopping-bag'></i>
				</div>

				<div class="nav__toggle" id="nav-toggle">
					<i class='bx bx-grid-alt'></i>
				</div>

				<div class="nav__user" id="info-user">
					<a href="<c:url value = '/admin/info.htm' />"><i
						class='bx bx-user'></i></a>
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
			<li><a href="<c:url value = '/admin/statistics.htm' />"
				class="active"> <i class='bx bx-bar-chart-alt'></i> <span
					class="text">Thống kê</span>
			</a></li>
			<li><a href="<c:url value = '/admin/watch.htm' />"> <i
					class='bx bxs-watch-alt'></i> <span class="text">Sản phẩm</span>
			</a></li>
			<li><a href="<c:url value = '/admin/order.htm' />"> <i
					class='bx bxs-cart-alt'></i> <span class="text">Đơn đặt hàng</span>
			</a></li>
			<li><a href="<c:url value = '/admin/review.htm' />"> <i
					class='bx bxs-pen'></i> <span class="text">Đánh giá</span>
			</a></li>
			<li><a href="<c:url value = '/admin/staff.htm' />"> <i
					class='bx bxs-group'></i> <span class="text">Nhân viên</span>
			</a></li>
			<li><a href="<c:url value = '/admin/customer.htm' />"> <i
					class='bx bxs-user-detail'></i> <span class="text">Khách
						hàng</span>
			</a></li>
			<li class="active"><a
				href="<c:url value = '/admin/brand-category.htm' />"> <i
					class='bx bxs-component'></i> <span class="text">Hãng/Loại
						đồng hồ</span>
			</a></li>
			<li><a href="<c:url value = '/admin/discount.htm' />"> <i
					class='bx bxs-city'></i> <span class="text">Khuyến mãi</span>
			</a></li>
			<li><a href="<c:url value = '/admin/warranty.htm' />"> <i
					class='bx bxs-city'></i> <span class="text">Bảo hành</span>
			</a></li>

			<li><a href="<c:url value = '/logout.htm'/>" class="logout">
					<i class='bx bxs-log-out-circle'></i> <span class="text">Đăng
						xuất</span>
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
			<div id=main__hdh>
				<div class="head-title">
					<div class="left">
						<h1>Hãng đồng hồ</h1>
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
						<p>Bạn có chắc chắn muốn xóa hãng/loại</p>
						<output id="id_"></output>

						<div class="dialog-buttons">
							<form  id = "form-delete"action=""
								method="post">
								 <input
								type="hidden" name="brand-category-id" value="" id = "category_input">
								<button id="confirmBtn" type = "submit">Đồng ý</button>

							</form>
							<button id="cancelBtn">Hủy bỏ</button>
						</div>
					</div>
				</div>
				<div class="table-data">
					<div class="order">
						<div class="head">
							<h3>Danh sách hãng đồng hồ</h3>
							<form action="" id="search-bar" class="search">
								<input type="search" placeholder="Type something..."
									class="search__input"> <a href="#"><i
									class='bx bx-search'></i></a>
							</form>
							<a href="#"><i class="lni lni-circle-plus" id="button-brand"
								onclick="openDetail_ad();addBrandCategory('<c:url value = '/admin/brand/add.htm' />')"></i></a>
						</div>
						<table>
							<thead>
								<tr>
									<th>ID</th>
									<th>Tên hãng</th>
									<th>Chỉnh Sửa</th>
								</tr>
							</thead>
							<c:forEach var="item" items="${brands }">
								<tbody>
									<tr>
										<td>
											<p>${item.brand_id }</p>
										</td>
										<td>${item.brand_name }</td>
										<td class="btn">
											<!-- <a class ="btn__sua" href="#change" onclick="openDetail_ad()"><i class='bx bx-edit-alt'></i></a> -->
											<a class="btn__chitiet" href="#detail"
											onclick="getDetailInfo();editBrandCategory('<c:url value = '/admin/brand/edit.htm' />')"><i class='bx bx-detail'></i></a> <a
											class="btn__xoa" href="#delete" onclick = "deleteBrandCategory('<c:url value = '/admin/brand/delete.htm' />','${item.brand_id }')"><i class='bx bxs-trash'></i></a>
										</td>
										<!-- <td><span class="status completed">Completed</span></td> -->
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
			<div style="margin-top: 20px; margin-bottom: 50px;" id=main__ldh>
				<div class="head-title">
					<div class="left">
						<h1>Loại đồng hồ</h1>
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
				<div class="table-data">
					<div class="order">
						<div class="head">
							<h3>Danh sách loại đồng hồ</h3>
							<form action="" id="search-bar" class="search">
								<input type="search" placeholder="Type something..."
									class="search__input"> <a href="#"><i
									class='bx bx-search'></i></a>
							</form>
							<a href="#"><i class="lni lni-circle-plus"
								id="button-category"
								onclick="openDetail_ad();addBrandCategory('<c:url value = '/admin/category/add.htm' />')"></i></a>
						</div>
						<table>
							<thead>
								<tr>
									<th>ID</th>
									<th>Tên loại</th>
									<th>Chỉnh Sửa</th>
								</tr>
							</thead>
							<c:forEach var="item" items="${category }">
								<tbody>
									<tr>
										<td>
											<p>${item.category_id }</p>
										</td>
										<td>${item.category_name }</td>
										<td class="btn">
											<!-- <a class ="btn__sua" href="#change"><i class='bx bx-edit-alt'></i></a> -->
											<a class="btn__chitiet" href="#detail"
											onclick="getDetailInfo();editBrandCategory('<c:url value = '/admin/category/edit.htm' />')"><i class='bx bx-detail'></i></a> <a
											class="btn__xoa" href="#delete" onclick = "deleteBrandCategory('<c:url value = '/admin/category/delete.htm' />','${item.category_id }')"><i class='bx bxs-trash'></i></a>
										</td>
										<!-- <td><span class="status completed">Completed</span></td> -->
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</div>
				</div>
		</main>
		<div class="detail" id="detail">
			<div class="detail-content">
				<div class="cutumer__account">
					<span class="close_chitiet" onclick="closeDetail()">&times;</span>
					<form class="form-input" action="" method="post" id="form-add">

						<ul id="myList">
						 <li>
                            <input readonly type="text" id="input__brandID" name="brand-category-id"  class="field-style field-full align-none"  placeholder="ID">
                        	</li>
							<li><input type="text" id="input__brandName"
								name="brand-category" class="field-style field-full align-none"
								placeholder="Tên Hãng/Loại"></li>
							<li><input type="submit" value="Save" /></li>
						</ul>
					</form>

				</div>
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
	
	document.addEventListener("DOMContentLoaded", function() {
			 //Kiểm tra xác nhận đơn hàng
	        <%if (request.getAttribute("message") != null && request.getAttribute("message").equals(1)) {%>
		createToast('error', 'Thông tin không được để trống!');
		<%} else if (request.getAttribute("message") != null && request.getAttribute("message").equals(2)) {%>
		createToast('error','Tên đã tồn tại!');
		<%} else if (request.getAttribute("message") != null && request.getAttribute("message").equals(3)) {%>
		createToast('success','Thành công!');
		<%} else if (request.getAttribute("message") != null && request.getAttribute("message").equals(4)) {%>
		createToast('error','Thất bại!');
		<%}%> 

	   });
	 // Các biến toàn cục để lưu trữ trạng thái của hộp thoại và form
var currentForm = null;


function addBrandCategory(action) {

  
  // Thiết lập action cho biểu mẫu
  document.getElementById("form-add").action = action;
  
  // Cập nhật trạng thái
  currentForm = document.getElementById("form-add");
}

function editBrandCategory(action) {

	  
	  // Thiết lập action cho biểu mẫu
	  document.getElementById("form-add").action = action;
	  
	  // Cập nhật trạng thái
	  currentForm = document.getElementById("form-add");
	}
	
function deleteBrandCategory(action,id) {
	var brand_category = document.getElementById("category_input");
	brand_category.value = id;
console.log(brand_category.value);
	  // Thiết lập action cho biểu mẫu
	  document.getElementById("form-delete").action = action;
	  
	  // Cập nhật trạng thái
	  currentForm = document.getElementById("form-delete");
	}



	   </script>
</body>
</html>