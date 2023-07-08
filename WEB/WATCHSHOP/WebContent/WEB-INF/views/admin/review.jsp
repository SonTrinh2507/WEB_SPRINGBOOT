<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>REVIEW ADMIN</title>
<link rel="stylesheet"
	href="<c:url value = '/assets/css/manager.css' />" />
<link rel="stylesheet" href="<c:url value = '/assets/css/styles.css' />" />
<link rel="stylesheet"
	href="<c:url value = '/assets/css/swiper-bundle.min.css' />" />
<!-- <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" / -->
>
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css'
	rel='stylesheet'>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
<link rel="stylesheet" href="<c:url value = '/include/css/toast.css' />" />
<link rel="stylesheet" href="<c:url value = '/include/css/app.css' />" />
<link rel="stylesheet"
	href="<c:url value = '/include/css/admin/order_admin.css' />" />

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="<c:url value = '/include/js/jquery.twbsPagination.js' />"
	type="text/javascript"></script>
</head>

<body>
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
			<li class="active"><a
				href="<c:url value = '/admin/review.htm' />"> <i
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
			<div id=main__danhgia>
				<div class="head-title">
					<div class="left">
						<h1>Đánh giá sản phẩm</h1>
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
							<h3>Danh sách đánh giá sản phẩm</h3>
							<form action="" id="search-bar" class="search">
								<input type="search" placeholder="Type something..."
									class="search__input"> <a href="#"><i
									class='bx bx-search'></i></a>
							</form>
						</div>
						<table>
							<thead>
								<tr>
									<th>ID</th>
									<th>Tên đồng hồ</th>
									<th>Hình ảnh</th>
									<th>Đánh giá</th>
									<th>Chi tiết</th>
								</tr>
							</thead>
							<c:forEach var="item" items="${watchs }">
								<tbody>
									<tr>
										<c:set var="averageRating" value="${rate[0]}" />
										<c:set var="reviewCount" value="${rate[1]}" />
										<td><p>${item[0] }</p></td>
										<td><p>${item[1] }</p></td>
										<td><img class="img_product"
											src="<c:url value ='/images/${item[2]}' />"></td>
										<!-- <td><time datetime="....-..-.."></time></td> -->
										<c:forEach var="rate"
											items="${reviews.getListStarCount(item[0])}">
											<c:set var="averageRating" value="${rate[0]}" />
											<c:set var="reviewCount" value="${rate[1]}" />
											<td>
												<div class="product-rating total" style="display: flex;">
													<h4 class="average-rating">${averageRating}</h4>
													<span><i style="color: rgb(231, 172, 44);"
														type="solid" class="bx bxs-star"></i></span>
													<h4>[${reviewCount}]</h4>
												</div>
											</td>
										</c:forEach>
										<td class="btn"><a class="btn__chitiet" href="<c:url value = '/watch/${item[0]}.htm' />"><i
												class='bx bx-detail'></i></a>									</td>
                                    <!-- <td><span class="status completed">Completed</span></td> -->
										</tr>
                        </tbody>
                        </c:forEach>
                    </table>
                    </div>
                </div>
            </div>
        </main>
	</section>

    
   

    <script type="text/javascript">
					var form_page = document.querySelector("#form_page");
					var page_input = document.querySelector("#page_input");
					console.log(form_page);
					var currentpage = $
					{
						currentpage
					};
					var pagesize = $
					{
						pagesize
					};
					var maxpage = $
					{
						maxpage
					};
					$(function() {
						window.pagObj = $('#pagination').twbsPagination({
							totalPages : maxpage,
							visiblePages : pagesize,
							startPage : currentpage,
							onPageClick : function(event, page) {
								if (currentpage !== page) {
									page_input.setAttribute("value", page);
									console.info(page + ' (from options)');
									form_page.submit();
								}
							}
						})
					});
				</script>
  </body>
</html>
