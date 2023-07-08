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
<link rel="stylesheet"
	href="<c:url value = '/assets/css/manager.css' />" />
<link rel="stylesheet" href="<c:url value = '/assets/css/styles.css' />" />
<link rel="stylesheet"
	href="<c:url value = '/assets/css/swiper-bundle.min.css' />" />
<link rel="stylesheet"
	href="<c:url value = '/assets/css/progress.css' />" />
<link rel="stylesheet" href="<c:url value = '/assets/css/user.css' />" />


<title>Admin</title>
<!-- JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/2.2.1/js.cookie.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<body>
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
			<li><a
				href="<c:url value ='/account/infoCustomer.htm' />"> <i
					class='bx bxs-info-circle'></i> <span class="text">Thông tin
						tài khoản</span>
			</a></li >
			<li  class="active"><a href="<c:url value ='/account/order.htm' />"> <i
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
	<!--==================== CART ====================-->
	<div class="cart" id="cart">
		<i class='bx bx-x cart__close' id="cart-close"></i>

		<h2 class="cart__title-center">My Cart</h2>

		<div class="cart__container">
			<c:forEach var="item" items="${cart_item }">
				<article class="cart__card">
					<form id="submit_cart"
						action="<c:url value='/account/buyitem.htm' />" method="post"
						class="product-form">
						<input class="checkbox" type="checkbox" id="item_detail_id"
							name="item_detail_id" value="${item.item_detail_id}"> <input
							type="hidden" id="quantity_detail" name="watch_name"
							value="${item.getWatchs().getWatch_name()}"> <input
							type="hidden" id="price_detail" name="picture"
							value="${item.getWatchs().getPicture()}">
					</form>

					<div class="cart__box">
						<img
							src="<c:url value ='/images/${item.getWatchs().getPicture() }' />"
							alt="" class="cart__img" />
					</div>
					<div class="cart__details">
						<h3 class="cart__title">${item.getWatchs().getWatch_name() }</h3>
						<span class="cart__price">${item.getWatchs().getPrice() }</span>
						<div class="cart__amount">
							<div class="cart__amount-content">
								<span class="cart__amount-box minus"> <i
									class='bx bx-minus' id="giam_${item.item_detail_id }"
									onclick="editQuantity('${item.item_detail_id}','${item.quantity }')"></i>
								</span> <input class="cart__amount-number" value="${item.quantity }"
									id="quantity_detail_${item.quantity}" /> <span
									class="cart__amount-box plus"> <i class='bx bx-plus'
									id="tang_${item.item_detail_id}"
									onclick="editQuantity('${item.item_detail_id}','${item.quantity }','${item.getWatchs().getTotal_quantity() }')"></i>
								</span>
							</div>
						</div>
					</div>
					<form id="form_edit" action="<c:url value ='/cart/edit.htm' />"
						method="post">
						<input type="hidden" name="item_id_detail" id="item_id_detail"
							value=""> <input type="hidden" id="edit_quantity"
							name="quantity_edit" value="" min="1" max="">


					</form>
					<form id="form_delete_${item.item_detail_id }"
						action="<c:url value ='/watch/delete.htm' />" method="post">
						<input type="hidden" name="item_detail_id"
							value="${item.item_detail_id}" class="cart_delete">
						<button type="submit"
							onclick="DeleteFnc('${item.item_detail_id}')"
							class="btn btn__xoa">

							<i class='bx bx-trash-alt cart__amount-trash'></i>
						</button>
					</form>

				</article>
			</c:forEach>
		</div>

		<div class="cart__prices">
			<span class="cart__prices-item">0 items</span> <span
				class="cart__prices-total">$0</span>
		</div>
		<a onclick="submitForm()" class="button home__button buy">BUY NOW</a>
	</div>
	<!-- SIDEBAR -->
	<section id="sidebar">
		<ul class="side-menu top">
			<li><a href="<c:url value = '/account/infoCustomer.htm' />">
					<i class='bx bxs-info-circle'></i> <span class="text">Thông
						tin tài khoản</span>
			</a></li>
			<li class="active"><a
				href="<c:url value = '/account/order.htm' />"> <i
					class='bx bxs-cart-alt'></i> <span class="text">Đơn mua</span>
			</a></li>
			<li><a href="<c:url value = '/logout.htm' />" class="logout">
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
			<div id="main_oderUser">
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
</div>                             -->
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
								<c:forEach var="item" items="${orders }">
									<tbody>
										<tr>
											<td><p>${item.order_id }</p></td>
											<td><p>${item.getAddress().getReceiver_name() }</p></td>
											<!-- <td><time datetime="....-..-.."></time></td> -->
											<td><p>${item.order_day }</p></td>
											<td><p>${item.getAddress().getAddress() }</p></td>
											<td><p>${item.getAddress().getPhone() }</p></td>
											<td><p>${item.total_price }</p></td>
											<td class="tt"><input class="ttddh"
												style="display: none;" value="${item.order_status }">
												<div class="btns">
													<p>Chờ xác nhận</p>
													<!-- <a class ="btn__DaXN" id ="toggle-green" href="#xacnhan"><i class='bx bx-check' style="border-radius: 20px; padding: 4px;"></i></a>
                                <a class ="btn__DaHuy" id ="toggle-red" href="#huy"><i class='bx bx-x' style="border-radius: 20px; padding: 4px;"></i></a> -->
													<%-- <p>${item.order_status }</p> --%>
												</div></td>
											<td class="btn"><a class="btn__chitiet"
												id="btn__chitiet-ddh" href="#detail"
												onclick="loadDetail('${item.order_id}');getIdDDH(this)"><i
													class='bx bx-detail'></i></a> <a class="btn__ttdh" href="#ttdh"
												onclick="getIdDDH_progress(this);loadbill('${item.order_id}')"><i
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
		</main>
		<div class="detail" id="detail"
			style="margin-top: 10%; width: 600px; height: fit-content; background-color: transparent; box-shadow: none;">
			<div class="detail-content table" style="margin: 0; width: 100%;">
				<div class="table-data" id="dl-ddh">
					<div class="order">
						<span class="close_chitiet" onclick="closeDetail()">&times;</span>
						<div class="head">
							<h3 style="font-size: medium; margin-right: 0;">Chi tiết đơn
								đặt hàng:</h3>
							<h3 style="float: left; font-size: medium;" id="id_ddh"></h3>
							<input type="hidden" id="id_ttdh" value="">
							<form action="" id="search-bar" class="search">
								<input type="search" placeholder="Type something..."
									class="search__input"> <a href="#"><i
									class='bx bx-search'></i></a>
							</form>
						</div>
						<table>
							<thead>
								<tr>
									<th>STT</th>
									<th>Watch ID</th>

									<th>Quantity</th>
									<th>Price</th>
									<th class="col_review">Đánh giá</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>
				</div>

			</div>
		</div>

		<div class="div_review detail-content">
			<div class="contentReview">
				<span class="close_chitiet" onclick="closeReview()">&times;</span>
				<div class="div_start">
					<label class="form-label">Vui lòng chọn sao để đánh giá</label><br>
					<div>
						<span><i type="solid" class="bx bxs-star oneStart"></i></span> <span><i
							type="solid" class="bx bxs-star twoStart"></i></span> <span><i
							type="solid" class="bx bxs-star threeStart"></i></span> <span><i
							type="solid" class="bx bxs-star fourStart"></i></span> <span><i
							type="solid" class="bx bxs-star fiveStart"></i></span>
					</div>

				</div>
				<form action="<c:url value ='/account/review.htm' />" method="POST"
					id="form-review">
					<div class="div__text">
						<label class="form-label">Nhập nội dung đánh giá</label><br>
						<textarea class="txtContent" name="content"></textarea>
						<input type="hidden" name="contentInput" id="contentInput">
						<input type="text" class="idProduct" name="idProduct" value="">
						<input type="text" name="star" class="startsUserReview" value="5">
					</div>
					<input type="submit" onclick="submitReview();closeReview() "
						value="Gửi" />
				</form>
			</div>
		</div>

		<div class="detail" id="detail-ttdh">
			<div class="detail-content" style="width: 660px;">
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
						<a class="btn_viewBill">Xem hóa đơn</a>
						<div class="div_bill "
							style="border: 2px dashed black; display: none;">
							<div class="titleBill">
								<h3 style="font-weight: bolder;">
									<i class='bx bxl-medium-old'></i>TS-WATCH
								</h3>
								<h4>Hóa đơn bán hàng</h4>
							</div>

							<div class="billContent">
								<div class="headBill"></div>
								<p class="date">Ngày:../../....</p>
								<p>Mã hóa đơn:</p>
								<p>Nhân viên giao hàng:</p>
								<div class="table-data bill-table">
									<div class="order">
										<table>
											<thead>
												<tr>
													<th>STT</th>
													<th>Tên sản phẩm</th>
													<th>Hình ảnh</th>
													<th>Số lượng</th>
													<th>Giá</th>
												</tr>
											</thead>
											<tbody>

											</tbody>
										</table>
									</div>
								</div>
								<p class="totalBill"
									style="text-align: right; font-weight: bolder;">Tổng:</p>
									<a class="btn_staff btn_huydon" style="width: 200px; text-align: center; color: rgb(211, 63, 63); margin-left: 30%;">Yêu cầu hủy đơn</a>
							</div>
						</div>
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
	<script src="assets/js/swiper-bundle.min.js"></script>

	<!--=============== MAIN JS ===============-->

	<script src="<c:url value = '/assets/js/main.js' />"></script>
	<script src="<c:url value = '/assets/js/chart.js' />"></script>
	<script src="<c:url value = '/assets/js/mgr_script.js' />"></script>
	<script src="<c:url value = '/assets/js/user_script.js' />"></script>
	<script>
	
	//arr order_detail
	var order_detail_arr = [
  		<c:forEach var = "item" items = "${ds}">
  		
  		    {	order_detail_id : '${item.order_detail_id}',
  		    	order_id : '${item.getOrders().getOrder_id()}',  
  		    	watch_id: '${item.getWatchs().getWatch_id()}',  
  		    	picture : '${item.getWatchs().getPicture()}',  
  		    	quantity: '${item.quantity}',
  		    	price: '${item.price}',
  		    	
  		    
  		    },
  		    </c:forEach>  
  		];
	
	
	//arr_bill
	var bill_arr = [
  		<c:forEach var = "item" items = "${bill}">
  		
  		    {	bill_id : '${item.bill_id}',
  		    	date : '${item.date}',  
  		    	total_price: '${item.total_price}',  
  		    	order_id : '${item.order_id}',  
  		    	user_id: '${item.getUsers().getStaff().getStaff_name()}',
  		    	
  		    
  		    },
  		    </c:forEach>  
  		];
	
	function loadbill(order_id) {
		  // Lọc các order detail có order_id tương ứng
		  var filteredBill = bill_arr.filter(function(item) {
    return item.order_id === order_id;
  });

  // Gắn giá trị vào các phần tử tương ứng
  var dateElement = document.querySelector('.date');
  var billIDElement = document.querySelector('.billContent > p:nth-child(3)');
  var staffElement = document.querySelector('.billContent > p:nth-child(4)');

  dateElement.textContent = "Ngày: " + filteredBill[0].date;
  billIDElement.textContent = "Mã hóa đơn: " + filteredBill[0].bill_id;
  staffElement.textContent = "Nhân viên giao hàng: " + filteredBill[0].user_id;
  var totalBillElement = document.querySelector('.totalBill');
  var totalPriceSum = filteredBill.reduce(function(sum, item) {
    var totalPrice = parseFloat(item.total_price);
    if (!isNaN(totalPrice)) {
      return sum + totalPrice;
    }
    return sum;
  }, 0);
  totalBillElement.textContent = "Tổng: " + totalPriceSum;
  
		  var filteredOrderDetail = order_detail_arr.filter(function(item) {
		    return item.order_id === order_id;
		  });

		  // Tạo các hàng mới trong tbody của bảng
		   var tableBody = document.querySelector('.bill-table tbody');
		  tableBody.innerHTML = '';
			var sum = 0;
		  for (var i = 0; i < filteredOrderDetail.length; i++) {
			  sum ++;
		    var row = document.createElement('tr');
		    var order_id = document.createElement('td');
		   order_id.textContent = sum;
		   
		    var watch_id = document.createElement('td');
		    watch_id.textContent = filteredOrderDetail[i].watch_id;
		    var picture = document.createElement('td');
		    var image = document.createElement('img');
		    var picturePath = filteredOrderDetail[i].picture;
		    var fileName = picturePath.split('/').pop(); // Lấy tên tệp hình ảnh

		    image.src = "http://localhost:9999/WATCHSHOP/images/" + fileName;
		    image.alt = "Hình ảnh sản phẩm";
		    picture.appendChild(image);
		    var quantity = document.createElement('td');
		    quantity.textContent = filteredOrderDetail[i].quantity;
		    var price = document.createElement('td');
		    price.textContent = filteredOrderDetail[i].price;
		  	
		   	
		    row.appendChild(order_id);
		    row.appendChild(watch_id);
		    row.appendChild(picture);
		    row.appendChild(quantity);
		    row.appendChild(price);
		
		    tableBody.appendChild(row);
	
		  }
		 
		}
	
	
	
