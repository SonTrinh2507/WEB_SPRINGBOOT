<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>CATEGORY ADMIN</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />

<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet" />

<link rel="stylesheet" href="<c:url value = '/include/css/toast.css' />" />
<link rel="stylesheet" href="<c:url value = '/include/css/app.css' />" />
	<link rel="stylesheet" href="<c:url value = '/include/css/admin/category_admin.css' />" />
<link rel="icon" href="<c:url value = '/images/favico.png' />"
	sizes="32x32" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="<c:url value = '/include/js/jquery.twbsPagination.js' />"
	type="text/javascript"></script>

<!-- Boxicons -->
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css'
	rel='stylesheet'>
<!-- My CSS -->
<link rel="stylesheet"
	href="<c:url value = '/assets/css/manager.css' />" />
<link rel="stylesheet" href="<c:url value = '/assets/css/styles.css' />" />
<link rel="stylesheet"
	href="<c:url value = '/assets/css/swiper-bundle.min.css' />" />
</head>

<body>
<header class="header" id="header">
		<nav class="nav container">
			<a href="../home.htm" class="nav__logo"> <i
				class='bx bxs-watch nav__logo-icon'></i> T3S WATCH
			</a>

			<div class="nav__menu" id="nav-menu">
				<ul class="nav__list">
					<li class="nav__item"><a href="../home.htm"
						class="nav__link active-link">Home</a></li>
					<li class="nav__item"><a href="#featured" class="nav__link">Featured</a>
					</li>
					<li class="nav__item"><a href="#new" class="nav__link">New</a>
					</li>
					<li class="nav__item"><a href="#brands" class="nav__link">
							Brands <i class='bx bx-chevron-down'></i>
					</a>
						<ul class="nav__drop">
							<c:forEach var="i" items="${brands }">
								<li><a class="nav__link"
									href="brand/${i.getBrand_id()}.htm">${i.getBrand_name()}</a></li>
							</c:forEach>
						</ul></li>
					<li class="nav__item"><a href="#Categorys" class="nav__link">Categorys<i
							class='bx bx-chevron-down'></i></a>
						<ul class="nav__drop">
							<c:forEach var="i" items="${categories}">
								<li><a class="nav__link"
									href="category/${i.getCategory_id()}.htm">${i.getCategory_name()}</a></li>
							</c:forEach>
						</ul></li>


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
					<a href="<c:url value = '/admin/statistics.htm' />"><i
						class='bx bx-user'></i></a>
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
			<li >
				<a href="<c:url value = '/admin/statistics.htm' />">
					<i class='bx bx-bar-chart-alt'></i>
					<span class="text">Thống kê</span>
				</a>
			</li>
			<li>
				<a href="../admin/watch.htm">
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
			<li>
				<a href="<c:url value = '/admin/brand.htm' />">
					<i class='bx bxs-component'></i>
					<span class="text">Hãng đồng hồ</span>
				</a>
			</li>
			<li class = "active">
				<a href="<c:url value = '/admin/category.htm' />">
					<i class='bx bx-dialpad-alt ' ></i>
					<span class="text">Loại đồng hồ</span>
				</a>
			</li>
			<li>
				<a href="<c:url value = '/admin/supplier.htm' />">
					<i class='bx bxs-city'></i>
					<span class="text">Nhà cung cấp</span>
				</a>
			</li>

			<li>	
				<a href="<c:url value = '/logout.htm' />" class="logout">
					<i class='bx bxs-log-out-circle' ></i>
					<span class="text">Đăng xuất</span>
				</a>
			</li>
		</ul>
		</section>
	
	<!-- SIDEBAR -->
	<div class="background_black" id="background_black">
			<!-- Xu cac button confirm -->
			<form action="<c:url value = '/admin/category/delete.htm' />"
				method="post" class="confirm_container remove_class bg-white">
				<input type="hidden" id="input_id_delete" name=idCategory value="1">
				<div class="confirm_header text-white bg-primary"
					style="padding: 10px; font-weight: 700">
					<i class="fas fa-check-circle" style="color: #47f764"></i> Thông
					báo
				</div>
				<div class="confirm_content"
					style="padding: 10px; text-align: center">
					Bạn chắc chắn muốn xóa tác giả có id: <b>2</b> <b
						class="ten_can_xoa">Nguyễn Đức Ngọc</b>
				</div>
				<div class="confirm_buttons">
					<button class="btn btn-success me-1 mb-2 btn_xacnhan"
						style="margin: 0px 10px" type="submit">Xác Nhận</button>
					<button class="btn btn-danger me-1 mb-2 btn_huy_cancel"
						style="margin: 0px 10px" type="button">Hủy</button>
				</div>
			</form>
		</div>
		<div class="toast_class"></div>
