<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>ORDER ADMIN</title>

<!-- <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" /> -->
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
			<li><a href="<c:url value = '/admin/watch.htm' />"> <i
					class='bx bxs-watch-alt'></i> <span class="text">Sản phẩm</span>
			</a></li>
			<li class="active"><a
				href="<c:url value = '/admin/order.htm' />"> <i
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
			<div id="main__ddh">
				<div class="head-title">
					<div class="left">
						<h1>Đơn đặt hàng</h1>
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
					<div class="Loc__DDH">
					<div class="head">
						<h3>Lọc nhanh danh sách đơn hàng</h3>
					</div>
					<div class="btn__trangthai">

						<a class="btn__LocAll" <c:if test="${status == 0}">active</c:if>
							href="<c:url value = '/account/order.htm?page=${currentpage}&order=${orderpage}&dir=${orderLink}&status=0' />">Tất
							Cả</a> <a class="btn__ChoXN"
							<c:if test="${status == 1}">active</c:if>
							href="<c:url value = '/account/order.htm?page=${currentpage}&order=${orderpage}&dir=${orderLink}&status=1' />">Chờ
							Xác Nhận</a> <a class="btn__DaXN"
							<c:if test="${status == 2}">active</c:if>
							href="<c:url value = '/account/order.htm?page=${currentpage}&order=${orderpage}&dir=${orderLink}&status=2' />">Đã
							Xác Nhận</a> 
							<a class="btn__VanChuyen"
							<c:if test="${status == 3}">active</c:if>
							href="<c:url value = '/account/order.htm?page=${currentpage}&order=${orderpage}&dir=${orderLink}&status=3' />">Vận Chuyển</a>
							<a class="btn__DaGiao"
							<c:if test="${status == 4}">active</c:if>
							href="<c:url value = '/account/order.htm?page=${currentpage}&order=${orderpage}&dir=${orderLink}&status=4' />">Đã
							Giao</a> <a class="btn__DaHuy"
							<c:if test="${status == 5}">active</c:if>
							href="<c:url value = '/account/order.htm?page=${currentpage}&order=${orderpage}&dir=${orderLink}&status=5' />">Đã
							Hủy</a>


					</div>
				</div>
				<div class="dialog" id="confirmDialog_xn">
					<div class="dialog-content">
						<h2>Xác nhận đơn hàng</h2>
						<p>Bạn có chắc chắn muốn xác nhận đơn hàng</p>
						<form id="submit-status"
							action="<c:url value = '/admin/accept/status.htm' />" method="POST">
							<input id="id_" name="order_id" value=""></input> <input
								type="hidden" name="order_status" value="">
						</form>
						<div class="dialog-buttons">
							<button id="confirmBtn" onclick="submitStatus(2)">Đồng ý</button>
							<button id="cancelBtn">Hủy bỏ</button>
						</div>
					</div>
				</div>
				<div class="dialog" id="confirmDialog_huy">
					<div class="dialog-content">
						<h2>Hủy đơn hàng</h2>
						<p>Bạn có chắc chắn muốn hủy đơn hàng</p>
						<input id="id_1" name="order_id" value=""></input>
						<div class="dialog-buttons">
							<button id="confirmBtn1" onclick="submitStatus(5)">Đồng
								ý</button>
							<button id="cancelBtn1">Hủy bỏ</button>
						</div>
					</div>
				</div>
				<div>
					<div class="table-data" id="ddh-data">
						<div class="order">
							<div class="head">
								<h3>Danh sách đơn hàng</h3>
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
										<th>Người nhận</th>
										<th>Thời gian</th>
										<th>Địa chỉ</th>
										<th>SĐT</th>
										<th>Tổng tiền</th>
										<th>Trạng thái</th>

										<th>Chi tiết</th>
									</tr>
								</thead>
								<c:forEach var="item" items="${orders}">
									<tbody>
										<tr>

											<td><p>${item.order_id }</p></td>
											<td><p>${item.getAddress().getReceiver_name() }</p></td>
											<!-- <td><time datetime="....-..-.."></time></td> -->
											<td><p>${item.order_day }</p></td>
											<td>${item.getAddress().getAddress() }</td>
											<td>${item.getAddress().getPhone() }</td>
											<c:set var="sum" value="0" />
											<c:forEach var="i" items="${item.getOrder_detail()}">
												<c:set var="sum" value="${sum + i.price*i.quantity}" />

											</c:forEach>
											<td><p>${sum}</p></td>

											<td class="tt"><input class="ttddh" type="hidden"
												name="status" value="${item.order_status}">
												<div class="btns">
													<a class="btn__DaXN" id="toggle-green" href="#xacnhan"><i
														class='bx bx-check'
														style="border-radius: 20px; padding: 4px;"></i></a> <a
														class="btn__DaHuy" id="toggle-red" href="#huy"><i
														class='bx bx-x' style="border-radius: 20px; padding: 4px;"></i></a>
												</div></td>
											<td class="btn"><a class="btn__chitiet"
												id="btn__chitiet-ddh" href="#detail"
												onclick="getIdDDH(this);loadDetail('${item.order_id}')">
													<input type="hidden" name="id" value="${item.order_id}">
													<i class='bx bx-detail'></i>
											</a> <a class="btn__ttdh" onclick="getIdDDH_progress(this)"
												href="#ttdh"><i class="lni lni-delivery"></i></a></td>


											<!-- <td><span class="status completed">Completed</span></td> -->
										</tr>
									</tbody>
								</c:forEach>
							</table>

						</div>
					</div>
					
				</div>
				<!-- <main class="main__detail"> -->
				<div style="margin-top: 10px; justify-content: center; align-items: center;">
					<div style = "margin: 10px 45%;">Số lượng: ${count}</div>
					<div aria-label="Page navigation" id="nav__page" style="justify-content: center; margin: 0 25%;	">
						<ul class="pagination" id="pagination" style="margin: 0 20px;"></ul>
					</div>
				</div>
				<!-- </main> -->
			</div>

		</main>
		<div class="detail" id="detail-ttdh">
			<div class="detail-content">
				<div class="table-data">
					<div class="order">
						<span class="close_chitiet" onclick="closeProgress()">&times;</span>
						<div class="head">
							<h3 style="font-size: medium; margin-right: 0;">Mã đơn hàng:</h3>
							<h3 style="float: left; font-size: medium;" id="id_ddh_progress"></h3>
							<h3 style="font-size: medium; margin-right: 0;">Ngày giờ xác
								nhận/hủy:</h3>
							<h3 style="font-size: medium; margin-right: 0;" id="dateNow"></h3>
						</div>
						<div class="progress-order">
							<ul id="step">
								<li><i class="icon lni lni-hand"></i>
									<div class="active progress one">
										<p>1</p>
										<i class="lni lni-checkmark"></i>
									</div>
									<p class="text">Chờ xác nhận</p></li>
								<li class="li"><i class="icon lni lni-thumbs-up"></i>
									<div class="progress two">
										<p>2</p>
										<i class=" lni lni-checkmark"></i>
									</div>
									<p class="text">Xác nhận</p></li>
								<li class="li"><i class="icon lni lni-bi-cycle"></i>
									<div class="progress three">
										<p>3</p>
										<i class="lni lni-checkmark"></i>
									</div>
									<p class="text">Vận chuyển</p></li>
								<li class="li"><i class="icon lni lni-package"></i>
									<div class="progress four">
										<p>4</p>
										<i class="lni lni-checkmark"></i>
									</div>
									<p class="text">Đã giao</p></li>
								<li><i class="icon lni lni-cross-circle"></i>
									<div class="progress five">
										<p>5</p>
										<i class="lni lni-checkmark"></i>
									</div>
									<p class="text">Đã hủy</p></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="detail" id="detail">
			<div class="detail-content">

				<div class="table-data">
					<div class="order">
						<span class="close_chitiet" onclick="closeDetail()">&times;</span>
						<div class="head">
							<h3 style="font-size: medium; margin-right: 0;">Chi tiết đơn
								đặt hàng:</h3>
							<h3 style="float: left; font-size: medium;" id="id_ddh"></h3>
							<form action="" id="search-bar" class="search">
								<input type="search" placeholder="Type something..."
									class="search__input"> <a href="#"><i
									class='bx bx-search'></i></a>
							</form>
						</div>
						<table id="order-table" class="table">
							<thead>
								<tr>
									<th>STT</th>
									<th>Watch ID</th>

									<th>Quantity</th>
									<th>Price</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
	<form action="<c:url value = '/admin/order.htm' />" id="form_page">
		<input type="hidden" value="1" id="page_input" name="page"> <input
			type="hidden" value="${orderpage}" name="order"> <input
			type="hidden" value="${dirpage}" name="dir"> <input
			type="hidden" value="${status}" name="status">
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
  
  //arr order-detail
  var order_detail_arr = [
		<c:forEach var = "item" items = "${ds}">
		
		    {	order_detail_id : '${item.order_detail_id}',
		    	order_id : '${item.getOrders().getOrder_id()}',  
		    	watch_id: '${item.getWatchs().getWatch_id()}',  		
		    	quantity: '${item.quantity}',
		    	price: '${item.price}',
		    	
		    
		    },
		    </c:forEach>  
		];
  
  //load table detail theo order_id
	function loadDetail(order_id) {
		  // Lọc các order detail có order_id tương ứng
		  var filteredOrderDetail = order_detail_arr.filter(function(item) {
		    return item.order_id === order_id;
		  });

		  // Tạo các hàng mới trong tbody của bảng
		  var tableBody = document.querySelector('.table tbody');
		  tableBody.innerHTML = '';
			var sum = 0;
		  for (var i = 0; i < filteredOrderDetail.length; i++) {
			  sum ++;
		    var row = document.createElement('tr');
		    var order_id = document.createElement('td');
		   order_id.textContent = sum;
		   
		    var watch_id = document.createElement('td');
		    watch_id.textContent = filteredOrderDetail[i].watch_id;
		    
		    var quantity = document.createElement('td');
		    quantity.textContent = filteredOrderDetail[i].quantity;
		    var price = document.createElement('td');
		    price.textContent = filteredOrderDetail[i].price;
			
		    row.appendChild(order_id);
		    row.appendChild(watch_id);
		    
		    row.appendChild(quantity);
		    row.appendChild(price);
		    tableBody.appendChild(row);
		   
		  }
		}

	// Lấy tham chiếu đến form và nút "Đồng ý"
	function submitStatus(order_status) {
  var orderID;
  
  if (order_status === 2) {
    // Lấy giá trị của phần tử output có id là "id_"
    orderID = document.getElementById("id_").value;
  } else if (order_status === 5) {
    // Lấy giá trị của phần tử output có id là "id_1"
    orderID = document.getElementById("id_1").value;
    document.getElementById("id_").value = orderID;
  }
  
  // Thiết lập giá trị của phần tử input type="hidden" có name là "order_status"
  var orderStatusInput = document.querySelector('input[name="order_status"]');
  orderStatusInput.value = order_status;

  // Thiết lập giá trị của phần tử output có name là "order_id"
  var orderIDOutput = document.querySelector('input[name="order_id"]');
  orderIDOutput.value = orderID;

  // Gửi form đi
  var form = document.getElementById("submit-status");
  form.submit();
}
	
	 document.addEventListener("DOMContentLoaded", function() {

	        //Kiểm tra xác nhận đơn hàng
	        <%if (request.getAttribute("message") != null && request.getAttribute("message").equals(1)) {%>
  	createToast('success', 'Cập nhật trạng thái đơn hàng thành công!');
  	<%} else if (request.getAttribute("message") != null && request.getAttribute("message").equals(2)) {%>
  	createToast('error','Xác nhận đơn hàng thất bại!');
  	<%}%>

	    });
	
	
	</script>

</body>
</html>
