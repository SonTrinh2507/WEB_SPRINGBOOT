<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
pageContext.setAttribute("newLineChar", "\n");
%>

<!DOCTYPE html>
<html lang="vi">
<head
	prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# book: http://ogp.me/ns/book# profile: http://ogp.me/ns/profile#">
<meta charset="UTF-8">
<title>${story.story_name}</title>
<link rel="stylesheet" href="/assets/css/rate.css">


<link rel="stylesheet" href="/assets/css/home.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

<style>
.top-num.top-10 {
	background-color: #FFDAB9;
}

.checked {
	color: orange;
}
</style>
</head>
<body id="body_truyen">
	<div id="ads-install-app"></div>
	<div id="wrap">
		<div class="navbar navbar-default navbar-static-top" role="navigation"
			id="nav">
			<script type="text/javascript">
				function getCookie(d) {
					d += "=";
					for (var b = decodeURIComponent(document.cookie).split(";"), c = [], a = 0; a < b.length; a++)
						0 == b[a].trim().indexOf(d)
								&& (c = b[a].trim().split("="));
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
					<a class="header-logo" href="/home" title="doc truyen">doc
						truyen</a>
				</div>
				<div class="navbar-collapse collapse">
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
						action="https://truyenfull.vn/tim-kiem/" role="search">
						<div class="input-group search-holder">
							<input aria-label="Từ khóa tìm kiếm" role="search key"
								class="form-control" id="search-input" type="search"
								name="tukhoa" placeholder="Tìm kiếm..." value="" required>
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
				<div class="container breadcrumb-container">
					<ol class="breadcrumb" itemscope
						itemtype="https://schema.org/BreadcrumbList">
						<li itemprop="itemListElement" itemscope
							itemtype="https://schema.org/ListItem"><a
							href="https://truyenfull.vn" accesskey="1"><span
								class="glyphicon glyphicon-home"></span></a><a href="/home"
							title="Đọc truyện online" itemprop="item"><span
								itemprop="name">Truyện</span></a>
							<meta itemprop="position" content="1" /></li>
						<li class="active" itemprop="itemListElement" itemscope
							itemtype="https://schema.org/ListItem"><h1>
								<a href="/${story.story_code}/${story.slug}"
									title="${story.story_name }" itemprop="item"><span
									itemprop="name">${story.story_name }</span></a>
							</h1>
							<meta itemprop="position" content="2" /></li>
					</ol>
				</div>
			</div>
		</div>
		<div class="container header-ads" id="header-ads"></div>
		<div class="header-ads-full" id="header-ads-full"></div>
		<div class="container csstransforms3d" id="truyen">
			<div class="col-xs-12 col-sm-12 col-md-9 col-truyen-main">
				<div class="col-xs-12 col-info-desc" itemscope
					itemtype="https://schema.org/Book">
					<div class="title-list book-intro">
						<h2>Thông tin truyện</h2>
					</div>
					<h3 class="title" itemprop="name">${story.story_name }</h3>
					<div class="col-xs-12 col-sm-4 col-md-4 info-holder">
						<div class="books">
							<div class="book">
								<img src="/assets/img/${story.story_picture}"
									alt="${story.story_name }" itemprop="image">
							</div>
						</div>
						<div class="info">
							<div>
								<h3>Tác giả:</h3>
								<a itemprop="author" title="${story.getAuthor_name() }">${story.getAuthor_name() }</a>
							</div>
							<div>
								<h3>Thể loại:</h3>
								<c:set var="flag" value="false" />
								<c:forEach var="i" items="${story.getCategory_story()}">
									<c:if test="${not empty i}">
										<c:choose>
											<c:when test="${flag}">
							        ,
							      </c:when>
											<c:otherwise>
												<c:set var="flag" value="true" />
											</c:otherwise>
										</c:choose>
										<a itemprop="genre"
											href="/category/${i.getCategory().getCategory_id()}/${i.getCategory().getSlug()}"
											title="${i.getCategory().getCategory_name()}">${i.getCategory().getCategory_name()}</a>
									</c:if>
								</c:forEach>

							</div>
							<div>
								<h3>Nguồn:</h3>
								<span class="source">sưu tầm</span>
							</div>
							<div>
								<h3>Trạng thái:</h3>
								<c:choose>
									<c:when test="${story.status == 0}">
										<span class="text-success">Chưa ra</span>
									</c:when>
									<c:when test="${story.status == 1}">
										<span class="text-success">Đang ra</span>
									</c:when>
									<c:when test="${story.status == 2}">
										<span class="text-success">Full</span>
									</c:when>
									<c:otherwise>
										<span class="text-success">Trạng thái không xác định</span>
									</c:otherwise>
								</c:choose>
							</div>
						</div>

					</div>
					<div class="rate">
					
						<div class="star-widget">
						<div class = "title-rate">
						<em>Đánh giá</em>
						<strong>
						<span itemprop="ratingValue"> ${story.agv_star }</span></strong>/
						<span class="text-muted" itemprop="bestRating" >5</span>
						từ 
						<strong>
						<span itemprop="ratingCount"> ${story.total_rating } lượt</span>
						</strong>
						 </div>
							<input type="radio" name="rate" id="rate-1" value = 5> <label
								for="rate-1" class="fas fa-star"></label> <input type="radio"
								name="rate" id="rate-2" value = 4> <label for="rate-2"
								class="fas fa-star"></label> <input type="radio" name="rate"
								id="rate-3" value = 3> <label for="rate-3" class="fas fa-star"></label>
							<input type="radio" name="rate" id="rate-4" value = 2> <label
								for="rate-4" class="fas fa-star"></label> <input type="radio"
								name="rate" id="rate-5" value = 1> <label for="rate-5"
								class="fas fa-star"></label>

						</div>
					</div>
				
					<div class="col-xs-12 col-sm-8 col-md-8 desc">

						<c:set var="str" value="${story.story_describe}" />
						<c:set var="formattedStr"
							value="${fn:replace(str, newLineChar, '<br/>')}" />


						<div class="desc-text desc-text-full" itemprop="description">
							${formattedStr}</div>
						<div class="showmore">
							<a class="btn btn-default btn-xs hide" href="javascript:void(0)"
								title="Xem thêm">Xem thêm »</a>
						</div>
					</div>
				</div>
				<div class="col-xs-12 text-center no-padding">
					<div class="text-center ads-holder"
						id="ads-detail-truyen-main-middle"></div>
					<div class="text-center ads-holder"
						id="ads-detail-truyen-main-middle-new"></div>
					<div class="text-center ads-holder"
						id="ads-detail-truyen-main-middle-new-js"></div>
				</div>
				<div class="col-xs-12" id="list-chapter">
					<div class="title-list">
						<h2>Danh sách chương</h2>
					</div>
					<div class="row">
						<div class="col-xs-12 col-sm-6 col-md-6">
							<c:forEach var="item" items="${chapters }">
								<ul class="list-chapter">
									<li><span class="glyphicon glyphicon-certificate"></span>
										<a
										href="/detail-story/${item.getStories().getStory_code() }/${item.getStories().getSlug()}/${item.slug}"
										title="${story.story_name } - ${item.chapter_name } : ${item.chapter_theme}"><span
											class="chapter-text"><span>${item.chapter_name }
													: ${item.chapter_theme } </span></span></a></li>
								</ul>
							</c:forEach>
						</div>
					</div>
					<input id="truyen-id" type="hidden" value="30724"><input
						id="total-page" type="hidden" value="2"><input
						id="truyen-ascii" type="hidden" value="kieu-sung-vi-thuong"><input
						id="truyen-comment" type="hidden" value="kieu-sung-vi-thuong"><input
						id="chapter-sac" type="hidden" value="0"><input
						id="truyen-time" type="hidden" value="1666015271">
					<ul class="pagination pagination-sm">
						<li class="active"><span>1<span class="sr-only">
									(đang xem)</span></span></li>
						<li><a href="/category/$"
							title="Kiều Sủng Vi Thượng - Trang 2"><span class="sr-only">Trang
									tiếp</span><span class="glyphicon glyphicon-menu-right"></span></a></li>
					</ul>
					<input name="truyen" type="hidden" value="kieu-sung-vi-thuong">
				</div>
				<div class="col-xs-12">
					<div id="ads-detail-admincro"></div>
				</div>
				<div class="col-xs-12 comment-box">
					<div class="title-list">
						<h2>Bình luận truyện</h2>
					</div>
					<div class="col-xs-12">
						<div class="row" id="fb-comment-story"></div>
					</div>
				</div>
			</div>
			<div
				class="visible-md-block visible-lg-block col-md-3 text-center col-truyen-side">
				<div class="list list-truyen list-side col-xs-12"
					id="ads-300x250-detail-truyen-top"></div>
				<div class="list list-truyen list-side col-xs-12">
					<div class="title-list">
						<h4>Truyện cùng thể loại</h4>
					</div>
					<c:set var="sum" value="0" />

					<div class="row top-item">
						<c:forEach var="item" items="${alikeCategory }">

							<div class="col-xs-12">
								<div class="top-num top-10"></div>


								<div class="s-title">
									<h3>
										<a
											href="/${item.getStories().getStory_code()}/${item.getStories().getSlug() }"
											title="Rể Quý Trời Cho">${item.getStories().getStory_name() }</a>
									</h3>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="list list-truyen list-side col-xs-12"
					id="ads-300x250-detail-truyen-bottom"></div>
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
		</div>
	</div>
<button onclick = "deleteCookie('rated_${story.story_id}' )">COOKIE</button>
<button onclick = "displayCookies()">COOKIE</button>
	<script src="/assets/js/home.js"></script>
	<script src="/assets/js/function.js"></script>
	<script>// Sử dụng JavaScript và jQuery để gọi API và cập nhật số sao
	$(document).ready(function() {
	    $("input[name='rate']").change(function() {
	    	 if (getCookie("rated_"+${story.story_id}) === null) {
	        var rate = $("input[name='rate']:checked").val();

	        $.post("/" + ${story.story_id} + "/rate", { rate: rate })
	            .done(function(data) {
	                setCookie("rated_"+${story.story_id}, "true", 365); // Lưu cookie trong 365 ngày

	                // Xử lý thành công, chẳng hạn hiển thị thông báo
	                alert("Cảm ơn bạn đã đánh giá: " + rate + " sao");
	                // Chuyển hướng người dùng đến trang khác nếu cần thiết
	                window.location.href = data.redirectUrl; // thay đổi redirectUrl tùy thuộc vào response từ 

	            })
	            .fail(function() {
	                // Xử lý khi có lỗi, chẳng hạn hiển thị thông báo lỗi
	                alert("Bạn đã đánh giá rồi bạn có muốn sửa lại không?");
	                setCookie("rated_"+${story.story_id}, "", -1); // Ghi đè lên cookie hiện tại và đặt thời gian hết hạn là -1

	            });
	    }
	    });
	});
	
	// Hàm lưu cookie
	function setCookie(name, value, days) {
	    var expires = "";
	    if (days) {
	        var date = new Date();
	        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
	        expires = "; expires=" + date.toUTCString();
	    }
	    document.cookie = name + "=" + value + expires + "; path=/";
	}

	// Hàm lấy cookie theo tên
	function getCookie(name) {
	    var nameEQ = name + "=";
	    var cookies = document.cookie.split(';');
	    for (var i = 0; i < cookies.length; i++) {
	        var cookie = cookies[i];
	        while (cookie.charAt(0) === ' ') {
	            cookie = cookie.substring(1, cookie.length);
	        }
	        if (cookie.indexOf(nameEQ) === 0) {
	            return cookie.substring(nameEQ.length, cookie.length);
	        }
	    }
	    return null;
	}
	
	// Lấy giá trị của cookie "rated"
	function getRatedCookie() {
	  var cookies = document.cookie.split(";");
		var nameCookie = "rated_"+${story.story_id};
	  for (var i = 0; i < cookies.length; i++) {
	    var cookie = cookies[i].trim();
	    if (cookie.indexOf(nameCookie) === 0) {
	      var cookieValue = cookie.substring(nameCookie.length);
	      return cookieValue;
	    }
	  }

	  return null;
	}


	</script>
</body>
</html>