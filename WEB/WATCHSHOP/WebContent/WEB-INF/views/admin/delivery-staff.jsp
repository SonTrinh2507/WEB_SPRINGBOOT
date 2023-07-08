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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">

<!-- My CSS -->
<link rel="stylesheet"
	href="<c:url value = '/assets/css/manager.css' />" />
<link rel="stylesheet" href="<c:url value = '/assets/css/styles.css' />" />
<link rel="stylesheet"
	href="<c:url value = '/assets/css/swiper-bundle.min.css' />" />
<link rel="stylesheet"
	href="<c:url value = '/assets/css/progress.css' />" />
<link rel="stylesheet" href="<c:url value = '/assets/css/user.css' />" />
<link rel="stylesheet" href="<c:url value = '/assets/css/toast.css' />" />

<title>Staff</title>
<!-- JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/2.2.1/js.cookie.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

</head>
<body>
	<!-- HEADER -->
	<header class="header" id="header">
<ul class="notifications"></ul>
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
					<li class="nav__item"><a href="<c:url value='/product.htm' />"
						class="nav__link">Products</a></li>
				</ul>
				<div class="nav__close" id="nav-close">
					<i class='bx bx-x'></i>
				</div>
			</div>

			<div class="nav__btns">
				<!-- Theme change button -->
				<form action="<c:url value = '/account/watch/search1.htm' />"
					class="search" id="search-bar">
					<input type="search" name="keyword" id="keyword"
						placeholder="Type something..." class="search__input"><i
						class='bx bx-search'></i>
				</form>
				<i class='bx bx-moon change-theme' id="theme-button"></i>
				<div class="nav__shop" id="cart-shop">
					<i class='bx bx-shopping-bag'></i>
				</div>

				<div class="nav__toggle" id="nav-toggle">
					<i class='bx bx-grid-alt'></i>
				</div>

				<div class="nav__user" id="info-user">
					<a href="<c:url value='/home.htm' />"><i class='bx bx-user'></i></a>
				</div>
			</div>
		</nav>
	</header>
	<!-- SIDEBAR -->
	<section id="sidebar">
		<ul class="side-menu top">
			<li><a
				href="<c:url value ='/admin/info.htm' />"> <i
					class='bx bxs-info-circle'></i> <span class="text">Thông tin
						tài khoản</span>
			</a></li>
			<li><a href="<c:url value ='/admin/statistics.htm' />"> <i
					class='bx bxs-cart-alt'></i> <span class="text">Thông tin quản lý</span>
			</a></li>
			<li  class="active"><a href="<c:url value ='/staff/delivery.htm' />"> <i
					class='bx bxs-cart-alt'></i> <span class="text">Thông tin giao hàng</span>
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
							href="<c:url value = '/staff/delivery.htm?page=${currentpage}&order=${orderpage}&dir=${orderLink}&status=0' />">Tất
							Cả</a> <a class="btn__ChoXN"
							<c:if test="${status == 1}">active</c:if>
							href="<c:url value = '/staff/delivery.htm?page=${currentpage}&order=${orderpage}&dir=${orderLink}&status=1' />">Chờ
							Xác Nhận</a> <a class="btn__DaXN"
							<c:if test="${status == 2}">active</c:if>
							href="<c:url value = '/staff/delivery.htm?page=${currentpage}&order=${orderpage}&dir=${orderLink}&status=2' />">Đã
							Xác Nhận</a> <a class="btn__DaGiao"
							<c:if test="${status == 3}">active</c:if>
							href="<c:url value = '/staff/delivery.htm?page=${currentpage}&order=${orderpage}&dir=${orderLink}&status=3' />">Đã
							Giao</a> <a class="btn__DaHuy"
							<c:if test="${status == 4}">active</c:if>
							href="<c:url value = '/staff/delivery.htm?page=${currentpage}&order=${orderpage}&dir=${orderLink}&status=4' />">Đã
							Hủy</a>

					</div>
				</div>
				<!-- <div class="dialog" id="confirmDialog_xn">
    <div class="dialog-content">
      <h2>Xác nhận đơn hàng</h2>
      <p>Bạn có chắc chắn muốn xác nhận đơn hàng </p><output style="display: inline;" id = "id_"></output>
      <div class="dialog-buttons">
        <button id="confirmBtn">Đồng ý</button>
        <button id="cancelBtn">Hủy bỏ</button>
      </div>
    </div>
</div>
<div class="dialog" id="confirmDialog_huy">
    <div class="dialog-content">
      <h2>Hủy đơn hàng</h2>
      <p>Bạn có chắc chắn muốn hủy đơn hàng </p><output id = "id_1"></output>
      <div class="dialog-buttons">
        <button id="confirmBtn1">Đồng ý</button>
        <button id="cancelBtn1">Hủy bỏ</button>
      </div>
    </div>
