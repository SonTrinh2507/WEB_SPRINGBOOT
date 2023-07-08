
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
<!-- My CSS -->
<link rel="stylesheet"
	href="<c:url value = '/assets/css/manager.css' />" />
<link rel="stylesheet" href="<c:url value = '/assets/css/styles.css' />" />
<link rel="stylesheet"
	href="<c:url value = '/assets/css/swiper-bundle.min.css' />" />

<title>Admin</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Thêm thẻ style cho biểu đồ -->
<style>
.chart canvas {
	width: 100% !important;
	height: auto !important;
}
</style>


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
    <ul class="side-menu top">		
        <li class="active">
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
        <li>
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
		<main style="padding-bottom: 60px">
			<!-- <nav>
				<i class='bx bx-menu' ></i>
				<a href="#" class="nav-link">Categories</a>
			</nav> -->
			<div id="main__statistics" >
				<div class="head-title">
					<div class="left">
						<h1>Thống kê</h1>
						<ul class="breadcrumb">
							<li><a href="#">Thống kê</a></li>
							<li><i class='bx bx-chevron-right'></i></li>
							<li><a class="active" href="#">Trang chủ</a></li>
						</ul>
					</div>
				</div>

				<ul class="box-info">
					<li><i class='bx bxs-basket'></i> <span class="text">
							<h3>${total_orders}</h3>
							<p>Tổng đơn đặt hàng</p>
					</span></li>
					<li><i class='bx bxs-group'></i> <span class="text">
							<h3>${total_users}</h3>
							<p>Tổng số khách hàng</p>
					</span></li>
					<li><i class='bx bxs-dollar-circle'></i> <span class="text">
							<h3>
								<fmt:formatNumber type="number" pattern="##,###"
									value="${total_profit}" />
								đ
							</h3>
							<p>Tổng doanh thu</p>
					</span></li>
				</ul>
			</div>
			<!-- END STATISTICS-->
			<div class="chart">
				<div class="chart">
					<div class="col-12" style="position: relative;">
						<form action="<c:url value ='/admin/statistics.htm' />"
							method="post" class="form_year_select"
							style="position: absolute; z-index: 10000; top: 20px; right: 40px;">
							<select class="form-select" name="year" id="year_profit"
								aria-label="Default select example">
								<c:forEach var="i" begin="${year_profit - 2}"
									end="${year_profit}">
									<c:choose>
										<c:when
											test="${year_use_detail == 1 && year_profit_detail == year_profit - i + (year_profit - 2)}">
											<option selected
												value="${year_profit - i + (year_profit - 2)}">${year_profit - i + (year_profit - 2)}</option>
										</c:when>
										<c:when
											test="${year_use_detail != 1 && year_profit == year_profit - i + (year_profit - 2)}">
											<option selected
												value="${year_profit - i + (year_profit - 2)}">${year_profit - i + (year_profit - 2)}</option>
										</c:when>
										<c:otherwise>
											<option value="${year_profit - i + (year_profit - 2)}">${year_profit - i + (year_profit - 2)}</option>
										</c:otherwise>
									</c:choose>


								</c:forEach>

							</select>
						</form>
						<div class="card">
							<div class="card-header">
								<h4>Thống kê doanh thu</h4>
							</div>
							<div class="card-body">
								<canvas id="chart-profile-visit"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
		<c:set var="data" value="[${total_profit}]" />

		<!-- END PRODUCT-->
		<!-- </div> -->
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

	<!--=============== SWIPER JS ===============-->
	<script type="text/javascript">
// Định nghĩa mảng các nhãn cho biểu đồ (ví dụ: các tháng trong năm)
var labels = ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'];

// Định nghĩa mảng các giá trị doanh thu cho biểu đồ (ví dụ: doanh thu từng tháng trong năm)
var data = ${data};

// Lấy thẻ canvas của biểu đồ
var ctx = document.getElementById('chart-profile-visit').getContext('2d');

// Tạo biểu đồ đường

var data = [];
if ("${profit_detail_month}" != "") {
  data = "${profit_detail_month}".split(" ");
}else{
	 data = "${profit_detail}".split(" ");
	
}

var myChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: labels,
    datasets: [{
      label: 'Doanh thu',
      data: data,
      backgroundColor: 'rgba(255, 99, 132, 0.2)',
      borderColor: 'rgba(255, 99, 132, 1)',
      borderWidth: 1
    }]
  },
  options: {
    scales: {
      y: {
        beginAtZero: true
      }
    }
  }
});
var year_profit = document.querySelector("#year_profit");
var form_year_select = document.querySelector(".form_year_select");

year_profit.addEventListener("change", () => {
  form_year_select.submit();
})

</script>
</body>

</html>
