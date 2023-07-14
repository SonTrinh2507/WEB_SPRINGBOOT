
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Tổng hợp truyện tiên hiệp</title>
<meta name="viewport"
	content="width=device-width,minimum-scale=1,initial-scale=1">
<link rel="stylesheet" href="/assets/css/category.css">
<script src="/assets/js/category.js"></script>

</head>
<body id="body_cat">

	<div id="wrap">
		<div class="navbar navbar-default navbar-static-top" role="navigation"
			id="nav">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">Hiện menu</span><span class="icon-bar"></span><span
							class="icon-bar"></span><span class="icon-bar"></span>
					</button>
					<h1>
						<a class="header-logo" href="http://localhost:8888/home"
							title="doc truyen">doc truyen</a>
					</h1>
				</div>
				<div class="navbar-collapse collapse" itemscope
					itemtype="https://schema.org/WebSite">
					<meta itemprop="url" content="http://localhost:8888/home" />
					<ul class="control nav navbar-nav ">

						<li class="dropdown"><a href="javascript:void(0)"
							class="dropdown-toggle" data-toggle="dropdown"><span
								class="glyphicon glyphicon-list"></span> Thể loại <span
								class="caret"></span></a>
							<div class="dropdown-menu multi-column">
								<div class="row">
									<div class="col-md-4">
										<ul class="dropdown-menu">
											<c:forEach var="item" items="${categories}"
												varStatus="status">
												<c:if test="${status.index % 10 == 0 && status.index != 0}">
										</ul>
									</div>
									<div class="col-md-4">
										<ul class="dropdown-menu">
											</c:if>
											<li><a
												href="/category/${item.category_id }/${item.slug}"
												title="Truyện Tiên Hiệp">${item.category_name}</a></li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div></li>
						<li class="dropdown"><a href="javascript:void(0)"
							class="dropdown-toggle" data-toggle="dropdown"><span
								class="glyphicon glyphicon-list"></span> Phân loại theo Chương <span
								class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#" onclick="sendParameters(0, 100)">Dưới
										100 chương</a></li>
								<li><a href="#" onclick="sendParameters(100, 500)">100
										- 500 chương</a></li>
								<li><a href="#" onclick="sendParameters(500, 1000)">500
										- 1000 chương</a></li>
								<li><a href="#" onclick="sendParameters(1000, -1)">Trên
										1000 chương</a></li>

							</ul></li>

						<li class="dropdown"><a href="javascript:void(0)"
							class="dropdown-toggle" data-toggle="dropdown"><span
								class="glyphicon glyphicon-cog"></span> Tùy chỉnh <span
								class="caret"></span></a>
							<div class="dropdown-menu dropdown-menu-right settings">
								<form class="form-horizontal">
									<div class="form-group form-group-sm">
										<label class="col-sm-2 col-md-5 control-label"
											for="truyen-background">Màu nền</label>
										<div class="col-sm-5 col-md-7">
											<select class="form-control" id="truyen-background"><option
													value="#F4F4F4" selected>Xám nhạt</option>
												<option value="#232323">Màu tối</option></select>
										</div>
									</div>
								</form>
							</div></li>
					</ul>
					<form class="navbar-form navbar-right"
						action="https://truyenfull.vn/tim-kiem/" role="search"
						itemprop="potentialAction" itemscope
						itemtype="https://schema.org/SearchAction">
						<div class="input-group search-holder">
							<meta itemprop="target"
								content="https://truyenfull.vn/tim-kiem/?tukhoa={tukhoa}" />
							<input aria-label="Từ khóa tìm kiếm" role="search key"
								class="form-control" id="search-input" type="search"
								name="tukhoa" placeholder="Tìm kiếm..." value=""
								itemprop="query-input" required>
							<div class="input-group-btn">
								<button class="btn btn-default" type="submit"
									aria-label="Tìm kiếm" role="search">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</div>
						</div>
						<div class="list-group list-search-res hide"></div>
					</form>
				</div>
			</div>
			<div class="navbar-breadcrumb">
				<div class="container breadcrumb-container">Đọc truyện online,
					đọc truyện chữ, truyện full, truyện hay. Tổng hợp đầy đủ và cập
					nhật liên tục.</div>
			</div>
		</div>


		<div class="container" id="list-page">
			<div class="col-xs-12 col-sm-12 col-md-9 col-truyen-main">
				<div class="text-center"></div>
				<div class="list list-truyen col-xs-12">
					<div class="title-list">
						<h2>${category_name}</h2>
					</div>
					<c:forEach var="item" items="${stories }">
						<div class="row" itemscope itemtype="https://schema.org/Book">

							<div class="col-xs-3" style="width: 182px; height: 82px;">
								<div>
									<img src="/assets/img/${item.getStories().getStory_picture()}"
										class="cover"
										style="width: 100%; height: 82px; object-fit: cover;"></img>
								</div>
							</div>
							<div class="col-xs-7">
								<div>
									<span class="glyphicon glyphicon-book"></span>
									<h3 class="truyen-title" itemprop="name">
										<a
											href="/${item.getStories().getStory_code()}/${item.getStories().getSlug() }"
											title="${item.getStories().getStory_name() }" itemprop="url">${item.getStories().getStory_name() }</a>
									</h3>
									<span class="label-title label-new"></span><span class="author"
										itemprop="author"><span
										class="glyphicon glyphicon-pencil"></span>${item.getStories().getAuthor_name()}</span>
								</div>
							</div>
							<div class="col-xs-2 text-info">

								<div>
									<a
										href="/detail-story/${item.getStories().getStory_code() }/${item.getStories().getSlug() }/chuong-1"
										title="${item.getStories().getStory_name() }"> <span
										class="chapter-text"><span>Chương </span></span>${item.getStories().getTotal_chapter()}</a>
								</div>

							</div>
						</div>
					</c:forEach>
				</div>
				<div class="text-center pagination-container">
					<ul class="pagination pagination-sm">
				<c:forEach var="item" items="${categories}" begin="0" end="0">
						<c:if test="${totalPages > 1}">
							<c:set var="maxPages" value="5" />
							<!-- Số trang tối đa hiển thị -->
							<c:set var="startPage" value="${currentPage - maxPages / 2}" />
							<!-- Trang bắt đầu hiển thị -->
							<c:set var="endPage" value="${currentPage + maxPages / 2}" />
							<!-- Trang kết thúc hiển thị -->

							<!-- Giới hạn trang bắt đầu và kết thúc -->
							<c:if test="${startPage < 1}">
								<c:set var="startPage" value="1" />
							</c:if>
							<c:if test="${endPage > totalPages}">
								<c:set var="endPage" value="${totalPages}" />
							</c:if>

							<!-- Nút trang trước -->
							<c:if test="${currentPage > 1}">
								<li><a href="/category/${item.category_id}/${item.slug }?page=${currentPage - 1}">&laquo;</a></li>
							</c:if>

							<!-- Các nút trang -->
							<c:forEach var="page" begin="${startPage}" end="${endPage}">
								<c:choose>
									<c:when test="${page == currentPage}">
										<li class="active"><span>${page}<span
												class="sr-only">(đang xem)</span></span></li>
									</c:when>
									<c:otherwise>
										<li><a href="/category/${item.category_id}/${item.slug }?page=${page}">${page}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<!-- Nút trang tiếp theo -->
							<c:if test="${currentPage < totalPages}">
								<li><a href="/category/${item.category_id}/${item.slug }?page=${currentPage + 1}">&raquo;</a></li>
							</c:if>
						</c:if>
					</c:forEach>
						
					</ul>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-3 col-truyen-side">
				<div class="visible-md-block visible-lg-block text-center">

					<div class="list list-truyen list-cat col-xs-12">
						<div class="title-list">
							<h4>Thể loại truyện</h4>
						</div>
						<div class="row">
							<c:forEach var="item" items="${categories }">
								<div class="col-xs-6">
									<a href="/category/${item.category_id}/${item.slug }"
										title="Truyện Khác">${item.category_name }</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>

			</div>


		</div>

	</div>
	<script src="/assets/js/function.js"></script>
</body>
</html>