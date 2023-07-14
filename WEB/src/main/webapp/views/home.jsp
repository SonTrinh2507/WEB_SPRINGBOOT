<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="vi">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# book: http://ogp.me/ns/book# profile: http://ogp.me/ns/profile#">
<meta charset="UTF-8">
<title>Đọc truyện online</title>
<meta name="viewport"
	content="width=device-width,minimum-scale=1,initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="https://static.8cache.com/favicon.ico">

<link rel="stylesheet" href="/assets/css/home.css">

</head>
<body id="body_home">
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
			<meta itemprop="url" content="/home" />
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
					  <li><a href="#" onclick="sendParameters(0, 100)">Dưới 100 chương</a></li>
					  <li><a href="#" onclick="sendParameters(100, 500)">100 - 500 chương</a></li>
					  <li><a href="#" onclick="sendParameters(500, 1000)">500 - 1000 chương</a></li>
					  <li><a href="#" onclick="sendParameters(1000, -1)">Trên 1000 chương</a></li>

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
			<form class="navbar-form navbar-right" action="/search" method="GET">
    <div class="input-group search-holder">
        <input aria-label="Từ khóa tìm kiếm" role="search key" class="form-control" id="search-input" type="search" name="keyword" placeholder="Tìm kiếm..." required>
        <div class="input-group-btn">
            <button class="btn btn-default" type="submit" aria-label="Tìm kiếm" role="search">
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

		<div class="container" id="intro-index">
			<div class="title-list">
				<h2>
					<a 
						title="Truyện hot">Truyện hot</a>
				</h2>
				<a 
					title="Truyện hot"><span class="glyphicon glyphicon-fire"></span></a>
			</div>
			<div class="index-intro">
				<c:forEach var = "item" items = "${stories }">
				<div class="item top-2" itemscope itemtype="https://schema.org/Book">
					<a href="/${item.story_code }/${item.slug}"
						itemprop="url"><span class="full-label"></span><img
						src="/assets/img/${item.story_picture}"
						alt="${item.story_name }" class="img-responsive item-img"
						itemprop="image">
						<div class="title">
							<h3 itemprop="name">${item.story_name }</h3>
						</div></a>
				</div>
				</c:forEach>

			</div>
		</div>
		<div class="container" id="list-index">
			<div
				class="list list-truyen list-new col-xs-12 col-sm-12 col-md-8 col-truyen-main">
				<div class="title-list">
					<h2>
						<a 
							title="Truyện mới">Truyện mới cập nhật</a>
					</h2>
					<a
						title="Truyện mới"><span
						class="glyphicon glyphicon-menu-right"></span></a>
						
				</div>
				<c:forEach var = "item" items = "${storiesComplete }">
				<div class="row" itemscope itemtype="https://schema.org/Book">
					<div class="col-xs-9 col-sm-6 col-md-5 col-title">
						<span class="glyphicon glyphicon-chevron-right"></span>
						<h3 itemprop="name">

							<a href="/${item.story_code }/${item.slug}"
								title="${item.story_name }" itemprop="url">${item.story_name }</a>

						</h3>
						<span class="label-title label-new"></span>
					</div>
					<div class="hidden-xs col-sm-3 col-md-3 col-cat">
					<c:set var="flag" value="false" />
					<c:forEach var="i" items="${item.getCategory_story()}">
					  <c:if test="${not empty i}">
					    <c:choose>
					      <c:when test="${flag}">
					        ,
					      </c:when>
					      <c:otherwise>
					        <c:set var="flag" value="true" />
					      </c:otherwise>
					    </c:choose>
					    <a itemprop="genre" href="/category/${i.getCategory().getCategory_id() }/${i.getCategory().getSlug()}" title="${i.getCategory().getCategory_name()}">${i.getCategory().getCategory_name()}</a>
					  </c:if>
					</c:forEach>
						
					</div>
					<c:forEach var = "it" items = "${HomeController.getChapterNewUpdate(item.story_id)}">
					<div class="col-xs-3 col-sm-3 col-md-2 col-chap text-info">
						<a
							href="/detail-story/${item.story_code}/${item.slug }/${it.slug}"
							title="">
							
							<span
							class="chapter-text"><span>${it.chapter_name} </span></span></a>
					</div>
					<div class="hidden-xs hidden-sm col-md-2 col-time">
					<script>
					    var datetimeString = "${it.date_update}";
					    var targetDateTime = new Date(datetimeString);
					    var currentDateTime = new Date();
					    var timeDiff = currentDateTime - targetDateTime ;
					    var hoursDiff = Math.floor(timeDiff / (1000 * 60 * 60));
					    document.write( hoursDiff + " giờ trước");
				  </script>
					</div>
						</c:forEach>
				</div>
				</c:forEach>
			</div>
			<div class="col-md-4 col-truyen-side">
				<div class="visible-md-block visible-lg-block text-center">
					<div class="hide" id="history-holder-side"></div>
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
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="container">
			<div class="row" id="banner_image_home"
				style="padding-left: 15px; padding-right: 15px; margin-top: 10px;"></div>
		</div>
		<div class="container" id="truyen-slide">
			<div class="list list-thumbnail col-xs-12">
				<div class="title-list">
					<h2>
						<a>Truyện đã hoàn thành</a>
					</h2>
					<a><span
						class="glyphicon glyphicon-menu-right"></span></a>
				</div>
				<c:forEach var = "complete" items = "${storiesComplete }">
				<div class="row">
					
					<div class="col-xs-4 col-sm-3 col-md-2">				
						<a
							href="/${complete.story_code }/${complete.slug}"
							title="${complete.story_name}">
							<div class="lazyimg"
								data-desk-image="/assets/img/${complete.story_picture }"
								data-image="${complete.story_picture }"
								data-alt="${complete.story_name }"></div>
							<div class="caption">
								<h3>${complete.story_name}</h3>
								<small class="btn-xs label-primary">Full - ${complete.total_chapter} chương</small>
							</div>
						</a>
					
					</div>
						</c:forEach>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="ads-responsive row ads-chapter-bottom-lien-quan"
				id="is_show_slide" style="padding-left: 5px; padding-right: 5px">
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
				<strong>Truyện Full</strong> - Đọc truyện online, đọc truyện chữ, truyện hay. 
				Website luôn cập nhật những bộ truyện mới thuộc các thể loại đặc sắc như truyện tiên hiệp, truyện kiếm hiệp, hay truyện ngôn tình một cách nhanh nhất.
			</div>
			<ul class="col-xs-12 col-sm-7 list-unstyled">
			
				<li class="hidden-xs tag-list">
  					<c:forEach var="item" items="${categories}" varStatus="status">
   						<c:if test="${status.index < 20}">
     					 	<a href="/category/${item.category_id}/${item.slug}" title="${item.category_name}">${item.category_name}</a>
   					 	</c:if>
  					</c:forEach>
				</li>
			</ul>
			<div class="col-xs-12 col-sm-12"></div>
		</div>
	</div>
	<script src="/assets/js/home.js"></script>
<script src="/assets/js/function.js"></script>


</body>
</html>