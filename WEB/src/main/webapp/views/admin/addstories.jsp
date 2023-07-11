<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Add story</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<script src="https://unpkg.com/turndown/dist/turndown.js"></script>

<!-- https://fonts.google.com/specimen/Roboto -->

<!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
<link rel="stylesheet" href="/assets/css/style.css" />
<link rel="stylesheet" href="/assets/css/sample.css" />

</head>

<body>
	<div class="formbold-main-wrapper">
		<!-- Author: FormBold Team -->
		<!-- Learn More: https://formbold.com -->
		<div class="formbold-form-wrapper">
			<div class="formbold-form-title">
				<h2 class="">Đăng tải truyện</h2>
				<p>Nhập đầy đủ nội dung</p>
			</div>

			<form method="post" action="/admin/story-add" id="myForm">
				<div>
					<label for="story_name" class="formbold-form-label"> Tên
						truyện </label> <input type="text" name="story_name" id="story_name"
						class="formbold-form-input" required oninput="generateStoryCode()" />
				</div>
				<div>
					<label for="total_chapter" class="formbold-form-label">
						Tổng số chương </label> <input type="text" name="total_chapter"
						id="total_chapter" class="formbold-form-input" required />
				</div>
				<div>
					<label for="author_name" class="formbold-form-label"> Tác
						giả </label> <input type="text" name="author_name" id="author_name"
						class="formbold-form-input" required />
				</div>
				<div class="formbold-input-flex">
					<div>
						<label for="story_code" class="formbold-form-label"> Mã
							nguồn </label> <input type="text" name="slug" id="slug"
							class="formbold-form-input" required />
					</div>
					<div>
						<label for="status" class="formbold-form-label">Trạng thái</label>
						<select name="status" id="status" class="formbold-form-input">
							<option value="0">Chưa ra</option>
							<option value="1">Đang ra</option>
							<option value="2">Full</option>
						</select>
					</div>
				</div>
				<div class="formbold-mb-3">
					<label for="story_describe" class="formbold-form-label">Mô
						tả truyện</label>
					<textarea name="story_describe" id="story_describe"
						class="formbold-form-input" rows="3" required></textarea>
				</div>
				<div class="formbold-mb-3">
					<label for="story_picture" class="formbold-form-label">
						Hình ảnh </label> <input type="file" name="story_picture"
						id="story_picture" class="formbold-form-input" required />
				</div>
				<div class="formbold-mb-3">
				<c:forEach var="item" items="${categories}">
  <input type="checkbox" id="${item.category_id}" name="category_id" value="${item.category_id}">
  <label for="${item.category_id}">${item.category_name}</label><br>
</c:forEach>
				</div>

				<button type="submit" class="formbold-btn" id="submitBtn">Đăng
					bài</button>
			</form>
		</div>
	</div>
	<script>
		function generateStoryCode() {
			var storyName = document.getElementById("story_name").value;
			var storyCode = removeDiacritics(storyName).toLowerCase().replace(
					/ /g, "-");
			document.getElementById("slug").value = storyCode;
		}

		function removeDiacritics(str) {
			return str.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
		}
	</script>
</body>
</html>
