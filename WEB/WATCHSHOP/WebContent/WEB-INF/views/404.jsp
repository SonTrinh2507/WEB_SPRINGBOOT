<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix = 'c' %>
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang không tồn tại</title>
    <link rel="stylesheet" href="<c:url value ='/assets/css/styles.css' />" />
    <link rel="stylesheet" href="<c:url value ='/include/css/style.css' />">
    <link rel="stylesheet" href="<c:url value ='/include/css/sach_info.css' />">
    <link rel="stylesheet" href="<c:url value ='/include/css/category.css' />">
    <link rel="stylesheet" href="<c:url value ='/include/css/signup.css' />">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" href="<c:url value ='/images/favico.png' />" sizes="32x32" />
</head>
<body>
    <!-- Navigation Header-->
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
    
    <!-- sigup -->
    <div class="flex_center signup bg-white">
        <div class="_1200px flex_center signup_container">
            <div class="signup_container_left">
                <h2 style = "padding: 30px 15px;color: #0166d6; font-size: 45px;">TRANG YÊU CẦU KHÔNG TỒN TẠI</h2>
            </div>
            <div class="signup_container_right">
                
            </div>
        </div>
    </div>
</body>
</html>