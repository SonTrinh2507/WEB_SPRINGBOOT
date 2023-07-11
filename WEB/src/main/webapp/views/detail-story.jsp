<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>

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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="/assets/css/home.css">
</head>
<body id="body_chapter">
	<div id="ads-install-app"></div>
	<div id="wrap">
		<div class="navbar navbar-default navbar-static-top" role="navigation"
			id="nav">
			<script type="text/javascript">function getCookie(d){d+="=";for(var b=decodeURIComponent(document.cookie).split(";"),c=[],a=0;a<b.length;a++)0==b[a].trim().indexOf(d)&&(c=b[a].trim().split("="));return 0<c.length?c[1]:""}var js_bgcolor=getCookie("bgcolor-cookie"),js_font=getCookie("font-cookie"),js_size=getCookie("size-cookie"),js_lineheight=getCookie("lineheight-cookie"),js_hidenav=getCookie("hidenav-cookie"),js_fluid_switch=getCookie("fluid-switch-cookie"),js_onebreak_switch=getCookie("onebreak-switch-cookie"),js_body_insert_class="";""!=js_bgcolor&&"#F4F4F4"!=js_bgcolor&&(js_bgcolor=js_bgcolor.replace("#",""),js_body_insert_class="232323"==js_bgcolor?js_body_insert_class+" background-232323 dark-theme":js_body_insert_class+(" background-"+js_bgcolor));1==js_hidenav&&(document.getElementById("body_chapter").className+=" hidenav");""!=js_size&&(js_body_insert_class+=" size-"+js_size);""!=js_font&&(js_font=js_font.replace(/, serif|, sans-serif|'|\s/g,""),js_body_insert_class+=" font-"+js_font);""!=js_lineheight&&"180%"!=js_lineheight&&(js_lineheight=js_lineheight.replace("%",""),js_body_insert_class+=" lineheight-"+js_lineheight);1==js_fluid_switch&&(js_body_insert_class+=" container-fluid-switch");document.getElementById("body_chapter").className+=js_body_insert_class;</script>
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">Hiện menu</span><span class="icon-bar"></span><span
							class="icon-bar"></span><span class="icon-bar"></span>
					</button>
					<a class="header-logo" href="/home"
						title="doc truyen">doc truyen</a>
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
									<c:forEach var="item" items="${categories}" varStatus="status">
										<c:if test="${status.index % 10 == 0 && status.index != 0}">
								</ul>
							</div>
							<div class="col-md-4">
								<ul class="dropdown-menu">
									</c:if>
									<li><a
										href="/category/${item.slug}"
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
								class="glyphicon glyphicon-home"></span></a><a
							href="/home" title="Đọc truyện online"
							itemprop="item"><span itemprop="name">Truyện</span></a>
							<meta itemprop="position" content="1" /></li>
						<li itemprop="itemListElement" itemscope
							itemtype="https://schema.org/ListItem"><h1>
								<a href="/${story.story_code}/${story.slug}"
									title="${story.story_name }" itemprop="item"><span
									itemprop="name">${story.story_name }</span></a>
							</h1>
							<meta itemprop="position" content="2" /></li>
							
						<li itemprop="itemListElement" itemscope
							itemtype="https://schema.org/ListItem">
							<a
							href="/detail-story/${story.story_code}/${story.slug}/${contentChapter.slug}"
							title="Chương 1" itemprop="item"><span itemprop="name">${contentChapter.chapter_name}</span></a>
							<meta itemprop="position" content="3" /></li>
					</ol>
				</div>
			</div>
		</div>
		<div class="container header-ads" id="header-ads"></div>
		<div class="header-ads-full" id="header-ads-full"></div>
		<div id="chapter-big-container" class="container chapter">
			<div class="row">
				<div class="col-xs-12">
					<button type="button"
						class="btn btn-responsive btn-success toggle-nav-open">
						<span class="glyphicon glyphicon-menu-updownswitch"></span>
					</button>
					<a class="truyen-title"
						href="/${story.story_code}/${story.slug}"
						title="${story.story_name }">${story.story_name }</a>
					<h2>
						<a class="chapter-title"
							href="/detail-story/${story.story_code}/${story.slug}/${contentChapter.slug}"
							title="${story.story_name } - ${contentChapter.chapter_name}"><span
							class="chapter-text"><span>${contentChapter.chapter_name} </span></span></a>
					</h2>
					<c:set var="chapter" value="${contentChapter.slug}" />
					<c:set var="fmchapter" value="${fn:substringAfter(chapter, '-')}" />
					<c:set var="chapterIntBefore" value="0" />
					<c:set var="chapterInt" value="${Integer.parseInt(fmchapter)}" />
					
					<hr class="chapter-start">
					<div class="chapter-nav" id="chapter-nav-top">
						<div class="btn-group">
							<a class="btn btn-success btn-chapter-nav"
								href="/detail-story/${story.story_code }/${story.slug}/chuong-${chapterInt - 1}" title="Không có chương trước"
								id="prev_chap" data-cid=""  onclick="updateSelectedOption(this)"><span
								class="glyphicon glyphicon-chevron-left"></span> <span
								class="hidden-xs">Chương </span>trước</a>
							<button type="button"
								class="btn btn-success btn-chapter-nav chapter_jump" onclick="toggleChapterSelect()">
								<span class="glyphicon glyphicon-list-alt">														
								</span>
								
							</button>
							<select id ="chapterSelect" class=" btn btn-success btn-chapter-nav form-control chapter_jump" style="display: none;" >
							<c:forEach var = "item" items = "${chapters }">
							<option value =  "/detail-story/${story.story_code}/${story.slug}/${item.slug}">${item.chapter_name }</option>
							<c:set var="chapterIntBeforeAdd" value="${chapterIntBeforeAdd+1}" />
							
							</c:forEach>
							</select>							
							<a class="btn btn-success btn-chapter-nav"
								href="/detail-story/${story.story_code }/${story.slug}/chuong-${chapterInt + 1}"
								title="Chương 2" id="next_chap" data-cid="" onclick = "updateSelectedOption(this)"><span
								class="hidden-xs">Chương </span>tiếp <span
								class="glyphicon glyphicon-chevron-right"></span></a>
						</div>
					</div>									
					<hr class="chapter-end">
						<c:set var="str" value="${contentChapter.chapter_content}" />
						<c:set var="formattedStr" value="${fn:replace(str, newLineChar, '<br/>')}" />
					<div id="chapter-c" class="chapter-c" itemprop="articleBody">
						<div class="visible-md visible-lg ads-responsive incontent-ad"
							id="ads-chapter-pc-top" align="center" style="height: 90px">
							</div>
						${formattedStr }
					</div>
					<div id="ads-chapter-google-bottom" align="center"
						style="margin-bottom: 10px; margin-top: 10px;"></div>
					<hr class="chapter-end">
					<div class="chapter-nav" id="chapter-nav-bot">
						<div class="btn-group"
							style="margin-bottom: 15px; margin-top: 15px">
							<a class="btn btn-success btn-chapter-nav"
								href="/detail-story/${story.story_code }/${story.slug}/chuong-${chapterInt - 1}" title="Không có chương trước"
								id="prev_chap1" data-cid="" onclick = "updateSelectedOption(this)"><span
								class="glyphicon glyphicon-chevron-left"></span> <span
								class="hidden-xs">Chương </span>trước</a>
							<button type="button"
								class="btn btn-success btn-chapter-nav chapter_jump change_jump" onclick="toggleChapterSelect()" >
								<span class="glyphicon glyphicon-list-alt"></span>								
							</button>
							<select id ="chapterSelect1" class=" btn btn-success btn-chapter-nav form-control chapter_jump" style="display: none;" >
							<c:forEach var = "item" items = "${chapters }">
							<option value =  "/detail-story/${story.story_code}/${story.slug}/${item.slug}">${item.chapter_name}</option>
							</c:forEach>
							</select>
							<a class="btn btn-success btn-chapter-nav"
								href="/detail-story/${story.story_code }/${story.slug}/chuong-${chapterInt}"
								title="Chương 2" id="next_chap1" data-cid="" onclick = "updateSelectedOption(this)"><span
								class="hidden-xs">Chương </span>tiếp <span
								class="glyphicon glyphicon-chevron-right"></span></a>
						</div>
						
						<div class="show_ads_google" id="chapter-end-bot"></div>
						<div class="text-center">
							<button type="button" class="btn btn-warning" id="chapter_error">
								<span class="glyphicon glyphicon-flag"></span> Báo lỗi chương
							</button>
							<button type="button" class="btn btn-info" id="chapter_comment">
								<span class="glyphicon glyphicon-comment"></span> Bình luận
							</button>
						</div>
						<div class="col-xs-12">
							<div class="row" id="fb-comment-chapter"></div>
						</div>
						<div class="col-xs-12">
							<div class="row">
								<div class="ads-responsive row ads-chapter-bottom-lien-quan"
									id="ads-chapter-bottom-lien-quan"
									style="padding-left: 5px; padding-right: 5px">
								
								</div>
							</div>
						</div>
					</div>
				</div>
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
				<li class="text-right pull-right"><a
					href="https://truyenfull.vn/contact/" title="Contact">Contact</a> -
					<a href="https://truyenfull.vn/tos/" title="Terms of Service">ToS</a><a
					class="backtop" title="Trở lên đầu trang" href="#wrap"
					rel="nofollow" aria-label="Trở về đầu trang"><span
						class="glyphicon glyphicon-upload"></span></a></li>
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
	<script src="/assets/js/home.js"></script>
<script src="/assets/js/function.js"></script>
<script>
var chapterInt = ${chapterInt};
var prevChap = document.getElementById('prev_chap');
var prevChap1 = document.getElementById('prev_chap1');
var nextChap = document.getElementById('next_chap');
var nextChap1 = document.getElementById('next_chap1');
if (${chapterInt} > 1) {
  prevChap.style.display = 'block';
  prevChap1.style.display = 'block';
} else {
  prevChap.style.display = 'none';
  prevChap1.style.display = 'none';
}

if (${chapterInt} < ${chapterIntBeforeAdd}) {
  nextChap.style.display = 'block';
  nextChap1.style.display = 'block';
} else {
  nextChap.style.display = 'none';
  nextChap1.style.display = 'none';
  
}

</script>
</body>
</html>