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
	<div id="ads-install-app"></div>
	<div id="wrap">
		<div class="navbar navbar-default navbar-static-top" role="navigation"
	id="nav">
	<script type="text/javascript">
		function getCookie(d) {
			d += "=";
			for (var b = decodeURIComponent(document.cookie).split(";"), c = [], a = 0; a < b.length; a++)
				0 == b[a].trim().indexOf(d) && (c = b[a].trim().split("="));
			return 0 < c.length ? c[1] : ""
		}
		var js_bgcolor = getCookie("bgcolor-cookie");
		"#232323" == js_bgcolor
				&& (document.getElementsByTagName("body")[0].className += " dark-theme");
	</script>
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
									<c:forEach var="item" items="${categories}" varStatus="status">
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
						<li><a onclick="sendParameters(0, 100)"						
							title="Dưới 100 chương">Dưới 100 chương</a></li>
						<li><a
							href="https://truyenfull.vn/top-truyen/100-500-chuong/"
							title="100 - 500 chương">100 - 500 chương</a></li>
						<li><a
							href="https://truyenfull.vn/top-truyen/500-1000-chuong/"
							title="500 - 1000 chương">500 - 1000 chương</a></li>
						<li><a
							href="https://truyenfull.vn/top-truyen/tren-1000-chuong/"
							title="Trên 1000 chương">Trên 1000 chương</a></li>
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
						class="form-control" id="search-input" type="search" name="tukhoa"
						placeholder="Tìm kiếm..." value="" itemprop="query-input" required>
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
			đọc truyện chữ, truyện full, truyện hay. Tổng hợp đầy đủ và cập nhật
			liên tục.</div>
	</div>
