<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">

</head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="../assets/css/swiper-bundle.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet"
	href="<c:url value = '/assets/css/manager.css' />" />
<link rel="stylesheet" href="<c:url value = '/assets/css/styles.css' />" />
<link rel="stylesheet" href="<c:url value = '/assets/css/toast.css' />" />
<link rel="stylesheet"
	href="<c:url value = '/assets/css/swiper-bundle.min.css' />" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="<c:url value = '/include/js/jquery.twbsPagination.js' />"
	type="text/javascript"></script>
<link href="https://cdn.lineicons.com/4.0/lineicons.css"
	rel="stylesheet" />
<style>
    .hidden {
        display: none;
    }
</style>
</head>
<body>

	<!-- HEADER -->
	<header class="header" id="header">
		<nav class="nav container">

			<a href="<c:url value = '/home.htm' />" class="nav__logo"> <i
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
					<li class="nav__item"><a
						href="<c:url value = '/product.htm' />" class="nav__link">Products</a>
					</li>
				</ul>
				<div class="nav__close" id="nav-close">
					<i class='bx bx-x'></i>
				</div>
			</div>

			<div class="nav__btns">
				<!-- Theme change button -->
				
				<i class='bx bx-moon change-theme' id="theme-button"></i>
			

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
		<ul class="notifications"></ul>
		<!-- <a href="#" class="brand">
        <i class='bx bxs-smile'></i>
        <span class="text">AdminHub</span>
    </a> -->
		<ul class="side-menu top">
			<li><a href="<c:url value = '/admin/statistics.htm' />"
				class="active"> <i class='bx bx-bar-chart-alt'></i> <span
					class="text">Thống kê</span>
			</a></li>
			<li class="active"><a
				href="<c:url value = '/admin/watch.htm' />"> <i
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
			<li><a href="<c:url value = '/admin/brand-category.htm' />">
					<i class='bx bxs-component'></i> <span class="text">Hãng/Loại
						đồng hồ</span>
			</a></li>
			<li><a href="<c:url value = '/admin/discount.htm' />"> <i
					class='bx bxs-city'></i> <span class="text">Khuyến mãi</span>
			</a></li>
			<li><a href="<c:url value = '/admin/warranty.htm' />"> <i
					class='bx bxs-city'></i> <span class="text">Bảo hành</span>
			</a></li>

			<li><a href="<c:url value = '/login.htm' />" class="logout">
					<i class='bx bxs-log-out-circle'></i> <span class="text">Đăng
						xuất</span>
			</a></li>
		</ul>
		
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

			<div id="main__product">

				<div class="head-title">
					<div class="left">

						<h1>Sản Phẩm</h1>
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
						<p>Bạn có chắc chắn muốn xóa thông tin sản phẩm</p>
						<output id="id_"></output>
						<div class="dialog-buttons">
							<button id="confirmBtn">Đồng ý</button>
							<button id="cancelBtn">Hủy bỏ</button>
						</div>
					</div>
				</div>
				<!-- <div class="dialog" id="confirmDialog">
					<div class="dialog-content">
						<h2>Xác nhận xóa</h2>
						<p>Bạn có chắc chắn muốn xóa thông tin sản phẩm</p>
						<output id="id_"></output>
						<div class="dialog-buttons">
							<button id="confirmBtn">Đồng ý</button>
							<button id="cancelBtn">Hủy bỏ</button>
						</div>
					</div>
				</div> -->
				<div class="table-data" id="tbl-sp">

					<div class="order">
						<div class="head">

							<h3>Danh sách sản phẩm</h3>
							<form action="<c:url value = '/admin/watch/search.htm' />"
								class="search" id="search-bar">
								<input type="search" name="keyword" id="keyword"
									placeholder="Type something..." class="search__input"><i
									class='bx bx-search'></i>
							</form>
							<a href="#" onclick="openDetail_ad()" id="openDetailLink"
								class="${sudung ? '' : 'hidden'}"> <i
								class="lni lni-circle-plus"></i>
							</a>

						</div>
						<table>
							<thead>
								<tr>
									<th>ID</th>
									<th>Tên Sản Phẩm</th>
									<th>Hình ảnh</th>
									<th>Số Lượng</th>
									<th>Giá</th>
									<th>Hãng</th>
									<th>Loại</th>
									<th>Chỉnh Sửa</th>
								</tr>
							</thead>
							<c:forEach var="item" items="${watchs}">
								<tbody>
									<tr>
										<td>
											<p>${item.watch_id }</p>
										</td>
										<td>${item.watch_name }</td>
										<td><img class="img_product" src="<c:url value ='/images/${item.picture}' />"></td>
										<td><p>${item.total_quantity }</p></td>
										<td id="price"><p>${item.price }</p></td>
										<td><p>${item.getBrands().getBrand_id() }</p> </t>
										<td><p>${item.getCategory().getCategory_id() }</p></td>
										
										<td class="btn"><a class="btn__chitiet" href="#change"
											onclick="getDetailInfo()">

												<input type="hidden" name="watch_id"
												value="${item.watch_id}"> <i class='bx bx-detail'></i>
										</a> <a class="btn__xoa" href="#delete"><i
												class='bx bxs-trash'></i></a></td>
										<!-- <td><span class="status completed">Completed</span></td> -->
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</div>
				</div>
				<div>
					
					<div aria-label="Page navigation" id="nav__page">
						<div  style ="margin: 10px 45%">Số lượng: ${count}</div>
						<ul class="pagination" id="pagination"></ul>
					</div>
				</div>
			</div>

			<!-- </main> -->

		</main>
		<div class="detail" id="detail">
			<div class="detail-content">
				<div class="cutumer__account">
					<span class="close_chitiet" onclick="closeDetail()">&times;</span>
					<form class="form-input"
						action="<c:url value ='/admin/watch/edit.htm' />" method="post">
						<ul id="myList">
							<li><input type="text" id="input__productID" name="watch_id"
								class="field-style field-full align-none"
								placeholder="ID sản phẩm"></li>
							<li><input type="text" id="input__productName"
								name="watch_name" class="field-style field-full align-none"
								placeholder="Tên sản phẩm"></li>
								
							<li style="border: 1px solid black; display: flex; align-items: center; justify-content: start;gap: 30px;height: 50px; padding: 10px;">
                                <input type="file" id="input__img" name="img" class="field-full align-none"  accept="image/*,.pdf" multiple style="opacity: 1; max-width: 110px;">
                                <span class="span_fileName" style="margin: 0 0px;">File name:</span>
                                <img style="height: 40px; width: 40px; object-fit: cover;" class="preView_img" src="">
                            </li>
                            
							<li><input type="text" id="input__sl" name="total_quantity"
								class="field-style field-split align-right"
								placeholder="Số lượng"> <input type="text"
								id="input__price" name="price"
								class="field-style field-split align-left" placeholder="Giá"></li>
							<li><select type="text" id="input__brand"
								class="field-style field-split align-left" name="brand_id">
									<option value="0">Hãng đồng hồ</option>
									<c:forEach var="item" items="${brands}">
										<option value="${item.brand_id }">${item.brand_name}</option>
									</c:forEach>

							</select> <select type="text" id="input__category"
								class="field-style field-split align-right" name="category_id">
									<option value="0">Loại đồng hồ</option>
									<c:forEach var="item" items="${categories }">
										<option value="${item.category_id}">${item.category_name}</option>
									</c:forEach>
							</select></li>
							<li>
							<li><input class="btn btn-success" type="submit"
								value="SAVE" /></li>

						</ul>
					</form>
				</div>
			</div>
		</div>
	</section>

	<form action="<c:url value = '/admin/watch.htm' />" id="form_page">
		<input type="hidden" value="1" id="page_input" name="page"> <input
			type="hidden" value="${orderpage}" name="order"> <input
			type="hidden" value="${dirpage}" name="dir">
	</form>


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

	<script type="text/javascript">
      var form_search_submit = document.querySelector("#form_search_submit");
      console.log(form_search_submit);
      var form_page = document.querySelector("#form_page");
    	var page_input = document.querySelector("#page_input");
    	console.log(form_page);
    	var currentpage = ${currentpage};
    	
		var maxpage = ${maxpage};
  	$(function () {
      window.pagObj = $('#pagination').twbsPagination({
      	totalPages: maxpage,
          visiblePages: 10,
          startPage: currentpage,
          onPageClick: function (event, page) {
              if(currentpage !== page){
                page_input.setAttribute("value", page);
                console.info(page + ' (from options)');
                form_page.submit();
              }
          }
      })
  });
  	 // Kiểm tra giá trị của biến sudung
  	var sudung = <%= session.getAttribute("sudung") %>;
    if (sudung !== true) {
        // Nếu sudung khác true, thêm lớp hidden để ẩn liên kết
        document.getElementById("openDetailLink").classList.add("hidden");
        
    }
 
	 document.addEventListener("DOMContentLoaded", function() {

	        //Kiểm tra add and update
	        <%if (request.getAttribute("edit_watch") != null && request.getAttribute("edit_watch").equals(1)) {%>
     	createToast('error', 'Không được để trống thông tin!');
     	<%} else if (request.getAttribute("edit_watch") != null && request.getAttribute("edit_watch").equals(2)) {%>
     	createToast('success','Thêm thành công!');
     	<%} else if (request.getAttribute("edit_watch") != null && request.getAttribute("edit_watch").equals(3)) {%>
     	createToast('success','Update thành công!');
     	<%} else if (request.getAttribute("edit_watch") != null && request.getAttribute("edit_watch").equals(4)) {%>
     	createToast('error','Thất bại!');
     	<%}%>
   
	    });
	
	 
	   </script>

</body>
</html>