<section id="content">

			<nav>

				<a href="#" class="nav-link"><i class='bx bx-menu'></i></a> <a
					href="#" class="btn-download"> <i class='bx bxs-cloud-download'></i>
					<span class="text">Download PDF</span>
				</a>
			</nav>
			<main id=main__hdh>
				<div class="head-title">
					<div class="left">
						<h1>Hãng đồng hồ</h1>
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
				<div class="table-data">
					<div class="order">
						<div class="head">
							<h3>Danh sách hãng đồng hồ</h3>
								<form action="" class="search" id="search-bar">
								<input type="search" name="keyword" id="keyword"
									placeholder="Type something..." class="search__input">
								<button type="submit">
									<i class='bx bx-search'></i>

								</button>
							</form>
							<!-- <a href="#"><i class='bx bx-search'></i></a> <a href="#"><i
								class='bx bx-filter'></i></a> -->
							<div style="display: flex;">
								<button id="info" class="btn btn-success btn_add">
									<i class="fas fa-plus"></i> <span>Thêm Hãng</span>
								</button>
								<div class="form_add display_none" style="margin-left: 20px;">
									<form action="<c:url value = '/admin/category/add.htm' />"
										method="post" style="display: flex;">
										<input class="form-control" name="nameCategory" type="text"
											value="" id="input_add_author"
											placeholder="VD: Nguyễn Đức Ngọc">
										<button id="btn_add_submit" style="margin-left: 5px;"
											type="submit" class="btn btn-success btn_add_submit">Thêm</button>
									</form>
								</div>

							</div>

						</div>
						<table>
							<thead>
								<tr>
									<th><a
										href="<c:url value = '/admin/brand.htm?page=${currentpage}&order=id&dir=${orderLink}' />">ID</a></th>
									<th style="width: 65%;"><a
										href="<c:url value = '/admin/brand.htm?page=${currentpage}&order=name&dir=${orderLink}' />">Tên
											loại</a></th>
									<th>Chỉnh sửa</th>
								</tr>


							</thead>
							<tbody>
								<c:forEach var="item" items="${categories}">
									<tr>
										<td>${item.category_id}</td>
										<td><span class="ten_hien_thi">${item.category_name}</span>
											<div class="form_chinh_sua display_none">
												<form action="<c:url value = '/admin/category/edit.htm' />"
													method="post" style="display: flex;">
													<input type="hidden" name="idCategory"
														value="${item.category_id}"> <input
														class="class_input_edit" name="nameCategory" type="text"
														value="${item.category_name}" />
													<button style="margin-left: 10px;" type="submit"
														class="btn btn-success btn_edit_submit">Sửa</button>
												</form>
											</div></td>
										<td class="align-middle text-center">
											<button type="button" class="btn btn-warning m-1 btn_edit">
												<i class="far fa-edit"></i>
											</button>
											  <button
                                    type="button"
                                    class="btn btn-danger btn_delete"
                                  >
                                  <input type="hidden" name="idCategory" value="${item.category_id}" tentheloai = "${item.category_name}">
                                    <i
                                      style="color: white"
                                      class="fa fa-trash-alt"
                                    ></i>
                                  </button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="container"
							style="margin-top: 10px; display: flex; justify-content: center; align-items: center;">
							<div>Số lượng: ${count}</div>
							<nav aria-label="Page navigation">
								<ul class="pagination" id="pagination" style="margin: 0 20px;"></ul>
							</nav>
						</div>
					</div>

				</div>
			</main>

		</section>
	</div>
	<form action="<c:url value = '/admin/category.htm' />" id="form_page">
		<input type="hidden" value="1" id="page_input" name="page"> <input
			type="hidden" value="${orderpage}" name="order"> <input
			type="hidden" value="${dirpage}" name="dir">
	</form>


	<script type="text/javascript">
      	var form_page = document.querySelector("#form_page");
      	var page_input = document.querySelector("#page_input");
      	console.log(form_page);
      	var currentpage = ${currentpage};
      	var pagesize = ${pagesize};
		var maxpage = ${maxpage};
    	$(function () {
        window.pagObj = $('#pagination').twbsPagination({
        	totalPages: maxpage,
            visiblePages: pagesize,
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
    	
    	// AJAX
    	
			    	function createToastHTML(message, type, color, icon){ //#47f764
			    		var toast_class = document.querySelector(".toast_class");
			    		var div = document.createElement("div");
			    		var html = "<div class = 'toast_to_left' style='position:relative; height: 90px;margin-bottom: 10px;'>"+
				    	    "<div class='toast_container' style = 'border-left: 8px solid "+color+" !important;'>"+
				            "<i class='"+icon+" toast_icon' style = 'color: "+color+" !important;'></i>"+
				            "<div class='toast_content'>"+
				              "<span style='font-weight: 700; color: "+color+";'>"+type+"</span>"+
				              "<span class='toast_content_name' style='color: #656565'>"+message+"</span>"+
				           " </div>"+
				            "<div>"+
				              "<i class='fa fa-times toast_close' style='font-size: 20px; cursor: pointer; color: #656565'aria-hidden='true'></i>"+
				            "</div></div></div>";
				            div.innerHTML = html;
			            toast_class.appendChild(div);
				  		var toast_noi_dung = div.querySelector(".toast_content_name");
				  	    var toast_container = div.querySelector(".toast_container");
				  	    
			  			setTimeout(() => {
			  			    toast_container.classList.remove("toast_to_left");
			  			    toast_container.classList.add("toast_to_right");
			  			}, 2000);
			  			
			  			setTimeout(() => {
			  			    div.remove();
			  			}, 3000);
			
						  	var toast_close = div.querySelector(".toast_close");
						  	console.log(toast_close);
						  	toast_close.addEventListener("click", () => {
						    	div.remove();
						  	});
			    	}	
    	
		    		var btn_edit = document.querySelectorAll(".btn_edit");
		    		var remove_class = document.querySelector(".remove_class");
		    		var background_black = document.querySelector("#background_black");
		    		var btn_huy_cancel = document.querySelector(".btn_huy_cancel");
		    		var btn_xacnhan = document.querySelector(".btn_xacnhan");
				    var form_chinh_sua = document.querySelectorAll(".form_chinh_sua");
				    var input_form_control = document.querySelectorAll(".class_input_edit");
				    var btn_delete = document.querySelectorAll(".btn_delete");
				    var confirm_content = document.querySelector(".confirm_content");
				  
				  input_form_control.forEach((element) => {
					  element.addEventListener('change', (e) => {
						  element.setAttribute("value", e.target.value);
						  console.log(element);
					  })
				  })
		  
				  btn_edit.forEach(element => {
				    element.addEventListener("click", () => {
				        var icon = element.children[0];
				        console.log("CLICK");
				        var get_parent_element = element.parentElement.parentElement;
				        var ten_hien_thi = get_parent_element.querySelector(".ten_hien_thi");
				        var form_chinh_sua = get_parent_element.querySelector(".form_chinh_sua");
				        ten_hien_thi.classList.toggle("display_none");
				        form_chinh_sua.classList.toggle("display_block");
				        if (icon.className ==="far fa-times-circle"){
				            icon.className = "far fa-edit";
				            element.className = "btn btn-warning m-1 btn_edit";
				        }
				        else{
				            icon.className = "far fa-times-circle";
				            element.className = "btn btn-info m-1 btn_edit";
				        }
				    });
				});
		
		  
				btn_delete.forEach(element => {
				    element.addEventListener("click", () => {
				    	console.log(element.children[0]);
				    	var id_delete = element.children[0].getAttribute("value");
				        var ten_theloai = element.children[0].getAttribute("tentheloai");
				        $("#input_id_delete").val(id_delete);
				        confirm_content.innerHTML = "Bạn chắc chắn muốn xóa thể loại có ID = "+id_delete+ " <p><b>"+ten_theloai+"</b></p>";
				        background_black.style.display = "block";
				        remove_class.style.display = "block";
				    	})
			    })
			

				btn_huy_cancel.addEventListener("click", () => {
				    background_black.style.display = "none";
				    remove_class.style.display = "none";
				})
		
		    // ADD
    
    			var btn_add = document.querySelector(".btn_add");
					var form_add = document.querySelector(".form_add");
					btn_add.addEventListener("click", () => {
					  var fa_classname = btn_add.children[0];
					  var text_add = btn_add.children[1];
					  if (fa_classname.className === "fas fa-plus") {
					    fa_classname.className = "far fa-times-circle";
					    btn_add.className = "btn btn-danger btn_add";
					    text_add.innerHTML = "Thoát";
					  } else {
					    fa_classname.className = "fas fa-plus";
					    btn_add.className = "btn btn-success btn_add";
					    text_add.innerHTML = "Thêm tác giả";
					  }
					  form_add.classList.toggle("display_none");
					})
					
					var input_add = document.querySelector("#input_add");
					input_add.addEventListener("change", (e) => {
						input_add.setAttribute("value", e.target.value);
					})
					
				  // AJAX
			    	var result = '${add_result}';
			    	if(result != ""){
			    		if(result == '-1'){ // < 2 ky tu
				    		// Toast thất bại
					  		createToastHTML("Tên thể loại phải từ 2 ký tự trở lên", "ERROR", "#DC3545", "fas fa-exclamation-triangle");
				    	}else if(result == '0'){ // == 0 sai order_old
				    		// Toast thất bại
					  		createToastHTML("Tên thể loại đã tồn tại trên hệ thống.", "ERROR", "#DC3545", "fas fa-exclamation-triangle");
				    	}else if(result == '1'){
				    		// Toast thành công
					  		createToastHTML("Thêm thể loại thành công.", "SUCCESS", "#47f764", "fas fa-check-circle");
				    	}else if(result == '2'){
				    		// Toast thất bại
					  		createToastHTML("Thêm thể loại thất bại.", "ERROR", "#DC3545", "fas fa-exclamation-triangle");
				    	}
			    	}
				    	
			    	var result = '${edit_result}';
			    	if(result != ""){
			    		if(result == '-1'){ // < 2 ky tu
				    		// Toast thất bại
					  		createToastHTML("Tên thể loại phải từ 2 ký tự trở lên", "ERROR", "#DC3545", "fas fa-exclamation-triangle");
				    	}else if(result == '0'){ // == 0 sai order_old
				    		// Toast thất bại
					  		createToastHTML("Tên thể loại đã tồn tại trên hệ thống.", "ERROR", "#DC3545", "fas fa-exclamation-triangle");
				    	}else if(result == '1'){
				    		// Toast thành công
					  		createToastHTML("Chỉnh sửa tên thể loại thành công.", "SUCCESS", "#47f764", "fas fa-check-circle");
				    	}else if(result == '2'){
				    		// Toast thất bại
					  		createToastHTML("Chỉnh sửa tên thể loại thất bại.", "ERROR", "#DC3545", "fas fa-exclamation-triangle");
				    	}
			    	}
				    	
			    	var result = '${delete_result}';
			    	if(result != ""){
				    	if(result == '0'){ // == 0 sai order_old
				    		// Toast thất bại
					  		createToastHTML("Thể loại này đã có sách trên hệ thống.", "ERROR", "#DC3545", "fas fa-exclamation-triangle");
				    	}else if(result == '1'){
				    		// Toast thành công
					  		createToastHTML("Xóa thể loại thành công.", "SUCCESS", "#47f764", "fas fa-check-circle");
				    	}else if(result == '2'){
				    		// Toast thất bại
					  		createToastHTML("Xóa thể loại thất bại.", "ERROR", "#DC3545", "fas fa-exclamation-triangle");
				    	}
			    	}
			    	
			    	// COOKIE
			        document.documentElement.scrollTop = getCookie("ScrollY");

			         window.addEventListener("scroll", () => {
			            var x = pageYOffset;
			            document.cookie = "ScrollY="+x;
			         });

			         function getCookie(cname) {
			            let name = cname + "=";
			            let decodedCookie = decodeURIComponent(document.cookie);
			            let ca = decodedCookie.split(';');
			            for(let i = 0; i <ca.length; i++) {
			                let c = ca[i];
			                while (c.charAt(0) == ' ') {
			                c = c.substring(1);
			                }
			                if (c.indexOf(name) == 0) {
			                return c.substring(name.length, c.length);
			                }
			            }
			            return "";
			        }
			         
</script>

	<script type="text/javascript"
		src="<c:url value = '/include/js/admin/category_admin.js' />"></script>
</body>
</html>
