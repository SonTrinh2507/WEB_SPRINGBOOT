<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" /> -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css'
	rel='stylesheet'>
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
			<link rel="stylesheet" href="<c:url value = '/assets/css/toast.css' />" />
<link rel="stylesheet"
	href="<c:url value = '/assets/css/manager.css' />" />
<link rel="stylesheet" href="<c:url value = '/assets/css/styles.css' />" />
<link rel="stylesheet"
	href="<c:url value = '/assets/css/swiper-bundle.min.css' />" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="<c:url value = '/include/js/jquery.twbsPagination.js' />"
	type="text/javascript"></script>
<link href="https://cdn.lineicons.com/4.0/lineicons.css"
	rel="stylesheet" />
<style>
    .hidden {
        display: none;
    }
</style>
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
<ul class="notifications"></ul> 
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
        <li class="active">
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
        <li >
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
			<div id="main__custumer">
				<div class="head-title">
					<div class="left">
						<h1>Khách hàng</h1>
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
						<p>Bạn có chắc chắn muốn xóa thông tin khách hàng</p>
						<output id="id_"></output>

						<div class="dialog-buttons">
							<form  id = "deleteForm"action="<c:url value = '/admin/customer/delete.htm' /> "
								method="post">
								 <input
								type="hidden" name="customerid" value="" id =  "userid">
								<button id="confirmBtn" type = "submit">Đồng ý</button>

							</form>
							<button id="confirmBtn1">Đồng ý</button>
							<button id="cancelBtn">Hủy bỏ</button>
						</div>
					</div>
				</div>
				<div class="table-data">
					<div class="order">
						<div class="head">
							<h3>Danh sách khách hàng</h3>
							<form action="" class="search" id="search-bar">
								<input type="search" name="keyword" id="keyword"
									placeholder="Type something..." class="search__input">
								<button type="submit">
									<i class='bx bx-search'></i>

								</button>
							</form>
							<a href="#" onclick="openDetail_ad()" id="openDetailLink"
								class="${sudung ? '' : 'hidden'}"> <i
								class="lni lni-circle-plus"></i>
							</a>
						</div>
						<table>
							<thead>
								<tr>
									<th>ID</th>
									<th>Họ Tên</th>
									<th>Giới tính</th>
									<th>Ngày sinh</th>
									<th>Địa chỉ</th>									
									<th>Số điện thoại</th>
									<th>UserID</th>
									<th>Chỉnh Sửa</th>
								</tr>
							</thead>
							<c:forEach var="item" items="${customer}">
								<tbody>
									<tr>
										<td>
											<p>${item.customer_id}</p>
										</td>
										<td>${item.customer_name}</td>
										<td><p>${item.gender}</p> </t>
										<td><p>${item.birthday}</p></td>
										<td><p>${item.address}</p> </t>
										<td><p>${item.getUsers().getPhone()}</p> </t>
										<td><p>${item.user_id}</p></td>
										<!-- <td class="btn"><a class="btn__sua" href="#change"
											onclick="getDetailInfo()"><i class='bx bx-edit-alt'></i></a>

											<a class="btn__xoa" href="#delete" onclick="setInputValue()"><i
												class='bx bxs-trash'></i></a></td> -->
										<td class="btn">
											<!-- <a class ="btn__chitiet" href="#detail"><i class='bx bx-detail' ></i></a> -->
											<a class="btn__chitiet" href="#change"
											onclick="getDetailInfoAcc();loadCustomerEdit('${item.user_id}')">
												<input type="hidden" name="user_id" value="${item.user_id}"><i
												class='bx bx-detail'></i>
										</a> 
										</td>
										<!-- <td><span class="status completed">Completed</span></td> -->
									</tr>
								</tbody>
							</c:forEach>
						</table>



					</div>
				</div>
					<div style="margin-top: 10px; justify-content: center; align-items: center;">
					<div style = "margin: 10px 45%;">Số lượng: ${count}</div>
					<div aria-label="Page navigation" id="nav__page" style="justify-content: center; margin: 0 25%;	">
						<ul class="pagination" id="pagination" style="margin: 0 20px;"></ul>
					</div>
			</div>
			</div>
			
		</main>

		<div class="detail" id="detail">
			<div class="detail-content">
				<div class="cutumer__account">
					<span class="close_chitiet" onclick="closeDetail()">&times;</span>
					<form class="form-input"
						action="<c:url value ='/admin/customer/add.htm' />" method="post">
						<ul id="myList">
							<li><input readonly type="hidden" id="input__userID" name="user_id" value = ""
								class="field-style field-full align-none"
								placeholder="User ID"></li>
							<li><input readonly type="text" id="input__userName" name="username"
								class="field-style field-full align-none"
								placeholder="Tên đăng nhập"></li>
						
							<li><select type="text" id="input__status"
								class="field-style field-split align-left" name="status">
									<option value="-1">Tình trạng</option>
									<option value="0">Active</option>
									<option value="1">Unactive</option>
							</select>  <select type="text" id="input__roleID"
								class="field-style field-split align-right" name="role_id">
									<option value="-1">Đối tượng đăng nhập</option>
									<option value="3">Customer</option>
							</select></li>
							<li><input readonly id="input__email" type="text"
								class="field-style field-full align-none" name="email"
								placeholder="Email"></li>
							<li><input readonly id="input__phone" type="text"
								class="field-style field-full align-none"
								placeholder="Số điện thoại" name="phone"></li>

							<li><input type="submit" value="Save" /></li>

						</ul>
					</form>
						
				</div>
			</div>
		</div>
	</section>

	<form action="<c:url value = '/admin/customer.htm' />" id="form_page">
		<input type="hidden" value="1" id="page_input" name="page"> <input
			type="hidden" value="${orderpage}" name="order"> <input
			type="hidden" value="${dirpage}" name="dir">
	</form>

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
    var form_search_submit = document.querySelector("#form_search_submit");
    console.log(form_search_submit);
    var form_page = document.querySelector("#form_page");
  	var page_input = document.querySelector("#page_input");
  	console.log(form_page);
  	var currentpage = ${currentpage};
  	
		var maxpage = ${maxpage};
	$(function () {
    window.pagObj = $('#pagination').twbsPagination({
    	totalPages: maxpage,
        visiblePages: 10,
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

  	//arr user
	var user_arr = [
  		<c:forEach var = "item" items = "${users}">
  		    {user_id : '${item.user_id}',  
  		    	email: '${item.email}',  		     		    
  		    	username: '${item.username}',
  		    	role_id: '${item.role_id}',
  		    	status: '${item.status}',
  		    	
  		    
  		    },
  		    </c:forEach>  
  		];
  	
  	//gắn thẻ input bằng giá trị trong arr user
 	function loadCustomerEdit(id_edit){
  		for(var i = 0; i<user_arr.length; i++){
  			if(user_arr[i]["user_id"] === id_edit){
  				$("#input__email").val(user_arr[i]["email"]);
  				$("#input__userName").val(user_arr[i]["username"]); 		  				
 				$("#input__status").val(user_arr[i]["status"]);
  				$("#input__roleID").val(user_arr[i]["role_id"]);
  				
  				return;
  			}
  		}
  	}  	
  	
 	  var idOutput = document.getElementById("id_");
 	  var useridInput = document.getElementById("userid");
 	  var deleteForm = document.getElementById("deleteForm");

 	  // Gắn giá trị từ output "id_" vào input "userid" khi nút "Đồng ý" được nhấn
 	  deleteForm.addEventListener("submit", function(event) {
 	    event.preventDefault(); // Ngăn chặn việc submit form để chúng ta có thể thay đổi giá trị input trước khi submit

 	    var idValue = idOutput.textContent;
 	  useridInput.value = idValue;
	console.log(idValue);
	console.log(useridInput.value);
 	  deleteForm.submit(); // Submit form
 	  });
 	  
 		var sudung = <%= session.getAttribute("sudung") %>;
 	    if (sudung !== true) {
 	        // Nếu sudung khác true, thêm lớp hidden để ẩn liên kết
 	        document.getElementById("openDetailLink").classList.add("hidden");
 	        
 	    }
 	  
 	document.addEventListener("DOMContentLoaded", function() {

        //Kiểm tra khách hàng
        <%if (request.getAttribute("message") != null && request.getAttribute("message").equals(1)) {%>
	createToast('error', 'Thông tin không được để trống!');
	<%} else if (request.getAttribute("message") != null && request.getAttribute("message").equals(2)) {%>
	createToast('error','Username đã tồn tai!');
	<%}else if (request.getAttribute("message") != null && request.getAttribute("message").equals(3)) {%>
	createToast('error','Email đã tồn tại!');
	<%}else if (request.getAttribute("message") != null && request.getAttribute("message").equals(4)) {%>
	createToast('error','Số điện thoại đã tồn tại!');
	<%}else if (request.getAttribute("message") != null && request.getAttribute("message").equals(5)) {%>
	createToast('success','Thêm thành công!');
	<%}else if (request.getAttribute("message") != null && request.getAttribute("message").equals(6)) {%>
	createToast('success','Cập nhật thành công!');
	<%}else if (request.getAttribute("message") != null && request.getAttribute("message").equals(7)) {%>
	createToast('success','Xoá khách hàng thành công!');
	<%}else if (request.getAttribute("message") != null && request.getAttribute("message").equals(8)) {%>
	createToast('error','Xoá khách hàng thất bại!');
	<%}%>

    });
    
   

</script>
</body>
</html>