</div>
		<div class="container header-ads" id="header-ads"></div>
		<div class="header-ads-full" id="header-ads-full"></div>
		<div class="container" id="list-page">
			<div class="col-xs-12 col-sm-12 col-md-9 col-truyen-main">
				<div class="text-center"></div>
				<div class="list list-truyen col-xs-12">
					<div class="title-list">
						<h2>${category_name}</h2>						
					</div>
					<c:forEach var = "item" items = "${stories }">
					<div class="row" itemscope itemtype="https://schema.org/Book">
						
						<div class="col-xs-3">
							<div>
								<div
									data-image="/assets/img/anh-sach-800x451.jpg"
									data-desk-image="/assets/img/${item.getStories().getStory_picture() }"
									data-classname="cover" data-alt="${item.getStories().getStory_name() }"
									class="lazyimg"></div>
							</div>
						</div>
						<div class="col-xs-7">
							<div>
								<span class="glyphicon glyphicon-book"></span>
								<h3 class="truyen-title" itemprop="name">
									<a href="https://truyenfull.vn/ta-la-con-roi-vo-dich/"
										title="${item.getStories().getStory_name() }" itemprop="url">${item.getStories().getStory_name() }</a>
								</h3>
								<span class="label-title label-new"></span><span class="author"
									itemprop="author"><span
									class="glyphicon glyphicon-pencil"></span>${item.getStories().getAuthor().getAuthor_name() }</span>
							</div>
						</div>
						<div class="col-xs-2 text-info">
						
							<div>
								<a href="https://truyenfull.vn/ta-la-con-roi-vo-dich/chuong-46/"
									title="Ta Là Con Rối Vô Địch - Chương 46">
									<span
									class="chapter-text"><span>Chương </span></span>${item.getStories().getTotal_chapter()}</a>
							</div>
						
						</div>
					</div>
					</c:forEach>
				</div>
				<div class="text-center pagination-container">
					<ul class="pagination pagination-sm">
						<li class="active"><span>1<span class="sr-only">
									(đang xem)</span></span></li>
						<li><a
							href="https://truyenfull.vn/the-loai/tien-hiep/trang-2/"
							title="Tiên Hiệp - Trang 2">2</a></li>
						<li><a
							href="https://truyenfull.vn/the-loai/tien-hiep/trang-3/"
							title="Tiên Hiệp - Trang 3">3</a></li>
						<li><a
							href="https://truyenfull.vn/the-loai/tien-hiep/trang-4/"
							title="Tiên Hiệp - Trang 4">4</a></li>
						<li><a
							href="https://truyenfull.vn/the-loai/tien-hiep/trang-6/"
							title="Tiên Hiệp - Trang 6">6</a></li>
						<li><a
							href="https://truyenfull.vn/the-loai/tien-hiep/trang-11/"
							title="Tiên Hiệp - Trang 11">11</a></li>
						<li><a
							href="https://truyenfull.vn/the-loai/tien-hiep/trang-2/"
							title="Tiên Hiệp - Trang 2"><span class="sr-only">Trang
									tiếp</span><span class="glyphicon glyphicon-menu-right"></span></a></li>
						<li><a
							href="https://truyenfull.vn/the-loai/tien-hiep/trang-42/"
							title="Tiên Hiệp - Trang 42">Cuối <span class="arrow">&raquo;</span></a></li>
						<li class="dropup page-nav"><a href="javascript:void(0)"
							data-toggle="dropdown">Chọn trang <span class="caret"></span></a>
						<div class="dropdown-menu dropdown-menu-right" role="menu">
								<form action="." name="page_jump" id="page_jump" method="get">
									<div class="input-group">
										<input name="page_type" type="hidden" value="the-loai"><input
											name="truyen" type="hidden" value="tien-hiep"><input
											name="filter" type="hidden" value=""><input
											class="form-control" name="page" type="number"
											placeholder="Số trang..." value=""><span
											class="input-group-btn"><button
												class="btn btn-default" type="submit">Đi</button></span>
									</div>
								</form>
							</div></li>
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
						<c:forEach var = "item" items = "${categories }">						
							<div class="col-xs-6">
								<a href="/category/${item.category_id }/${item.slug }"
									title="Truyện Khác">${item.category_name }</a>
							</div>
							</c:forEach>
						</div>
					</div>
					<div class="ads-300-600 list-truyen list-cat col-xs-12"
						style="padding-left: 0; padding-right: 0"
						id="the-loai-right-banner"></div>
					<div class="list list-truyen list-side col-xs-12">
						<div class="title-list">
							<h4>Truyện Tiên Hiệp Đang Hot</h4>
						</div>
						<div class="row top-nav" data-limit="10" data-cat="1">
							<div class="col-xs-4 active" data-type="day">Ngày</div>
							<div class="col-xs-4" data-type="month">Tháng</div>
							<div class="col-xs-4" data-type="all">All time</div>
						</div>					
						<div class="row top-item">
							<div class="col-xs-12">
								<div class="top-num top-10">10</div>
								<div class="s-title">
									<h3>
										<a href="https://truyenfull.vn/nguyen-ton/" title="Nguyên Tôn">Nguyên
											Tôn</a>
									</h3>
								</div>
								<div>
									<a itemprop="genre"
										href="https://truyenfull.vn/the-loai/tien-hiep/"
										title="Tiên Hiệp">Tiên Hiệp</a>, <a itemprop="genre"
										href="https://truyenfull.vn/the-loai/huyen-huyen/"
										title="Huyền Huyễn">Huyền Huyễn</a>
								</div>
							</div>
						</div>
					</div>
					<div class="ads-300-600 list-truyen list-cat col-xs-12"
						style="padding-left: 0; padding-right: 0"
						id="the-loai-right-banner-bottom"></div>
				</div>
				<div id="ads-cate-list-1" class="ads-cate-sidebar"
					style="padding: 0 10px;"></div>
			</div>
			<div id="banner-bio-link-cate" class="ads-cate-sidebar"
				style="padding: 0 10px;"></div>
		</div>
		<div class="container text-center pagination-container">
			<div class="row ads-chapter-bottom-lien-quan" id="is_show_slide"
				style="padding-left: 5px; padding-right: 5px">
				<div class="ads-lien-quan" id="ads-lien-quan-1"></div>
				<div class="ads-lien-quan" id="ads-lien-quan-2"></div>
				<div class="ads-lien-quan" id="ads-lien-quan-3"></div>
				<div class="ads-lien-quan" id="ads-lien-quan-4"></div>
				<div class="ads-lien-quan" id="ads-lien-quan-6"></div>
			</div>
		</div>
	</div>
	<div id="footer" class="footer">
		<div class="container">
			<div class="hidden-xs col-sm-5">
				<strong>Truyện Full</strong> - <a title="Đọc truyện online"
					href="https://truyenfull.vn/">Đọc truyện</a> online, <a
					title="Đọc truyện chữ" href="https://truyentrz.com/">đọc truyện</a>
				chữ, <a title="Truyện hay" href="https://truyenfull.vn/">truyện
					hay</a>. Website luôn cập nhật những bộ <a title="Truyện mới"
					href="https://truyenfull.vn/danh-sach/truyen-moi/">truyện mới</a>
				thuộc các thể loại đặc sắc như <a title="Truyện tiên hiệp"
					href="https://truyenfull.vn/the-loai/tien-hiep/">truyện tiên
					hiệp</a>, <a title="Truyện kiếm hiệp"
					href="https://truyenfull.vn/the-loai/kiem-hiep/">truyện kiếm
					hiệp</a>, hay <a title="Truyện ngôn tình"
					href="https://truyenfull.vn/the-loai/ngon-tinh/">truyện ngôn
					tình</a> một cách nhanh nhất. Hỗ trợ mọi thiết bị như di động và máy
				tính bảng.
			</div>
			<ul class="col-xs-12 col-sm-7 list-unstyled">
				
				<li class="hidden-xs tag-list"><a
					href="https://truyenfull.vn/danh-sach/dam-my-hai/"
					title="đam mỹ hài">đam mỹ hài</a> <a
					href="https://truyenfull.vn/the-loai/xuyen-nhanh/"
					title="truyện xuyên nhanh">truyện xuyên nhanh</a> <a
					href="https://truyenfull.vn/danh-sach/ngon-tinh-sung/"
					title="ngôn tình sủng">ngôn tình sủng</a> <a
					href="https://truyenfull.vn/danh-sach/ngon-tinh-hai/"
					title="ngôn tình hài">ngôn tình hài</a> <a
					href="https://truyenfull.vn/danh-sach/truyen-teen-hay/"
					title="truyện teen hay">truyện teen hay</a> <a
					href="https://truyenfull.vn/danh-sach/ngon-tinh-hay/"
					title="ngôn tình hay">ngôn tình hay</a> <a
					href="https://truyenfull.vn/the-loai/dam-my/" title="truyện đam mỹ">truyện
						đam mỹ</a> <a href="https://truyenfull.vn/the-loai/ngon-tinh/hoan/"
					title="truyện ngôn tình">truyện ngôn tình</a> <a
					href="https://truyenfull.vn/the-loai/ngon-tinh/hoan/"
					title="ngôn tình hoàn">ngôn tình hoàn</a> <a
					href="https://truyenfull.vn/danh-sach/ngon-tinh-nguoc/"
					title="ngôn tình ngược">ngôn tình ngược</a> <a
					href="https://truyenfull.vn/danh-sach/kiem-hiep-hay/"
					title="truyện kiếm hiệp hay">truyện kiếm hiệp hay</a> <a
					href="https://truyenfull.vn/danh-sach/tien-hiep-hay/"
					title="truyện tiên hiệp hay">truyện tiên hiệp hay</a> <a
					href="https://truyenfull.vn/the-loai/he-thong/"
					title="truyện hệ thống">truyện hệ thống</a></li>
			</ul>
			<div class="col-xs-12 col-sm-12">
				<br />

			</div>
		</div>
	</div>
	
</body>
</html>