function loadDetail(order_id) {
		  // Lọc các order detail có order_id tương ứng
		  var filteredOrderDetail = order_detail_arr.filter(function(item) {
		    return item.order_id === order_id;
		  });

		  // Tạo các hàng mới trong tbody của bảng
		  var tableBody = document.querySelector('#dl-ddh table tbody');
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
		    var review = document.createElement('td');
		   	var content = `<a class="col_review linkReview">Viết đánh giá</a>`;
		   	review.innerHTML = content;		   
		    row.appendChild(order_id);
		    row.appendChild(watch_id);
		    row.appendChild(quantity);
		    row.appendChild(price);
		    row.appendChild(review);
		    tableBody.appendChild(row);
		    getProgress(row);
		    review.getElementsByClassName("linkReview")[0].addEventListener('click',showReview);
		  }
		}
	
	//buyitem theo checkbox tương ứng
	 function submitForm() {
		    const checkboxes = document.querySelectorAll(".product-form input[type='checkbox']");
		    const item_detail_ids = [];
		    const watch_names = [];
		    const pictures = [];
		    checkboxes.forEach(function(checkbox) {
		        if (checkbox.checked) {
		            item_detail_ids.push(checkbox.value);
		            watch_names.push(checkbox.nextElementSibling.value);
		            pictures.push(checkbox.nextElementSibling.nextElementSibling.value);
		        }
		    });
		    const form = document.createElement('form');
		    form.method = 'POST';
		    form.action = '/WATCHSHOP/account/buyitem.htm';
		    const item_detail_ids_input = document.createElement('input');
		    item_detail_ids_input.setAttribute('name', 'item_detail_id');
		    item_detail_ids_input.setAttribute('value', item_detail_ids);
		    form.appendChild(item_detail_ids_input);
		    const watch_names_input = document.createElement('input');
		    watch_names_input.setAttribute('name', 'watch_name');
		    watch_names_input.setAttribute('value', watch_names);
		    form.appendChild(watch_names_input);
		    const pictures_input = document.createElement('input');
		    pictures_input.setAttribute('name', 'picture');
		    pictures_input.setAttribute('value', pictures);
		    form.appendChild(pictures_input);
		    document.body.appendChild(form);
		    form.submit();}
	 
	
	//sửa quantity of cart
	 function editQuantity(detail_id, quantity, total_quantity) {
			var quantity_input = document.getElementById("quantity_detail_"
					+ detail_id);
			var edit_quantity_input = document.getElementById("edit_quantity");
			quantity_input = quantity;
			var new_quantity = parseInt(quantity_input);

			// giả sử có 2 biến lưu giá trị cần hiển thị

			// Kiểm tra nút được click là nút tăng hoặc giảm số lượng

			if (event.target.classList.contains("bx-plus")
					&& new_quantity < total_quantity) {
				if (event.target.id.startsWith(`tang_${detail_id}`)) {
					new_quantity += 1;
				}
				// tăng số lượng lên 1
			} else if (event.target.classList.contains("bx-minus")) {
				new_quantity -= 1; // giảm số lượng đi 1
			}

			// Kiểm tra số lượng mới không được nhỏ hơn 1
			if (new_quantity < 1) {
				new_quantity = 1;
			}
			document.querySelector('#item_id_detail').value = detail_id;
			document.querySelector('#edit_quantity').value = quantity;
			// Cập nhật giá trị của số lượng trên giao diện và trong form
			document.querySelector('#edit_quantity').setAttribute('max',
					total_quantity);
			quantity_input.innerHTML = new_quantity;
			edit_quantity_input.value = new_quantity;

			// Submit form để cập nhật số lượng sản phẩm
			document.getElementById("form_edit").submit(detail_id);
		}
	 
	 function DeleteFnc(itemDetailId) {
			// Xác nhận xóa sản phẩm
			if (confirm("Bạn có chắc chắn muốn xóa sản phẩm này?")) {
				// Tạo một form ẩn
				var form = document.createElement("form");
				form.setAttribute("method", "post");
				form.setAttribute("action", "/WATCHSHOP/watch/delete.htm");

				// Tạo một trường ẩn chứa itemDetailId
				var input = document.createElement("input");
				input.setAttribute("type", "hidden");
				input.setAttribute("name", "item_detail_id");
				input.setAttribute("value", itemDetailId);
				form.appendChild(input);

				// Thêm form vào body của trang web
				document.body.appendChild(form);

				// Gửi form để xóa sản phẩm
				form.submit();
			}
		}
		 function submitReview() {
			  var textarea = document.querySelector('.txtContent');
			  var contentInput = document.getElementById('contentInput');

			  // Gán giá trị của textarea vào input ẩn
			 	 contentInput.value = textarea.value;
				console.log(contentInput.value);
			  // Submit form
			  document.getElementById('form-review').submit();
			
		  }
		
	 
</script>
</body>
</html>