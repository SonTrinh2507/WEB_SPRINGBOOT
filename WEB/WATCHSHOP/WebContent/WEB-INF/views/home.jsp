<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!--=============== FAVICON ===============-->
<link rel="shortcut icon" href="assets/img/favicon.png"
	type="image/x-icon">

<!--=============== BOXICONS ===============-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
<link rel="stylesheet" href="<c:url value = '/assets/css/toast.css' />" />
<!--=============== SWIPER CSS ===============-->
<link rel="stylesheet" href="assets/css/swiper-bundle.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<!--=============== CSS ===============-->

<link rel="stylesheet" href="<c:url value ='/assets/css/styles.css' />" />
<title>Home</title>
</head>
</head>
<body>
	<!-- ==================== HEADER ==================== -->
	<header class="header" id="header">
			<ul class="notifications"></ul>
		<nav class="nav container">
			<a href="#" class="nav__logo"> <i
				class='bx bxs-watch nav__logo-icon'></i> T3S WATCH
			</a>

			<div class="nav__menu" id="nav-menu">
				<ul class="nav__list">
					<li class="nav__item"><a href="#home"
						class="nav__link active-link">Home</a></li>
					<li class="nav__item"><a href="#featured" class="nav__link">Featured</a>
					</li>

					<li class="nav__item"><a href="#products" class="nav__link">Products</a>
					</li>
					<li class="nav__item"><a href="#new" class="nav__link">New</a>
					</li>
				
				</ul>
				<div class="nav__close" id="nav-close">
					<i class='bx bx-x'></i>
				</div>
			</div>

			<div class="nav__btns">
				<!-- Theme change button -->
				<form action="<c:url value = '/search/watch/home.htm' />"
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
					<a href="<c:url value = '/login.htm' />"><i class='bx bx-user'></i></a>
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
					<span class="cart__price" id ="price_format">${item.price }</span>
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
					<form id="form_edit" action="<c:url value ='/account/home/edit-quantity.htm' />"
						method="post">
						<input type="hidden" name="item_id_detail" id="item_id_detail"
							value=""> <input type="hidden" id="edit_quantity"
							name="quantity_edit" value="" min="1" max="">


					</form>
					<form id="form_delete_${item.item_detail_id }"
						action="<c:url value ='/account/home/delete.htm' />" method="post">
						<input type="hidden" name="item_detail_id"
							value="${item.item_detail_id}" class="cart_delete">
						<button type="submit"
							onclick="DeleteFnc('${item.item_detail_id}')"
							class="btn btn__xoa">

							<i class='bx bx-trash-alt cart__amount-trash'>   </i>
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

	<!--==================== MAIN ====================-->
	<main class="main">
	
		<!--==================== HOME ====================-->
		<section class="home" id="home">
			<div class="home__container container grid">
				<c:forEach var = "item" items = "${watch_best }">
				<div class="home__img-bg">
					<img src="<c:url value = '/images/${item.picture}' />" alt="" class="home__img">
				</div>
			
				<div class="home__data">
					<h1 class="home__title">
						${item.watch_name}
					</h1>
					<p class="home__description">${item.describe }</p>
					<span class="home__price" id = "price_format">${item.price }</span>

					<div class="home__btns">
						<a href="<c:url value ='/watch/${item.watch_id}.htm'/>" class="button button--gray button--small">
							Discover </a>
							<form id="form_add_feature"
								action="<c:url value = '/account/cart/add/home.htm' />" method="POST">
								<input type="hidden" name="input_id" value="${item.watch_id } "
									> <input type="hidden"
									name="input_price" value="${item.price }">
								<input type="hidden" name="input_quantity"
									value="1">
								<button class="button home__button" type = "submit">ADD TO CART</button>
							</form>
						
					</div>

				</div>
				</c:forEach>
			</div>
			
		</section>

		<!--==================== FEATURED ====================-->
		<section class="featured section container" id="featured">
			<h2 class="section__title">Featured</h2>

			<div class="featured__container grid">
				<c:forEach begin="0" end="5" var="i" items="${watches}" varStatus="loop">
					<c:if test="${loop.index >= 0 && loop.index <= 5}">
						<article class="featured__card products__card">
							<span class="featured__tag">Sale</span> <a
								href="<c:url value ='/watch/${i.watch_id }.htm'/>"> <img
								src="./images/${i.picture }" alt="" class="featured__img">

								<div class="featured__data">
									<h3 class="featured__title">${i.watch_name }</h3>
									
									<span class="featured__price noneDiscount" id="price_format"> ${i.price }</span> 
									<small class = "discount-percent">${percent_discount }</small>
									
									
									<span class="featured__price dicount-price" id="price"> ${discount_prices[loop.index]}
									</span>
								</div>
							</a>
							<form id="form_add_feature"
								action="<c:url value = '/account/cart/add/home.htm' />" method="POST">
								<input type="hidden" name="input_id" value="${i.watch_id } "
									id="watch_id_input1"> <input type="hidden"
									name="input_price" value="${price_buy[loop.index]}" id="input_price1">
								<input type="hidden" name="input_quantity" id="input_quantity1"
									value="1" min="1" max="${i.total_quantity }">
								<button type="submit" class="button featured__button">ADD
									TO CART</button>
							</form>
						</article>
					</c:if>
				</c:forEach>

			</div>
		</section>

		<!--==================== STORY ====================-->
		<section class="story section container">
			<div class="story__container grid">
				<div class="story__data">
					<h2 class="section__title story__section-title">Our Story</h2>

					<h1 class="story__title">
						Inspirational Watch of <br> this year
					</h1>

					<p class="story__description">The latest and modern watches of
						this year, is available in various presentations in this store,
						discover them now.</p>

					<a href="#" class="button button--small">Discover</a>
				</div>

				<div class="story__images">
					<img src="assets/img/story.png" alt="" class="story__img">
					<div class="story__square"></div>
				</div>
			</div>
		</section>

		<!--==================== PRODUCTS ====================-->
		<section class="products section container" id="products">
			<h2 class="section__title">Products</h2>

			<div class="products__container grid">
				<c:forEach var="item" begin="6" end="11" items="${watches}"
					varStatus="loop">
					<c:if test="${loop.index >= 6 && loop.index <= 11}">
						<article class="products__card">
							<a href="<c:url value ='/watch/${item.watch_id }.htm'/>"> <span
								class="products__id" style="display: none;">${item.watch_id }</span>
								<img src="<c:url value ='/images/${item.picture }' />" alt=""
								class="products__img">
								<h3 class="products__title">${item.watch_name}</h3> 
								<span
								class="products__price noneDiscount" id="price_format">${item.price }</span>
								<small class = "products__percent discount-percent ">${percent_discount }</small>
								<span
								class="products__price dicount-price " id="price_format">${discount_prices[loop.index] }</span>
							</a>

							<form id="form_add_products"
								action="<c:url value = '/account/cart/add/home.htm' />" method="POST">
								<input type="hidden" name="input_id" value="${i.watch_id } "
									id="watch_id_input1"> <input type="hidden"
									name="input_price" value="${price_buy[loop.index] }" id="input_price1">
								<input type="hidden" name="input_quantity" id="input_quantity1"
									value="1" min="1" max="${i.total_quantity }">
								<button class="products__button">
									<i class='bx bx-shopping-bag'></i>
								</button>
							</form>

						</article>
					</c:if>
				</c:forEach>

			</div>
			<div>
                <a href="<c:url value = '/product.htm' />" class="button">Xem thêm</a>
            </div>
		</section>

		<!--==================== TESTIMONIAL ====================-->
		<section class="testimonial section container">
			<div class="testimonial__container grid">
				<div class="swiper testimonial-swiper">
					<div class="swiper-wrapper">
						<div class="testimonial__card swiper-slide">
							<div class="testimonial__quote">
								<i class='bx bxs-quote-alt-left'></i>
							</div>
							<p class="testimonial__description">They are the best watches
								that one acquires, also they are always with the latest news and
								trends, with a very comfortable price and especially with the
								attention you receive, they are always attentive to your
								questions.</p>
							<h3 class="testimonial__date">March 27. 2021</h3>

							<div class="testimonial__perfil">



								<div class="testimonial__perfil-data">
									<span class="testimonial__perfil-name">Lee Doe</span> <span
										class="testimonial__perfil-detail">Director of a
										company</span>
								</div>
							</div>
						</div>

						<div class="testimonial__card swiper-slide">
							<div class="testimonial__quote">
								<i class='bx bxs-quote-alt-left'></i>
							</div>
							<p class="testimonial__description">They are the best watches
								that one acquires, also they are always with the latest news and
								trends, with a very comfortable price and especially with the
								attention you receive, they are always attentive to your
								questions.</p>
							<h3 class="testimonial__date">March 27. 2021</h3>

							<div class="testimonial__perfil">



								<div class="testimonial__perfil-data">
									<span class="testimonial__perfil-name">Samantha Mey</span> <span
										class="testimonial__perfil-detail">Director of a
										company</span>
								</div>
							</div>
						</div>

						<div class="testimonial__card swiper-slide">
							<div class="testimonial__quote">
								<i class='bx bxs-quote-alt-left'></i>
							</div>
							<p class="testimonial__description">They are the best watches
								that one acquires, also they are always with the latest news and
								trends, with a very comfortable price and especially with the
								attention you receive, they are always attentive to your
								questions.</p>
							<h3 class="testimonial__date">March 27. 2021</h3>

							<div class="testimonial__perfil">



								<div class="testimonial__perfil-data">
									<span class="testimonial__perfil-name">Raul Zaman</span> <span
										class="testimonial__perfil-detail">Director of a
										company</span>
								</div>
							</div>
						</div>
					</div>

					<div class="swiper-button-next">
						<i class='bx bx-right-arrow-alt'></i>
					</div>
					<div class="swiper-button-prev">
						<i class='bx bx-left-arrow-alt'></i>
					</div>
				</div>

				<div class="testimonial__images">
					<div class="testimonial__square"></div>
					<img src="assets/img/testimonial.png" alt=""
						class="testimonial__img">
				</div>
			</div>
		</section>

		<!--==================== NEW ====================-->
		<section class="new section container" id="new">
			<h2 class="section__title">New Arrivals</h2>

			<div class="new__container">
				<div class="swiper new-swiper">
					<div class="swiper-wrapper">
						<c:forEach var="item" begin="12" end="16" items="${watches }" varStatus="loop">
							<c:if test="${loop.index >= 12 && loop.index <= 16}">
								<article class="new__card swiper-slide products__card">
									<a href="<c:url value ='/watch/${item.watch_id }.htm'/>"> <span
										class="new__tag">New</span> <img
										src="<c:url value ='/images/${item.picture }'/>" alt=""
										class="new__img">

										<div class="new__data">
											<h3 class="new__title">${item.watch_name }</h3>
											<span class="new__price noneDiscount" id="price_format"> ${item.price }
											</span> 
											<small class ="discount-percent">${percent_discount }</small>
											<span class="new__price dicount-price"  id="price price_format">${discount_prices[loop.index]}</span>
										</div>
									</a>
									<form id="form_add"
										action="<c:url value = '/account/cart/add/home.htm' />" method="POST">
										<input type="hidden" name="input_id" id="watch_id_input"
											value="${item.watch_id}"> <input type="hidden"
											name="input_price" id="input_price" value="${price_buy[loop.index]}">
										<input type="hidden" name="input_quantity" id="input_quantity"
											value="1" min="1" max="${item.total_quantity }">
										<button class="button new__button">ADD TO CART</button>
									</form>



								</article>
							</c:if>
						</c:forEach>

					</div>
				</div>
			</div>
		</section>

		<!--==================== NEWSLETTER ====================-->
		<section class="newsletter section container">
			<div class="newsletter__bg grid">
				<div>
					<h2 class="newsletter__title">
						Subscribe Our <br> Newsletter
					</h2>
					<p class="newsletter__description">Don't miss out on your
						discounts. Subscribe to our email newsletter to get the best
						offers, discounts, coupons, gifts and much more.</p>
				</div>

				<form action="" class="newsletter__subscribe">
					<input type="email" placeholder="Enter your email"
						class="newsletter__input">
					<button class="button">SUBSCRIBE</button>
				</form>
			</div>
		</section>
	</main>

	<!--==================== FOOTER ====================-->
	<footer class="footer section">
		<div class="footer__container container grid">
			<div class="footer__content">
				<h3 class="footer__title">Our information</h3>

				<ul class="footer__list">
					<li>1234 - Peru</li>
					<li>La Libertad 43210</li>
					<li>123-456-789</li>
				</ul>
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
					<li><a href="https://www.facebook.com/" target="_blank"
						class="footer__social-link"> <i class='bx bxl-facebook'></i>
					</a> <a href="https://twitter.com/" target="_blank"
						class="footer__social-link"> <i class='bx bxl-twitter'></i>
					</a> <a href="https://www.instagram.com/" target="_blank"
						class="footer__social-link"> <i class='bx bxl-instagram'></i>
					</a></li>
				</ul>
			</div>
		</div>

		<span class="footer__copy">&#169; Bedimcode. All rigths
			reserved</span>
	</footer>

	<!--=============== SCROLL UP ===============-->
	<a href="#" class="scrollup" id="scroll-up"> <i
		class='bx bx-up-arrow-alt scrollup__icon'></i>
	</a>

	<!--=============== SWIPER JS ===============-->
	<script src="assets/js/swiper-bundle.min.js"></script>

	<!--=============== MAIN JS ===============-->
	<script src="<c:url value = '/assets/js/main.js' />"></script>
	<script src="<c:url value = '/assets/js/user_script.js' />"></script>
	<script src="<c:url value = '/assets/js/toast.js' />"></script>
	<script>
	
	
		//format money
		var elements = document.querySelectorAll("#price_format");
		elements.forEach(function(element) {
			var price = parseFloat(element.textContent);
			var formattedPrice = price.toLocaleString('vi-VN', {
				style : 'decimal',
				minimumFractionDigits : 0
			}) + " VND";
			element.textContent = formattedPrice;
		});

		function addcarthome() {
			// Lấy đối tượng biểu mẫu
			var form = document.getElementById('form_add');

			// Submit biểu mẫu
			form.submit();
		}

		//buyitem theo checkbox
		function submitForm() {
			const checkboxes = document.querySelectorAll(".product-form input[type='checkbox']");
			const item_detail_ids = [];
			const watch_names = [];
			const pictures = [];
			let isCheckboxChecked = false
			checkboxes.forEach(function(checkbox) {
						if (checkbox.checked) {
							isCheckboxChecked = true; // Đã chọn ít nhất một checkbox
							item_detail_ids.push(checkbox.value);
							watch_names.push(checkbox.nextElementSibling.value);
							pictures.push(checkbox.nextElementSibling.nextElementSibling.value);
						}
					});
			if (!isCheckboxChecked) {
				alert("Vui lòng chọn sản phẩm để mua.");
				return; // Dừng hàm nếu không có checkbox nào được chọn
			}
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
			form.submit();
		}

		function DeleteFnc(itemDetailId) {
			// Xác nhận xóa sản phẩm
			if (confirm("Bạn có chắc chắn muốn xóa sản phẩm này?")) {
				// Tạo một form ẩn
				var form = document.createElement("form");
				form.setAttribute("method", "post");
				form.setAttribute("action","/WATCHSHOP/account/home/delete.htm");

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

		document.addEventListener("DOMContentLoaded",function() {

							//kiểm tra thông tin
	<%if (request.getAttribute("message") != null && request.getAttribute("message").equals(1)) {%>
		        	createToast('success','Thêm vào giỏ hàng thành công !');
		        <%}else if (request.getAttribute("message") != null && request.getAttribute("message").equals(2)) {%>
		        	createToast('success','Xoá sản phẩm thành công !');
		        <%}else if (request.getAttribute("message") != null && request.getAttribute("message").equals(3)) {%>
		        	createToast('success','Update số lượng thành công !');
		        <%}%>

		    });
			
	</script>
</body>

</html>