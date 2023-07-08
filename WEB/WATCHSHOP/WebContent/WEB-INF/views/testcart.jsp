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
<link rel="stylesheet" href="<c:url value ='/assets/css/user.css' />">
<link rel="stylesheet" href="<c:url value ='/assets/css/styles.css' />">
<link rel="stylesheet" href="<c:url value ='/assets/css/manager.css' />">

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

			<c:forEach var="item" items="${cart_item }">

				<article class="cart__card">

					<form id="submit_cart"
						action="<c:url value='/addnew/testcart.htm' />" method="post"
						class="product-form">
						<input type="checkbox" id="item_detail_id" name="item_detail_id"
							value="${item.item_detail_id}"> <input type="hidden"
							id="quantity_detail" name="watch_name"
							value="${item.getWatchs().getWatch_name()}"> <input type="hidden"
							id="price_detail" name="picture" value="${item.getWatchs().getPicture()}">
					</form>
					

					<span class="cart__id">${item.item_detail_id}</span>

					<div class="cart__box">
						<img
							src="<c:url value = '/images/${item.getWatchs().getPicture()}'/>"
							alt="" class="cart__img">
					</div>

					<div class="cart__details">

						<h3 class="cart__title">${item.getWatchs().getWatch_name()}</h3>
						<span class="cart__price">${item.price} đ</span>

						<div class="cart__amount">
							<div class="cart__amount-content">
								<span class="cart__amount-box"> <i class='bx bx-minus'
									id="giam_${item.item_detail_id }"
									onclick="editQuantity('${item.item_detail_id}','${item.quantity }')"></i>
								</span>

								<div class="cart__amount-number" id="quantity_detail">${item.quantity}</div>

								<span class="cart__amount-box"> <i class='bx bx-plus'
									id="${item.item_detail_id}"
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


					<form id="form_delete"
						action="<c:url value ='/watch/delete.htm' />" method="post"
						style="display: inline;">
						<input type="hidden" name="item_detail_id"
							value="${item.item_detail_id}" class="cart_delete">
						<button type="submit" class="btn btn__xoa">
							<i class='bx bx-trash-alt cart__amount-trash'></i>
						</button>
					</form>



				</article>
			</c:forEach>



		</div>

		<div class="cart__prices">
			<span class="cart__prices-item">3 items</span> <span
				class="cart__prices-total">$2880</span>
		</div>
		
		<a href = ""id = "submit-cart-btn" onclick = "submitForm()"class="button home__button buy">BUY NOW</a>
	</div>

	<main class="main">
		<section class="section content">
			<nav id="sidebar-product">
				<div class="content-fillter">
					<span>Brands</span>
					<ul>
						<li>
							<div>
								<input type="checkbox" id="brand1" name="band" value="ap">
								<label for="brand1"> Apple</label><br>
							</div>
						</li>
						<li>
							<div>
								<input type="checkbox" id="casio" name="casio" value="ca">
								<label for="casio"> Casio</label><br>
							</div>
						</li>
						<li>
							<div>
								<input type="checkbox" name="band" value="ss"> <label
									for="samsung">Samsung</label><br>
							</div>
						</li>
						<li>
							<div>
								<input type="checkbox" name="oppo" value="op"> <label
									for="oppo">Oppo</label><br>
							</div>
						</li>
					</ul>
					<span>Categorys</span>
					<ul>
						<li>
							<div>
								<input type="checkbox" id="Category1" name="Category1"
									value="dhdt"> <label for="Catagory1">Đồng hồ
									điện tử</label><br>
							</div>
						</li>
						<li>
							<div>
								<input type="checkbox" name="Catagory2" value="dhc"> <label
									for="dhc">Đồng hồ cơ</label><br>
							</div>
						</li>
						<li>
							<div>
								<input type="checkbox" name="Catagory3" value="dhtm"> <label
									for="dhtm">Đồng hồ thông minh</label><br>
							</div>
						</li>
					</ul>
					<button class="button fillter">
						<i class="lni lni-funnel"></i> Lọc
					</button>
				</div>
			</nav>
			<section class="productList">
				<div class="products__container grid">
					<c:forEach var="item" items="${watch}">
						<article class="products__card">

							<img src="<c:url value = '/images/${item.picture}'/>" alt=""
								class="products__img">

							<h3 class="products__title">${item.watch_name }</h3>
							
								<span class="products__price"><fmt:formatNumber
										type="number" pattern="##,###" value="${item.total_quantity}" />đ</span>
								<div class="cart__amount-number ">${item.total_quantity }</div>

								<button class="products__button">
									<i class='bx bx-shopping-bag'></i>
								</button>
							
						</article>
					</c:forEach>

				</div>
			</section>
		</section>
	</main>

	<footer class="footer section">
		<div class="footer__container container grid">
			<div class="footer__content">
				<h3 class="footer__title">Our information</h3>

				<ul class="footer__list">
					<li>1234 - Peru</li>
					<li>La Libertad 43210</li>
					<li>123-456-789</li>
				</ul>
				<p>
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.521284811536!2d106.78434277394591!3d10.84789975787353!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175272a49301c55%3A0xde097a8add7a6926!2zOTcgxJAuIE1hbiBUaGnhu4duLCBIaeG7h3AgUGjDuiwgUXXhuq1uIDksIFRow6BuaCBwaOG7kSBI4buTIENow60gTWluaCwgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1682523151551!5m2!1svi!2s"
						width="200" height="100" style="border: 0;" allowfullscreen=""
						loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
				</p>

			</div>
			<div class="footer__content">
				<h3 class="footer__title">About Us</h3>

				<ul class="footer__links">
					<li><a href="#" class="footer__link">Support Center</a></li>
					<li><a href="#" class="footer__link">Customer Support</a></li>
					<li><a href="#" class="footer__link">About Us</a></li>
					<li><a href="#" class="footer__link">Copy Right</a></li>
				</ul>
			</div>

			<div class="footer__content">
				<h3 class="footer__title">Product</h3>

				<ul class="footer__links">
					<li><a href="#" class="footer__link">Road bikes</a></li>
					<li><a href="#" class="footer__link">Mountain bikes</a></li>
					<li><a href="#" class="footer__link">Electric</a></li>
					<li><a href="#" class="footer__link">Accesories</a></li>
				</ul>
			</div>

			<div class="footer__content">
				<h3 class="footer__title">Social</h3>

				<ul class="footer__social">
					<a href="https://www.facebook.com/" target="_blank"
						class="footer__social-link"> <i class='bx bxl-facebook'></i>
					</a>

					<a href="https://twitter.com/" target="_blank"
						class="footer__social-link"> <i class='bx bxl-twitter'></i>
					</a>

					<a href="https://www.instagram.com/" target="_blank"
						class="footer__social-link"> <i class='bx bxl-instagram'></i>
					</a>
				</ul>
			</div>
		</div>
		<span class="footer__copy">&#169; Bedimcode. All rigths
			reserved</span>
	</footer>

	<a href="#" class="scrollup" id="scroll-up"> <i
		class='bx bx-up-arrow-alt scrollup__icon'></i>
	</a>

	<!--=============== SWIPER JS ===============-->
	<script src="assets/js/swiper-bundle.min.js"></script>
	
	<!--=============== MAIN JS ===============-->
	<script src="assets/js/main.js"></script>
	<script src="<c:url value ='/assets/js/user_script.js' />"></script>
	<script>
	// Lấy danh sách các ô đánh dấu

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
    form.action = '/WATCHSHOP/addnew/testcart.htm';
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
    form.submit();
} 

</script>
	
</body>
</html>