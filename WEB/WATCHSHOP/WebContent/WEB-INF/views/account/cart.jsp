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
<script src="https://code.jquery.com/jquery-3.3.1.min.js" type="text/javascript"></script>

<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css'
	rel='stylesheet'>
<script src="<c:url value = '/include/js/jquery.twbsPagination.js' />"
	type="text/javascript"></script>
<!--=============== SWIPER CSS ===============-->
<link rel="stylesheet" href="../assets/css/swiper-bundle.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<!--=============== CSS ===============-->
<link rel="stylesheet" href="<c:url value ='/assets/css/user.css' />">
<link rel="stylesheet" href="<c:url value ='/assets/css/styles.css' />">
<link rel="stylesheet" href="<c:url value ='/assets/css/manager.css' />">
<link rel="stylesheet" href="<c:url value = '/assets/css/toast.css' />" />
<title>Home</title>
</head>
<body>
	<header class="header" id="header">
		<ul class="notifications"></ul>
		<nav class="nav container">
			<a href="<c:url value ='/home.htm' />" class="nav__logo"> <i
				class='bx bxl-medium-old'></i>TS-WATCH
			</a>

			<div class="nav__menu" id="nav-menu">
				<ul class="nav__list">
					<li class="nav__item"><a href="<c:url value ='/home.htm' />"
						class="nav__link active-link">Home</a></li>
					<li class="nav__item"><a href="#featured" class="nav__link">Featured</a>
					</li>
					<li class="nav__item"><a href="#new" class="nav__link">New</a>
					</li>
					<li class="nav__item"><a href="<c:url value ='/product.htm' />"
						class="nav__link">Products</a></li>
				</ul>
				<div class="nav__close" id="nav-close">
					<i class='bx bx-x'></i>
				</div>
			</div>

			<div class="nav__btns">
				<!-- Theme change button -->
				<form action="<c:url value = '/account/watch/search.htm' />" class="search" id="search-bar">
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
					<a href="<c:url value='/login.htm' />"><i class='bx bx-user'></i></a>
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
						<span class="cart__price" id = "price_format">${item.price }</span>
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
					<form id="form_edit" action="<c:url value ='/account/cart/edit-quantity.htm' />"
						method="post">
						<input type="hidden" name="item_id_detail" id="item_id_detail"
							value=""> <input type="hidden" id="edit_quantity"
							name="quantity_edit" value="" min="1" max="">


					</form>
					<form id="form_delete_${item.item_detail_id }"
						action="<c:url value ='/account/cart/delete.htm' />" method="post">
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

	<main class="main">
		<section class="section content">
			<nav id="sidebar-product">
				<div class="content-fillter">
					<span>Brands</span>
					<ul>
						<c:forEach var="item" items="${brands }">
							<li>
								<div>
								<form action="<c:url value = '/find/findbybrand.htm' />"
										id="find_brand_${item.brand_id }" method = "POST">
										<input type="checkbox" id="brand1" class = "brand_${item.brand_id }" name="brand_id"
										value="${item.brand_id }"> <label for="brand1">
										${item.brand_name }</label>
									</form>
								
								</div>
							</li>
						</c:forEach>
					</ul>
					<span>Categorys</span>
					<ul>
						<c:forEach var="item" items="${category }">
							<li>
								<div>
									<form action="<c:url value = '/find/findbycategory.htm' />"
										id="find_brand_${item.category_id }" method = "POST">
										<input type="checkbox" id="Category1" name="category_id" class = "category_${item.category_id }"
											value="${item.category_id }"> <label for="Catagory1">${item.category_name }</label>
									</form>
									
								</div>
							</li>

						</c:forEach>
					</ul>
					<form action="<c:url value = '/find/findbycategoryandbrand.htm' />"
										 method = "POST">
										<input type="hidden" id="brand_brand"  name="brand_id1"
										value=""> 
										<input type="hidden" id="category_category"  name="category_id1"
										value=""> 
									</form>
					<button class="button fillter ">
						<i class="lni lni-funnel"></i> Lọc
					</button>
				</div>
			</nav>
			<section class="productList">
				<div class="products__container grid">

					<c:forEach var="item" items="${watch}"  varStatus="loop" >
						<article class="products__card">
							<a href="<c:url value ='/watch/${item.watch_id }.htm'/>"> <span
								class="products__id" style="display: none;">${item.watch_id }</span>
								<img src="<c:url value ='/images/${item.picture }' />" alt=""
								class="products__img">
								<h3 class="products__title">${item.watch_name}</h3> 
								<span
								class="products__price noneDiscount" id ="price_format">${item.price }</span>
								<small class = "products__percent discount-percent ">${percent_discount }</small>
								<span
								class="products__price dicount-price " id ="price_format">${discount_prices[loop.index] }</span>
							</a>
							<button class="products__button" onclick = "addToCart('${item.watch_id}','${price_buy[loop.index]}','${item.total_quantity }')">
								<i class='bx bx-shopping-bag'></i>
							</button>
							<form id="form_add" action="<c:url value = '/account/cart/add.htm' />"
								method="post">
								<input type="hidden" name="input_id" value=" "
									id="watch_id_input"> <input type="hidden"
									name="input_price" value="" id="input_price"> <input
									type="hidden" name="input_quantity" id="input_quantity"
									value="1" min="1" max="${item.total_quantity }">
							</form>
						</article>
						
					</c:forEach>
					
					
					<form action="" id="form_page">
						<input type="hidden" value="1" id="page_input" name="page">
						<input type="hidden" id="brand_input" name="brand_id" value="">
						<input type="hidden" id="category_input" name="category_id" value="">
					</form>
					
					
				</div>
					<div style="margin-top: 10px; justify-content: center; aligln-items: center;">
					<div aria-label="Page navigation" id="nav__page" style="justify-content: center; margin: 0 25%;	">
						<ul class="pagination" id="pagination" style="margin: 0 20px;"></ul>
					</div>
			</div>
			</section>
		</section>

	</main>

	<footer class="footer section" style="margin-top: 0px;">

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
	<script src="<c:url value = '/assets/js/swiper-bundle.min.js' />"></script>

	<!--=============== MAIN JS ===============-->
	<script src="<c:url value = '/assets/js/main.js' />"></script>
	<script src="<c:url value = '/assets/js/user_script.js' />"></script>
	<script src="<c:url value = '/assets/js/toast.js' />"></script>
	<script>
		var form_page = document.querySelector("#form_page");
		var page_input = document.querySelector("#page_input");
		var currentpage = ${currentpage};
		var pagesize = ${pagesize};
		var maxpage = ${maxpage};
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
		
		var elements = document.querySelectorAll("#price_format");
		elements.forEach(function(element) {
			var price = parseFloat(element.textContent);
			var formattedPrice = price.toLocaleString('vi-VN', {
				style : 'decimal',
				minimumFractionDigits : 0
			}) + " VND";
			element.textContent = formattedPrice;
		});
		
		 function addToCart(watchId,price,total_quantity) {
			    // cập nhật giá trị của input ẩn trong form với watchId được truyền vào từ hàm
			    document.querySelector('#watch_id_input').value = watchId;
			    document.querySelector('#input_price').value = price;
			    // submit form
			    document.querySelector('#input_quantity').setAttribute('max', total_quantity);
			    document.querySelector('#form_add').submit();
			  }
				 document.getElementById("cart-shop").addEventListener("click", function() {
		        document.getElementById("cart").style.display = "block";
		    });
		
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
				form.setAttribute("action", "/WATCHSHOP/account/cart/delete.htm");

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
		
		//lọc với điều kiện và lưu giữ checkbox sau khi load trang
		
		document.addEventListener('DOMContentLoaded', function() {
	        var filterButton = document.querySelector('.button.fillter');
	        var brandCheckboxes = document.querySelectorAll('input[name="brand_id"]');
	        var categoryCheckboxes = document.querySelectorAll('input[name="category_id"]');
	        var brand = document.getElementById('brand_input');
	      
	        var category = document.getElementById('category_input');
	        filterButton.addEventListener('click', function(event) {
	            event.preventDefault(); // Ngăn chặn hành vi mặc định của nút Submit	          	          
	            var selectedBrands = document.querySelectorAll('input[name="brand_id"]:checked');
	            var selectedCategories = document.querySelectorAll('input[name="category_id"]:checked');

	            var brandIds = Array.from(selectedBrands).map(function(brand) {
	                return brand.value;
	            });

	            var categoryIds = Array.from(selectedCategories).map(function(category) {
	                return category.value;
	            });

	            if (brandIds.length === 0 && categoryIds.length === 0) {
	                window.location.href = '<c:url value="/product.htm" />'; // Chuyển hướng về trang "product.htm"
	                return;
	            }
	            sessionStorage.setItem('selectedBrands', brandIds.join(','));
	            sessionStorage.setItem('selectedCategories', categoryIds.join(','));
	           

	            // Xác định URL dựa trên loại lọc được chọn
	            var actionUrl = '';
	            var method = 'POST';

	            if (brandIds.length > 0 && categoryIds.length > 0) {
	                actionUrl = '<c:url value="/find/findbycategoryandbrand.htm" />';
	            } else if (brandIds.length > 0) {
	                actionUrl = '<c:url value="/find/findbybrand.htm" />';
	            } else if (categoryIds.length > 0) {
	                actionUrl = '<c:url value="/find/findbycategory.htm" />';
	            } else {
	            	
	                return;
	            }

	            // Gửi form với các thông tin đã chọn
	            var form = document.createElement('form');
	            form.setAttribute('method', method);
	            form.setAttribute('action', actionUrl);

	            if (brandIds.length > 0) {
	                brandIds.forEach(function(brandId) {
	                    var input = document.createElement('input');
	                    input.setAttribute('type', 'hidden');
	                    input.setAttribute('name', 'brand_id');
	                    input.setAttribute('value', brandId);
	                    form.appendChild(input);
	                    form.submit();
	                });
	            }

	            if (categoryIds.length > 0) {
	                categoryIds.forEach(function(categoryId) {
	                    var input = document.createElement('input');
	                    input.setAttribute('type', 'hidden');
	                    input.setAttribute('name', 'category_id');
	                    input.setAttribute('value', categoryId);
	                    form.appendChild(input);
	                });
	            }

	            if (brandIds.length > 0 && categoryIds.length > 0) {
	                // Tạo các hộp kiểm ẩn để truyền giá trị brand_id và category_id
	                var brandInput = document.createElement('input');
	                brandInput.setAttribute('type', 'hidden');
	                brandInput.setAttribute('name', 'brand_id1');
	                brandInput.setAttribute('value', brandIds.join(','));
	                form.appendChild(brandInput);

	                var categoryInput = document.createElement('input');
	                categoryInput.setAttribute('type', 'hidden');
	                categoryInput.setAttribute('name', 'category_id1');
	                categoryInput.setAttribute('value', categoryIds.join(','));
	                form.appendChild(categoryInput);
	                
	            }
				
	            document.body.appendChild(form);	            
	            form.submit();
	        });
	        var savedBrands = sessionStorage.getItem('selectedBrands');
	        var savedCategories = sessionStorage.getItem('selectedCategories');

	        if (savedBrands) {
	            var savedBrandIds = savedBrands.split(',');

	            brandCheckboxes.forEach(function(checkbox) {
	                if (savedBrandIds.includes(checkbox.value)) {
	                    checkbox.checked = true;
	                }
	            });
	            
	            //lưu giá trị vào input để gửi về controller đẻ next page
				brand.value = savedBrands;
	           
	        }

	        if (savedCategories) {
	            var savedCategoryIds = savedCategories.split(',');

	            categoryCheckboxes.forEach(function(checkbox) {
	                if (savedCategoryIds.includes(checkbox.value)) {
	                    checkbox.checked = true;
	                }
	            });
	            //lưu giá trị vào input để gửi về controller đẻ next page
				category.value = savedCategories;
	            
	        }
	        
	        
	        //remove checkbox sau khi bỏ chọn
	        brandCheckboxes.forEach(function(checkbox) {
	            checkbox.addEventListener('change', function() {
	                if (!checkbox.checked) {
	                    sessionStorage.removeItem('selectedBrands');
	                    brandInput.value = '';
	                }
	            });
	        });

	        categoryCheckboxes.forEach(function(checkbox) {
	            checkbox.addEventListener('change', function() {
	                if (!checkbox.checked) {
	                    sessionStorage.removeItem('selectedCategories');
	                    categoryInput.value = '';
	                }
	            });
	        });
	        console.log(brand);
	        console.log(category);
	    }); 
		    
		//submit form buy khi chọn checkbox để buy 
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
		 
		
		document.addEventListener("DOMContentLoaded", function() {
			 
			 	//kiểm tra thông tin
		        <%if (request.getAttribute("message") != null && request.getAttribute("message").equals(1)) {%>
		        	createToast('success','Thêm vào giỏ hàng thành công !');
		        <%}else if (request.getAttribute("message") != null && request.getAttribute("message").equals(2)) {%>
		        	createToast('erorr','Thêm vào giỏ hàng thất bại !');
		        <%}else if (request.getAttribute("message") != null && request.getAttribute("message").equals(3)) {%>
		        	createToast('success','Update số lượng thành công !');
		        <%}else if (request.getAttribute("message") != null && request.getAttribute("message").equals(4)) {%>
	        		createToast('error','Update số lượng thất bại !');
	        	<%}else if (request.getAttribute("message") != null && request.getAttribute("message").equals(5)) {%>
		        	createToast('success','Xoá sản phẩm thành công !');
		        <%}else if (request.getAttribute("message") != null && request.getAttribute("message").equals(6)) {%>
	        	createToast('error','Xoá sản phẩm thành công !');
	        <%}else if (request.getAttribute("message") != null && request.getAttribute("message").equals(7)) {%>
	        	createToast('error','Vui lòng chọn sản phẩm !');
	        <%}%>
		        
		        
	   
		    });
			
	
		 
	
	</script>
</body>
</html>
