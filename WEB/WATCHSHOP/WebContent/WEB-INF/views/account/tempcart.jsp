
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!--=============== FAVICON ===============-->
<link rel="shortcut icon" href="assets/img/favicon.png"
	type="image/x-icon">

<!--=============== BOXICONS ===============-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
<link href="https://cdn.lineicons.com/4.0/lineicons.css"
	rel="stylesheet" />

<!--=============== SWIPER CSS ===============-->


<!--=============== CSS ===============-->
<link rel="stylesheet"
	href="<c:url value ='/assets/css/swiper-bundle.min.css' />" />
<link rel="stylesheet" href="<c:url value ='/assets/css/styles.css' />" />
<link rel="stylesheet" href="<c:url value ='/assets/css/user.css' />" />
<link rel="stylesheet" href="<c:url value ='/assets/css/manager.css' />" />

<title>Home</title>
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
					<a href="manager_tk.html"><i class='bx bx-user'></i></a>
				</div>
			</div>
		</nav>
	</header>
	<div class="cart" id="cart">
		<i class='bx bx-x cart__close' id="cart-close"></i>

		<h2 class="cart__title-center">My Cart</h2>

		<div class="cart__container">
			<article class="cart__card">
				<input type="checkbox" name="product" value="sp1">
				<div class="cart__box">
					<img src="assets/img/featured1.png" alt="" class="cart__img">
				</div>
				<div class="cart__details">
					<h3 class="cart__title">Jazzmaster</h3>
					<span class="cart__price">$1050</span>

					<div class="cart__amount">
						<div class="cart__amount-content">
							<span class="cart__amount-box"> <i class='bx bx-minus'></i>
							</span> <span class="cart__amount-number">1</span> <span
								class="cart__amount-box"> <i class='bx bx-plus'></i>
							</span>
						</div>

						<i class='bx bx-trash-alt cart__amount-trash'></i>
					</div>
				</div>
			</article>

			<article class="cart__card">
				<input type="checkbox" name="product" value="sp2">
				<div class="cart__box">
					<img src="assets/img/featured3.png" alt="" class="cart__img">
				</div>

				<div class="cart__details">
					<h3 class="cart__title">Rose Gold</h3>
					<span class="cart__price">$850</span>

					<div class="cart__amount">
						<div class="cart__amount-content">
							<span class="cart__amount-box"> <i class='bx bx-minus'></i>
							</span> <span class="cart__amount-number">1</span> <span
								class="cart__amount-box"> <i class='bx bx-plus'></i>
							</span>
						</div>

						<i class='bx bx-trash-alt cart__amount-trash'></i>
					</div>
				</div>
			</article>

			<article class="cart__card">
				<input type="checkbox" name="product" value="sp3">
				<div class="cart__box">
					<img src="assets/img/new1.png" alt="" class="cart__img">
				</div>

				<div class="cart__details">
					<h3 class="cart__title">Longines Rose</h3>
					<span class="cart__price">$980</span>

					<div class="cart__amount">
						<div class="cart__amount-content">
							<span class="cart__amount-box"> <i class='bx bx-minus'></i>
							</span> <span class="cart__amount-number">1</span> <span
								class="cart__amount-box"> <i class='bx bx-plus'></i>
							</span>
						</div>

						<i class='bx bx-trash-alt cart__amount-trash'></i>
					</div>
				</div>
			</article>
		</div>

		<div class="cart__prices">
			<span class="cart__prices-item">3 items</span> <span
				class="cart__prices-total">$2880</span>
		</div>
		<button class="button home__button buy">BUY NOW</button>
	</div>
	<section class="section thanhtoan">
		<div class="title">
			<h1>
				Thanh Toán
				</h2>
		</div>
		<div class="div-diachi">
			<h3 class="item">
				<i class="lni lni-travel"></i>Địa chỉ nhận hàng
			</h3>
			<c:forEach var="item" items="${address}">
				<div>
					<h4 class="item">${item.receiver_name }</h4>
					<h4 class="item">${item.phone }</h4>
					<h4 class="item">${item.address }</h4>
					<a class="item btn btn_sua" href="#">Thay đổi</a>

				</div>
				<div id="form-checkout">
					<form id="check_out" action="<c:url value='/account/order.htm' />"
						method="POST">
						<input type="hidden" name="tonggia" value="${tonggia}" /> 
						<input
							type="hidden" name="address_id" value="" />
					</form>
				</div>
			</c:forEach>
		</div>
		<div class="tbl-sp">
			<div class="order">
				<div class="head">
					<h3>Danh sách sản phẩm</h3>
					<!-- <form action="" id="search-bar" class="search">
                    <input type="search" placeholder="Type something..." class="search__input">
                    <a href="#"><i class='bx bx-search' ></i></a>
                    </form> -->
				</div>
					<div id="form-detail">
							<form id="check_detail"
								action="<c:url value='/account/order.htm' />" method="POST">
				<table>
					<thead>
						<tr>
							<th>Tên Sản Phẩm</th>
							<th>Hình ảnh</th>

							<th>Số Lượng</th>
							<th>Đơn giá</th>
							<th>Thành tiền</th>
						</tr>
					</thead>
					<c:forEach var="item" items="${productList }">
						<tbody>
							<tr>
								<td>${item.watch_name}</td>
								<td><img src="../images/${item.picture}" alt="Đồng hồ"></td>

								<td>${item.quantity}${item.id }</td>

								<td>${item.price}</td>

								<td>${item.quantity * item.price }</td>
							</tr>
						</tbody>
					
								<input type="hidden" name="item_detail_id[]" value="${item.item_detail_id}" />
									<input type="hidden" name="id[]" value="${item.id}" />
									<input type="hidden" name="quantity_detail[]" value="${item.quantity}" />
									<input type="hidden" name="price_detail[]" value="${item.price}" />
						
					</c:forEach>
				</table>
						
							</form>
						</div>
				<p class="total-price">Tổng tiền: ${tonggia}</p>
			</div>
		</div>
		<div class="htthanhtoan"></div>
		<script>
			
		</script>
		<a class="button" onclick="submitForms()">Đặt hàng</a>
	</section>
	<a href="#" class="scrollup" id="scroll-up"> <i
		class='bx bx-up-arrow-alt scrollup__icon'></i>
	</a>

	<!--=============== SWIPER JS ===============-->
	<script src="assets/js/swiper-bundle.min.js"></script>

	<!--=============== MAIN JS ===============-->
	<script src="assets/js/main.js">
		
	</script>
	<script>
		function submitForms() {
			var form = document.createElement("form");

			// add inputs from form-checkout
			var checkoutForm = document.getElementById("form-checkout")
					.getElementsByTagName("form")[0];
			for (var i = 0; i < checkoutForm.length; i++) {
				if (checkoutForm.elements[i].type === "hidden") {
					var input = document.createElement("input");
					input.type = "hidden";
					input.name = checkoutForm.elements[i].name;
					input.value = checkoutForm.elements[i].value;
					form.appendChild(input);
				}
			}

			// add inputs from form-detail
			
			detailForm = document.getElementById("form-detail")
					.getElementsByTagName("form")[0];
			for (var i = 0; i < detailForm.length; i++) {
				if (detailForm.elements[i].type === "hidden") {
					var input = document.createElement("input");
					input.type = "hidden";
					if (detailForm.elements[i].name === "id_detail") {
						input.name = "id_detail[]";
						input.value = detailForm.elements[i].value;
					} else {
						input.name = detailForm.elements[i].name;
						input.value = detailForm.elements[i].value;
					}
					form.appendChild(input);
				}
			}

			// set form attributes and submit
			form.method = "POST";
			form.action = "<c:url value='/account/order.htm' />";
			document.body.appendChild(form);
			form.submit();
		}
	</script>

</body>
</html>