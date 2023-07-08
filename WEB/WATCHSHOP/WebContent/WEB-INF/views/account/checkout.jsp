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
    <link rel="shortcut icon" href="assets/img/favicon.png" type="image/x-icon">

    <!--=============== BOXICONS ===============-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />

    <!--=============== SWIPER CSS ===============--> 
    <link rel="stylesheet" href="assets/css/swiper-bundle.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <!--=============== CSS ===============-->
 <link rel="stylesheet" href="<c:url value ='/assets/css/user.css' />">
<link rel="stylesheet" href="<c:url value ='/assets/css/styles.css' />">
<link rel="stylesheet" href="<c:url value ='/assets/css/manager.css' />">
<link rel="stylesheet" href="<c:url value = '/assets/css/toast.css' />" />
    <!-- <link rel="stylesheet" href="assets/css/test.css"> -->

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.limit-checkbox/3.1.3/jquery.limit-checkbox.min.js"></script>
    <title>Home</title>
</head>
<body>
<header class="header" id="header">
<ul class="notifications"></ul> 
        <nav class="nav container">
            <a href="<c:url value ='/home.htm' />" class="nav__logo">
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
                        <a href="user_product.html" class="nav__link">Products</a>
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
                    <a href="manager_tk.html"><i class='bx bx-user'></i></a>
                </div>
            </div>
        </nav>
    </header>

<main class="main">
    <section class="section thanhtoan">
        <div class="title">
            <h1>Thanh Toán</h2>
        </div>
        <div class="div-diachi">
            <h3 class="item"><i class="lni lni-travel"></i>Địa chỉ nhận hàng</h3>
            <div>           	
                <h4 class="item name-tt"></h4>
                <h4 class="item phone-tt"></h4>
                <h4 class="item address-tt"></h4>        
                <a class="item btn btn_sua" onclick="openDlAddress()" href="#">Thay đổi</a>
            </div>
             <div id="form-checkout">
					<form id="check_out" action="<c:url value='/account/cart/checkout.htm' />"
						method="POST">
						<input type="hidden" name="tonggia" value="${tonggia}" /> 
						<input type = "hidden" name = "address_send" value = ""/>
						<input type="hidden" class = "addressid" name="address_id" value="" />
						<input type = "hidden" name = "phone_send" value = ""/>
						<input type = "hidden" name = "receiver_name_send" value = ""/>
					</form>
				</div>
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
								action="<c:url value='/account/cart/checkout.htm' />" method="POST">
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

								<td>${item.quantity}</td>

								<td id ="price_format">${item.price}</td>

								<td id ="price_format">${item.quantity * item.price }</td>
							</tr>
						</tbody>
					
								<input type="hidden" name="item_detail_id[]" value="${item.item_detail_id}" />
									<input type="hidden" name="watchid[]" value="${item.watch_id}" />
									<input type="hidden" name="quantity_detail[]" value="${item.quantity}" />
									<input type="hidden" name="price_detail[]" id = "price_format"value="${item.price}" />
						
					</c:forEach>
				</table>
				</form>
				</div>
				<div class="total-price" style="display: flex; justify-content:end; gap: 10px;">
					<p>Tổng tiền(${soluong} sản phẩm):</p>
					<p id="price_format">${tonggia}</p>
				</div>
         </div>
        </div>
        <div class="htthanhtoan">
            <a href="#" onclick = "submitForm_checkout()"class="button">Đặt hàng</a>
        </div> 
    </section>
