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
<link rel="stylesheet" href="<c:url value = '/assets/css/toast.css' />" />
<!--=============== SWIPER CSS ===============-->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<!--=============== CSS ===============-->
<link rel="stylesheet"
	href="<c:url value = '/assets/css/swiper-bundle.min.css' />">
<link rel="stylesheet" href="<c:url value = '/assets/css/user.css' />">
<link rel="stylesheet" href="<c:url value = '/assets/css/styles.css' />">

<title>Home</title>
</head>
<body>
	<!-- ==================== HEADER ==================== -->
	<header class="header" id="header">
<ul class="notifications"></ul>
		<nav class="nav container">
			<a href="../home.htm" class="nav__logo"> <i
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
				<form action="<c:url value = '/search/watch.htm' />"
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
						<span class="cart__price" id ="price_format">${item.price }</span>
						<div class="cart__amount">
							<div class="cart__amount-content">
								<span class="cart__amount-box minus"> <i
									class='bx bx-minus' id="giam_${item.item_detail_id }"
									onclick="editQuantity('${item.item_detail_id}','${item.quantity }','${item.getWatchs().getTotal_quantity() }','${item.getWatchs().getWatch_id() }')"></i>
								</span> <input class="cart__amount-number" value="${item.quantity }"
									id="quantity_detail_${item.quantity}" /> <span
									class="cart__amount-box plus"> <i class='bx bx-plus'
									id="tang_${item.item_detail_id}"
									onclick="editQuantity('${item.item_detail_id}','${item.quantity }','${item.getWatchs().getTotal_quantity() }','${item.getWatchs().getWatch_id() }')"></i>
								</span>
							</div>
						</div>
					</div>
					<form id="form_edit" action="<c:url value ='/account/watch/quantity.htm' />"
						method="post">
						
						<input type="hidden" name="item_id_detail" id="item_id_detail"
							value=""> <input type="hidden" id="edit_quantity"
							name="quantity_edit" value="" min="1" max="">
							<input type="hidden" name="watch_id" id="watch-detail"
							value=""> 


					</form>
					
					<form id="form_delete_${item.item_detail_id }"
						action="<c:url value ='/account/watch/delete.htm' />" method="post">
						<input type="hidden" name="item_id_delete"
							value="" class="cart_delete">
							<input type="hidden" name="watch_id"
							value="" class="cart_watch_id">
						<button type="submit"
							
							class="btn btn__xoa"><i class='bx bx-trash-alt cart__amount-trash' onclick="DeleteFnc('${item.item_detail_id}','${item.getWatchs().getWatch_id()}')"></i></button>
					</form>

				</article>
			</c:forEach>
		</div>

		<div class="cart__prices">
			<span class="cart__prices-item">0 items</span> <span
				class="cart__prices-total" id ="price_format">$0</span>
		</div>
		<a onclick="submitForm()" class="button home__button buy">BUY NOW</a>
	</div>

	<!--==================== MAIN ====================-->
	<main class="main">
	
		<section class="section main-wrapper">
			<div class="container">
				<div class="product-div">
					<div class="product-div-left">
						<div class="img-container">
							<img src="<c:url value = '/images/${watch.picture }' />"
								class="product-img"> <img
								src="<c:url value = '/images/${watch.picture }' />"
								alt="watch-imge" id="imgZoom">
						</div>
					</div>

					<div class="product-div-right">
						<span class="product-name">${watch.watch_name }</span> 
						<input type="hidden"
							class="input_hiddenNone" id="price" value= "${watch.price}" /> 
							<span class="product-price noneDiscount"></span>
							<div class="div_discount">
							<input type="hidden" class="input_hiddenDiscount" id="price" value="${price_discount}" /> 
							<span class="product-price discount"></span> 
								<span class = "precentDiscountDl">${percent_discount}</span>
							</div>
							
						<div class="id-status">
							<div>

								<P>Mã sản phẩm:</P>
								<p class="font-bold">${watch.watch_id }</p>
							</div>
							<div>
								<p>Tình trạng:</p>
								<p class="font-bold">${tinhtrang }</p>
							</div>
						</div>
						<div class="size">
							<p>Size:</p>

							<div class="psize">${watch.size}</div>
						</div>
						<div class="quantity">
							<p>Quantity:</p>
							<form id="buyNowForm"
								action="<c:url value = '/account/buynow.htm' />" method="POST">
								<input type="number" min="1" max="${watch.total_quantity }"
									value="1" id = "quantityInput" name="quantity_detail"> <input type="hidden"
									name="watch_id" value="${watch.watch_id}" /> <input
									type="hidden" name="price_detail" value="${price}" />
							</form>
						</div>
						<div class="btn-groups">
							
							<button type="button" class="add-cart-btn" id = "add-cart-btn"
								onclick="submitFormToDifferentURL('/WATCHSHOP/account/add/cartnow.htm')">
								<i class="bx bxs-cart-add"></i> Add to cart
							</button>
							<button type="button" class="buy-now-btn"
								onclick="submitBuyNowForm()">
								<i class="bx bxs-wallet"></i> Buy now
							</button>

						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="section main-desc" style="padding:20px 0;">
            <h3 class="section__title">
                MÔ TẢ SẢN PHẨM
            </h3>
            <div class="container">
                <div class="product-desc">${watch.describe}</div>

            </div>
        </section>
		<section class="section main-review">
			<h3 class="section__title">ĐÁNH GIÁ SẢN PHẨM</h3>
			<div class="container">
				<div class="review-div" onclick="showDlReview()">
					<div class="countReviews">
						<h4>Review</h4>
						<h4>[${review_count}]</h4>
					</div>
					<div class="product-rating total">
						<h4 class="average-rating">0</h4>
						<!-- <div class="average-starts">
                        </div> -->
						<span><i type="solid" class="bx bxs-star"></i></span>
						<!-- <span><i type="solid" class ="bx bxs-star"></i></span>
                        <span><i type="solid" class ="bx bxs-star"></i></span>
                        <span><i type="solid" class ="bx bxs-star"></i></span>
                        <span><i type="solid" class ="bx bxs-star"></i></span> -->
						<i class='bx bx-chevron-down down iconReview'></i>
					</div>
				</div>



				<div class="review-div dl">
				<c:forEach var = "item" items = "${reviews}">
					<div class="user-review">
						
						<h4>${item.getUsers().getUsername()}</h4>
						
						<input type="hidden" class="starts" value="${item.star }">
						<div class ="user-start"></div>
						<p class="content-review">${item.comments }</p>
						<p class="dateReview">${item.date }</p>
					</div>
					</c:forEach>
				</div>
			</div>
		</section>
		<!--==================== FEATURED ====================-->
		<section class="featured section container" id="featured">
			<h2 class="section__title">SẢN PHẨM CÙNG THƯƠNG HIỆU</h2>

			<div class="featured__container grid">
				<c:forEach var="item" items="${watchofbrand}" varStatus="loop">
					<article class="featured__card products__card">
						<!-- <span class="featured__tag">Sale</span> -->
						<a href="<c:url value ='/watch/${item.watch_id }.htm'/>"> <img
							src="<c:url value = '/images/${item.picture }' />" alt=""
							class="featured__img">
							<div class="featured__data">
								<h3 class="featured__title">${item.watch_name}</h3>
								<span class="featured__price noneDiscount" id = "price_format"> ${item.price }
								</span>
								<small class = "discount-percent">${percent_discount }</small>
								<span class="featured__price dicount-price" id ="price_format">${discount_prices[loop.index]}
								</span>
							
							</div>
						</a>
						<form id="form-add-cart"
							action="<c:url value = '/account/add/cartnow.htm' />"
							method="POST">
							<input type="hidden" name="watch_id" value="${item.watch_id }">
							<input type="hidden" name="price_detail" value="${price_buy[loop.index]}">
							<input type="hidden" name="quantity_detail" value="1" min="1"
								max="${item.total_quantity }">
							<button type="submit" class="button featured__button btn_buynow">Thêm
								vào giỏ hàng</button>
						</form>
					</article>
				</c:forEach>

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

	<!--=============== SCROLL UP ===============-->
	<a href="#" class="scrollup" id="scroll-up"> <i
		class='bx bx-up-arrow-alt scrollup__icon'></i>
	</a>

	<!--=============== SWIPER JS ===============-->

	<script src="<c:url value = '/assets/js/swiper-bundle.min.js' />"></script>

	<!--=============== MAIN JS ===============-->
	<script src="<c:url value = '/assets/js/main.js' />"></script>
	<script src="<c:url value = '/assets/js/user_script.js' />"></script>
	<script src="<c:url value = '/assets/js/toast.js' />"></script>

	<script>
	
	var elements = document.querySelectorAll("#price_format");
	elements.forEach(function(element) {
		var price = parseFloat(element.textContent);
		var formattedPrice = price.toLocaleString('vi-VN', {
			style : 'decimal',
			minimumFractionDigits : 0
		}) + " VND";
		element.textContent = formattedPrice;
	});
	
	 var quantityInput = document.getElementById("quantityInput");

	  quantityInput.addEventListener("input", function() {
	    var max = parseInt(quantityInput.getAttribute("max"));
	    var value = parseInt(quantityInput.value);

	    if (value > max) {
	      quantityInput.value = max; // Đặt giá trị nhập vào thành giá trị tối đa
	    }
	  });
    //buyitem theo checkbox
	 function submitForm() {
		    const checkboxes = document.querySelectorAll(".product-form input[type='checkbox']");
		    const item_detail_ids = [];
		    const watch_names = [];
		    const pictures = [];
		    let isCheckboxChecked = false; // Kiểm tra xem có checkbox nào được chọn hay không
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
		    form.submit();}
	 
		const btnSize = document.querySelectorAll('.psize');
		let prevItem;

		btnSize.forEach(function(input) {
			input.addEventListener("click", function() {
				if (prevItem) {
					prevItem.classList.remove("active");
				}
				input.classList.toggle('active');
				prevItem = input;

			})
		})
		function submitBuyNowForm() {
			var form = document.getElementById("buyNowForm");
			form.submit();
		}
		var priceElement = document.getElementById("price");
		var price = parseFloat(priceElement.innerText);

		// Định dạng giá thành tiền VND
		var formattedPrice = new Intl.NumberFormat("vi-VN", {
			style : "currency",
			currency : "VND"
		}).format(price);

		// Hiển thị giá đã định dạng
		priceElement.innerText = formattedPrice;

		function submitFormToDifferentURL(url) {
			var form = document.getElementById('buyNowForm');

			// Thay đổi action của form
			form.action = url;

			// Submit form
			form.submit();
		}
		function editQuantity(detail_id, quantity, total_quantity,watch_id) {
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
		
			var watch_detail_id = document.querySelector('#watch-detail');
			document.querySelector('#item_id_detail').value = detail_id;
			document.querySelector('#edit_quantity').value = quantity;
			// Cập nhật giá trị của số lượng trên giao diện và trong form
			document.querySelector('#edit_quantity').setAttribute('max',
					total_quantity);
			quantity_input.innerHTML = new_quantity;
			edit_quantity_input.value = new_quantity;
			watch_detail_id.value = watch_id;
			console.log(watch_detail_id.value);
			console.log(document.querySelector('#item_id_detail').value);
			console.log(document.querySelector('#edit_quantity').value);
			// Submit form để cập nhật số lượng sản phẩm
			var form = document.getElementById("form_edit");
			form.submit(detail_id);
		}

		function DeleteFnc(item_detail_id,watch_id) {
			  // Tạo một tham chiếu đến form cần submit bằng cách sử dụng item_detail_id
			  var form = document.getElementById("form_delete_" + item_detail_id);
			  
			  var item_detail= form.querySelector('.cart_delete');
			  var watch_detail_id = form.querySelector('.cart_watch_id');
			  watch_detail_id.value =watch_id;
			  item_detail.value = item_detail_id;
			 console.log(watch_detail_id.value);
			 console.log(item_detail.value);
			  // Submit form
			 form.submit();
			}
		
		 document.addEventListener("DOMContentLoaded", function() {
			 
			 	//kiểm tra thông tin
		        <%if (request.getAttribute("message") != null && request.getAttribute("message").equals(1)) {%>
		        	createToast('success','Thêm vào giỏ hàng thành công !');
		        <%}else if (request.getAttribute("message") != null && request.getAttribute("message").equals(4)) {%>
		        	createToast('success','Xoá sản phẩm thành công !');
		        <%}else if (request.getAttribute("message") != null && request.getAttribute("message").equals(2)) {%>
		        	createToast('success','Sửa số lượng thành công !');
		        <%}else if (request.getAttribute("message") != null && request.getAttribute("message").equals(3)) {%>
		        	createToast('erorr','Sửa số lượng thất bại !');
		        <%}%>

		    });
		
	</script>
</body>
</html>