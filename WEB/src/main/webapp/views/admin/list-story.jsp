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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
					<a class="header-logo" href="/home" title="doc truyen">doc
						truyen</a>
				</div>
				<div class="navbar-collapse collapse">
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
		</div>
		<div class="container" id="list-page">

			<div class="col-xs-12 col-sm-12 col-md-9 col-truyen-main">
				<div class="text-center"></div>
				<div class="list list-truyen col-xs-12">
				<a href = "/home"><i class="fa fa-home fa-4x" aria-hidden="true"></i></a>
				<br>
					<a href="/admin/story"><i class="fa fa-plus-circle fa-4x">
							Thêm truyện mới</i> </a>
					<div class="title-list"></div>
					<c:forEach var="item" items="${stories}">
						<div class="row" itemscope itemtype="https://schema.org/Book">

							<div class="col-xs-3" style="width: 182px; height: 82px;">
								<div>
								<a href = "/${item.story_code}/${item.slug}" title="${item.story_name }" >
									<img src="/assets/img/${item.story_picture}" class="cover"
										style="width: 100%; height: 82px; object-fit: cover;"></img></a>
								</div>
							</div>
							<div class="col-xs-7">
								<div>
									<span class="glyphicon glyphicon-book"></span>
									<h3 class="truyen-title" itemprop="name">
										<a href = "/${item.story_code}/${item.slug}" title="${item.story_name }" itemprop="url">${item.story_name }</a>
									</h3>
									<span class="label-title label-new"></span><span class="author"
										itemprop="author"><span
										class="glyphicon glyphicon-pencil"></span>${item.author_name}</span>
								</div>
							</div>
							<div class="col-xs-2 text-info">

								<div>
									<a href="/admin/list-chapter/${item.story_code}"
										title="${item.story_name}">Thêm chương <br> <span
										class="chapter-text"><span>(Tổng
												${countChapter.countChapter(item.story_id)} / </span></span>${item.total_chapter})</a>
								</div>
								
							</div>
							<a href = "javascript:void(0)" onclick = "deleteStory('${item.story_id}')">
								<i class="fa fa-trash fa-2x" aria-hidden="true" style="margin-top: 30px;"></i></a>
							</div>
						</c:forEach>

				</div>
				<div class="text-center pagination-container">
					<ul class="pagination pagination-sm">
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
								<li><a href="/admin/list-story?page=${currentPage - 1}">&laquo;</a></li>
							</c:if>

							<!-- Các nút trang -->
							<c:forEach var="page" begin="${startPage}" end="${endPage}">
								<c:choose>
									<c:when test="${page == currentPage}">
										<li class="active"><span>${page}<span
												class="sr-only">(đang xem)</span></span></li>
									</c:when>
									<c:otherwise>
										<li><a href="/admin/list-story?page=${page}">${page}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<!-- Nút trang tiếp theo -->
							<c:if test="${currentPage < totalPages}">
								<li><a href="/admin/list-story?page=${currentPage + 1}">&raquo;</a></li>
							</c:if>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<script src="/assets/js/function.js"></script>
	<script>
	function deleteStory(story_id) {
		if (confirm('Bạn có chắc chắn muốn xóa không?'  + story_id)) {
			$.ajax({
				type : 'POST',
				url : '/admin/delete/' + story_id,
				success : function(response) {
					alert('Xóa chương trình thành công');
					location.reload(); // Làm mới trang
				},
				error : function() {
					alert('Đã xảy ra lỗi khi xóa chương trình');
				}
			});
		}
	}
	</script>
</body>
</html>