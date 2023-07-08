
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet"
	href="<c:url value = '/assets/css/manager.css' />">
<link rel="stylesheet" href="<c:url value = '/assets/css/styles.css' />">
<link rel="stylesheet"
	href="<c:url value = '/assets/css/swiper-bundle.min.css' />">


<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	type="text/javascript"></script>

<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css'
	rel='stylesheet'>
<script src="<c:url value = '/include/js/jquery.twbsPagination.js' />"
	type="text/javascript"></script>
<!--=============== SWIPER CSS ===============-->
<link rel="stylesheet" href="../assets/css/swiper-bundle.min.css">

<title>Admin</title>
<!-- JS -->


</head>
<body>
	<!-- HEADER -->
	<header class="header" id="header">
        <nav class="nav container">
            <a href="<c:url value = '/home.htm' />" class="nav__logo">
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
                        <a href="<c:url value = '/product.htm' />" class="nav__link">Products</a>
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
                    <a href="<c:url value = '/admin/info.htm' />"><i class='bx bx-user'></i></a>
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
            <a href="<c:url value = '/admin/statistics.htm' />" class="active">
                <i class='bx bx-bar-chart-alt'></i>
                <span class="text">Thống kê</span>
            </a>
        </li>
        <li>
            <a href="<c:url value = '/admin/watch.htm' />">
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
        <li >
            <a href="<c:url value = '/admin/brand-category.htm' />">
                <i class='bx bxs-component'></i>
                <span class="text">Hãng/Loại đồng hồ</span>
            </a>
        </li>
        <li>
            <a href="<c:url value = '/admin/discount.htm' />">
                <i class='bx bxs-city'></i>
                <span class="text">Khuyến mãi</span>
            </a>
        </li>
        <li class="active">
            <a href="<c:url value = '/admin/warranty.htm' />">
                <i class='bx bxs-city'></i>
                <span class="text">Bảo hành</span>
            </a>
        </li>

        <li>	
            <a href="<c:url value = '/login.htm' />" class="logout">
                <i class='bx bxs-log-out-circle' ></i>
                <span class="text">Đăng xuất</span>
            </a>
        </li>
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
			<div id=#main__bh>
				<div class="head-title">
					<div class="left">
						<h1>Bảo hành</h1>
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
				<div class="dialog" id="confirmDialog_">
					<div class="dialog-content">
						<h2>Xác nhận xóa</h2>
						<p>Bạn có chắc chắn muốn xóa bảo hành</p>
						<output id="id_"></output>
						<div class="dialog-buttons">
							<button id="confirmBtn">Đồng ý</button>
							<button id="cancelBtn">Hủy bỏ</button>
						</div>
					</div>
				</div>
				<div class="table-data">
					<div class="order">
						<div class="head">
							<h3>Danh sách bảo hành</h3>
							<form action="" id="search-bar" class="search">
								<input type="search" placeholder="Type something..."
									class="search__input"> <a href="#"><i
									class='bx bx-search'></i></a>
							</form>
							<!-- <a href="#"><i class="lni lni-circle-plus"></i></a> -->
						</div>
						<table>
							<thead>
								<tr>
									<th>ID bảo hành</th>
									<th>Ngày bắt đầu</th>
									<th>Ngày kết thúc</th>
									<th>ID sản phẩm</th>
									<th>ID order</th>
									<th>Chỉnh sửa</th>
								</tr>
							</thead>
							<c:forEach var="item" items="${warranty}">
								<tbody>
									<tr>
										<td><p>${item.warranty_id }</p></td>
										<td><p>${item.start_day }</p></td>
										<td><p>${item.end_day }</p></td>
										<td><p>${item.watch_id }</p></td>
										<td><p>${item.getOrder_detail().getOrder_id()}</p></td>
										<td class="btn"><a class="btn__chitiet" href="#detail"
											onclick="getIdDDH(this);loadDetailWarranty('${item.warranty_id}')"><i class='bx bx-detail'></i></a> <a
											class="btn__xoa" href="#delete"><i class='bx bxs-trash'></i></a>
										</td>
									</tr>

								</tbody>
							</c:forEach>
						</table>

					</div>
					
				</div>
				
			</div>
			<form action="<c:url value = '/admin/warranty.htm' />" id="form_page">
				<input type="hidden" value="1" id="page_input" name="page">
				<input type="hidden" value="${orderpage}" name="order"> <input
					type="hidden" value="${dirpage}" name="dir">
			</form>
			<div style="margin-top: 10px; justify-content: center; align-items: center;">
					<div style = "margin: 10px 45%;">Số lượng: ${count}</div>
					<div aria-label="Page navigation" id="nav__page" style="justify-content: center; margin: 0 25%;	">
						<ul class="pagination" id="pagination" style="margin: 0 20px;"></ul>
					</div>
			</div>
		</main>

		<div class="detail" id="detail">
			<div class="detail-content">
				<div class="table-data " id="dl-ddh">
					<div class="order">
						<span class="close_chitiet" onclick="closeDetail()">&times;</span>
						<div class="head">
							<h3 style="font-size: medium; margin-right: 0;">Chi tiết bảo
								hành:</h3>
							<h3 style="float: left; font-size: medium;" id="id_ddh"></h3>
							<form action="" id="search-bar" class="search">
								<input type="search" placeholder="Type something..."
									class="search__input"> <a href="#"><i
									class='bx bx-search'></i></a>
							</form>
						</div>
						<table>
							<thead>
								<tr>
									<th>Ngày bảo hành</th>
									<th>Nhân viên bảo hành</th>
									<th>Lý do bảo hành</th>
								</tr>
							</thead>
							<tbody id="warrantyTableBody">
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- CONTENT -->

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
	
	
	var warranty_arr = [
  		<c:forEach var = "item" items = "${warranty_detail}">
  		
  		    {	warranty_id: '${item.warranty_id}',
  		    	user_id: '${item.getUser().getStaff().getStaff_name()}',
  		    	status: '${item.status}',
  		    	
  		    
  		    },
  		    </c:forEach>  
  		];
	
	
	
	function loadDetailWarranty(warranty_id) {
			  // Lọc các order detail có order_id tương ứng
			  var filteredOrderDetail = warranty_arr.filter(function(item) {
			    return item.warranty_id === warranty_id;
			  });

			  // Tạo các hàng mới trong tbody của bảng
			  var tableBody = document.querySelector('#dl-ddh table tbody');
			  tableBody.innerHTML = '';
				var sum = 0;
			  for (var i = 0; i < filteredOrderDetail.length; i++) {
				  sum ++;
			    var row = document.createElement('tr');
			    var warranty_id = document.createElement('td');
			    warranty_id.textContent = sum;
			   
			    var user_id = document.createElement('td');
			    user_id.textContent = filteredOrderDetail[i].user_id;
			  
			    var status = document.createElement('td');
			    status.textContent = filteredOrderDetail[i].status;
			    row.appendChild(warranty_id);
			    row.appendChild(user_id);
			    row.appendChild(status);
			    tableBody.appendChild(row);
			  }
			}
		
	</script>
</body>
</html>