</main>
<div id="detail">
    <div class="content">
        <div id="select">
        <div class="title">
            <h3>Địa chỉ của tôi</h3>
            <span onclick ="closeDlAddress()"class="close">&times;</span>
        </div>
        <div id="listAddres">
                <div id="list-info">
                <c:forEach var="item" items="${address}">
                    <article class="item">
                        <form action="<c:url value='/account/address/delete.htm' />" method="POST" id="form-delete">
   							 <input id="radio__id" type="radio" name="idAddress" class="radio" value="${item.address_id}">
						</form>
                        <div>
                       	 	
                            <h4 class="name">${item.receiver_name }</h4>
                            <p class="phone">${item.phone }</p>
                            <p class="address">${item.address }</p>
							<p class="address1"></p>
                        </div>
                        
                        <i class='bx bxs-trash btn__xoa' onclick = "submitFormDelete('${item.address_id}')"></i>
                       
                    </article>
                   
                  </c:forEach>
                </div>  
            <div class="btn-address">
                <a href="#" id="btn-add" onclick="openFomr()">Thêm địa chỉ</a>
                <a href="#" id="btn-acp" onclick="">Xác nhận</a>    
            </div>
        </div>
        </div>
        <div id="add">
            <div class="title">
                <i class='bx bx-arrow-back back' onclick="back()"></i>
                <h3>Địa chỉ mới</h3>
                <span onclick="closeDlAddress()" class="close">&times;</span>
            </div>
            <div class="form">
                <form class="form-input" action ="<c:url value ='/account/add/address.htm' />" method = "POST">
                    <ul id="add-info">
                         <li>
                            <input type="text" id="input__name"  class="field-style field-split align-left" name="receiver_name" placeholder="Tên người nhận">
            
                            <input type="text" id="input__phone"  class="field-style field-split align-right" name="phone" placeholder="Số điện thoại">
                        </li>
                        
                        <li>
                            <input id="input__addresDetail" type="text" class="field-style field-full align-none" name="addresDetail" placeholder="Số nhà, Đường">
                        </li>
                        <li>
                            <input id="input__address" type="text" class="field-style field-full align-none" name="address" placeholder="Phường/Xã, Quận/Huyện, Tỉnh/Thành phố">
                        </li>
                    </ul>
                </form>
            </div>
            <div class="btn-address">
                <!-- <a href="#" class="btn-add">Thêm địa chỉ</a> -->
                <a href="#" id="btn-ht" onclick="addAddress();submitAddress()">Hoàn thành</a>    
            </div>
        </div>
    </div>
</div>  

<a href="#" class="scrollup" id="scroll-up"> 
    <i class='bx bx-up-arrow-alt scrollup__icon' ></i>
</a>

<!--=============== SWIPER JS ===============-->
<script src="assets/js/swiper-bundle.min.js"></script>

<!--=============== MAIN JS ===============-->

<script src="<c:url value ='/assets/js/main.js' />"></script>
<script src="<c:url value ='/assets/js/mgr_script.js' />"></script>
<script src="<c:url value ='/assets/js/user_script.js' />"></script>
		<script src="<c:url value = '/assets/js/toast.js' />"></script>
</body>
<script>

//format money
var elements = document.querySelectorAll("#price_format");
elements.forEach(function(element) {
	var price = parseInt(element.textContent);
	var formattedPrice = price.toLocaleString('vi-VN', {
		style : 'decimal',
		minimumFractionDigits : 0
	}) + " VND";
	element.textContent = formattedPrice;
});
//submit form checkout 
function submitForm_checkout() {
	var form = document.createElement("form");

	// add inputs from form-checkout
	var checkoutForm = document.getElementById("form-checkout").getElementsByTagName("form")[0];
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
	
	detailForm = document.getElementById("form-detail").getElementsByTagName("form")[0];
	for (var i = 0; i < detailForm.length; i++) {
		if (detailForm.elements[i].type === "hidden") {
			var input = document.createElement("input");
			input.type = "hidden";
			if (detailForm.elements[i].name === "id_detail[]") {
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
	form.action = "<c:url value='/account/cart/checkout.htm' />";
	document.body.appendChild(form);
	form.submit();
	}
	
function submitAddress() {
    // Lấy tham chiếu đến form
    var form = document.querySelector('.form-input');
    
    // Submit form
    form.submit();
  }
  
// Lắng nghe sự kiện click trên nút xóa
function submitFormDelete(addressId) {
    var form = document.querySelector('#form-delete');
    form.action = "/WATCHSHOP/account/address/delete.htm";
    form.method = "POST";

    var input = document.createElement("input");
    input.setAttribute("type", "hidden");
    input.setAttribute("name", "idAddress");
    input.setAttribute("value", addressId);

    form.appendChild(input);
    form.submit();
}


document.addEventListener("DOMContentLoaded", function() {
    //Kiểm tra đăng ký
    <%if (request.getAttribute("message") != null && request.getAttribute("message").equals(1)) {%>
	createToast('success', 'Thành công!');
	<%} else if (request.getAttribute("message") != null && request.getAttribute("message").equals(2)) {%>
	createToast('error','Thất bại!');
	<%}%>
	})
	</script>

</html>