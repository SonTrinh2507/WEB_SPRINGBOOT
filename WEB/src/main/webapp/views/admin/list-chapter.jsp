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
											<li><a href="#" title="Truyện Tiên Hiệp">Tuy</a></li>
										</ul>
									</div>
								</div>
							</div></li>
						<li class="dropdown"><a href="javascript:void(0)"
							class="dropdown-toggle" data-toggle="dropdown"><span
								class="glyphicon glyphicon-list"></span> Phân loại theo Chương <span
								class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
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
		</div>
		<div class="container" id="list-page">


			<div class="list list-truyen col-xs-12">
				<c:if test="${countChapter < story.total_chapter}">
				<a href = "/admin/list-story" ><i class="fa fa-arrow-circle-left fa-4x" aria-hidden="true"></i></a>
				<br>
					<a href="/admin/${story.story_id}/${story.slug}"> 

					<i class="fa fa-plus-circle fa-4x"> Thêm chương mới</i>
					</a>
				</c:if>
				<div class="title-list"></div>
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
						<c:forEach var="item" items="${chapters }">
							<ul class="list-chapter">
								<li><span class="glyphicon glyphicon-certificate"></span> <a
									href="/detail-story/${story.story_code}/${story.slug}/${item.slug}"
									title="${story.story_name} - ${item.chapter_name}"> <span
										class="chapter-text" style="font-size: 18px;"> <span>${story.story_name}:
												${item.chapter_name}</span>
									</span>
								</a> <a href="javascript:void(0)"
									onclick="deleteChapter('${story.story_code}', '${item.chapter_id}')"><i
										class="fa fa-trash fa-2x" aria-hidden="true"></i></a></li>
							</ul>
						</c:forEach>
					</div>
				</div>
			</div>


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

	<script src="/assets/js/function.js"></script>
	<script>
		function deleteChapter(storyCode, chapter_id) {
			if (confirm('Bạn có chắc chắn muốn xóa không?')) {
				$.ajax({
					type : 'POST',
					url : '/admin/delete/' + storyCode + '/' + chapter_id,
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