</div> -->
				<div>
					<ul class="notifications"></ul>
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
										<th>UserID</th>
										<th>Chi tiết</th>
									</tr>
								</thead>
									<c:forEach var = "item" items = "${delivery }">	
								<tbody>
																						
									<tr>
										<td><p>${item.order_id }</p></td>
										<td><p>${item.user_id }</p></td>
										<!-- <td><time datetime="....-..-.."></time></td> -->
										<td><p>${item.order_day }</p></td>
										<td>${item.address_id }</td>
										<td>0845002405</td>
										<td><p>${item.total_price }</p>
											</t>
										<td class="tt"><input class="ttddh"
											style="display: none;" value="${item.order_status }">
											<div class="btns">
												<!-- <a class ="btn__DaXN" id ="toggle-green" href="#xacnhan"><i class='bx bx-check' style="border-radius: 20px; padding: 4px;"></i></a>
                                <a class ="btn__DaHuy" id ="toggle-red" href="#huy"><i class='bx bx-x' style="border-radius: 20px; padding: 4px;"></i></a> -->
											</div></td>
										<td>${item.user_id }</td>
										<td class="btn"><a class="btn__chitiet"
											id="btn__chitiet-ddh" href="#detail" onclick="getIdDDH(this);loadDetail('${item.order_id}')"><i
												class='bx bx-detail'></i></a> <a class="btn__ttdh" href="#ttdh"
											onclick="getIdDDH_progress(this);getStaffDelivery('${item.user_delivery}');getOrderIdAddInput()"><i
												class="lni lni-delivery"></i></a></td>
										<!-- <td><span class="status completed">Completed</span></td> -->
									</tr>

								</tbody>
								</c:forEach>		
							</table>
						</div>
					</div>
				</div>
				<!-- <main class="main__detail"> -->

				<!-- </main> -->
			</div>
			</div>
		</main>
		<div class="detail" id="detail"
			style="margin-top: 10%; width: 600px; height: fit-content; background-color: transparent; box-shadow: none;">
			<div class="detail-content" style="margin: 0; width: 100%;">

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
						<table id="order-table" class="table-detail">
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
							<h3 style="font-size: medium; margin-right: 0;" id="dateNow">
								00:00:00 01/01/2023</h3>
							<!-- <h3 style="font-size: medium; margin-right: 0;">Nhân viên giao hàng:</h3>
                    <h3 style="font-size: medium; margin-right: 0;" id="dateNow">Trịnh Thanh Sơn</h3> -->
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
									<div class="active progress two">
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
						<form action = "<c:url value = '/staff/update/status.htm' />" method = "POST">
						<input type = "hidden" id = "order_id" name = "order_id" value =""/>
						<button type = "submit" class="btn_staff btn_nhandon" style="display: none;">Nhận
							đơn</button> 
						</form>
						<form action = "<c:url value = '/staff/success/order.htm' />" method = "POST">
						<input type = "hidden" id = "staff_success_id" name = "order_id" value =""/>
							<button type = "submit" class="btn_staff btn_next" style="display: none;"></button>
						</form>		
					</div>
					<div class="div_nameStaff" style="display: flex; gap: 7px">
						<p>Nhân viên giao hàng:</p>
            			<p class="nameStaff"></p>
        			</div>
			</div>
			</div>
	</div>
	</section>
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
	<script src="<c:url value = '/assets/js/user_script.js' />"></script>
	<script src="<c:url value = '/assets/js/toast.js' />"></script>
	<script src="<c:url value = '/assets/js/main.js' />"></script>
	<script src="<c:url value = '/assets/js/chart.js' />"></script>
	<script src="<c:url value = '/assets/js/mgr_script.js' />"></script>
	<script>
	var order_delivery = [
  		<c:forEach var = "item" items = "${delivery}">
  		
  		    {	order_id : '${item.order_id}',
  		    	user_delivery_id : '${item.user_delivery}',
  		    	user_delivery: '${item.getUsers().getStaff().getStaff_name()}',
  		    	
  		    
  		    },
  		    </c:forEach>  
  		];
	
	
	 
	  //arr order-detail
	  var order_detail_arr = [
			<c:forEach var = "item" items = "${detail}">
			
			    {	order_detail_id : '${item.order_detail_id}',
			    	order_id : '${item.order_id}',  
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
			 var tableBody = document.querySelector('.table-detail tbody');
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
	function getStaffDelivery(user_delivery) {
		var div_nameStaff = document.querySelector(".div_nameStaff");
		
		var nameStaff = div_nameStaff.querySelector(".nameStaff");

	

		for (var i = 0; i < order_delivery.length; i++) {
			if (order_delivery[i].user_delivery_id === user_delivery) {
				nameStaff.innerText = order_delivery[i].user_delivery;
				break;
			}
		}
	}
	
	function getOrderIdAddInput(){
		const order_id_input = document.getElementById("order_id");
		const ddh_progress = document.getElementById("id_ddh_progress").textContent;
		const staff_success_id = document.getElementById("staff_success_id");
		staff_success_id.value = ddh_progress;
		order_id_input.value = ddh_progress;
		console.log(staff_success_id.value);
		
		
	}
	 document.addEventListener("DOMContentLoaded", function() {
		 
		 	//kiểm tra thông tin
	        <%if (request.getAttribute("message") != null && request.getAttribute("message").equals(1)) {%>
	        	createToast('success','Nhận đơn thành công!');
	        <%}else if (request.getAttribute("message") != null && request.getAttribute("message").equals(2)) {%>
	        	createToast('error','Nhận đơn thất bại !');
	        <%}%>

	    });
	

	// Gọi hàm getStaffDelivery với giá trị user_delivery tương ứng
	

	</script>
</body>
</html>