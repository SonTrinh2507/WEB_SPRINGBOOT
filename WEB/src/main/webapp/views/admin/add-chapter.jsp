<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
			<a href = "/admin/list-chapter/${story.get().story_code }" ><i class="fa fa-arrow-circle-left fa-4x" aria-hidden="true"></i></a>
		
			<div class="formbold-form-title">
				<h2 class="">Đăng tải chương</h2>
				<p>Nhập đầy đủ nội dung</p>
			</div>
	
			<form method="post" action="/admin/editor" id="myForm">
				<div>
					<label for="story_name" class="formbold-form-label"> Tên
						truyện </label> <input value="${story.get().story_name}" type="text"
						name="story_name" id="email" class="formbold-form-input" disabled />
				</div>
				<div>
					<label for="chapter_name" class="formbold-form-label"> Tên
						chương </label> <input type="text" name="chapter_name" id="chapter_name"
						class="formbold-form-input" required oninput="generateStoryCode()" />
				</div>
				<div>
					<label for="chapter_theme" class="formbold-form-label"> Chủ đề </label> <input type="text" name="chapter_theme" id="chapter_theme"
						class="formbold-form-input" required />
				</div>
				<div></div>
				<div class="formbold-input-flex">
					<div>
						<label for="slug" class="formbold-form-label"> Slug </label> <input
							type="text" name="slug" id="slug" class="formbold-form-input"
							required />
					</div>
					
				</div>

				<label for="fileInput" class="btn btn-secondary"
					onclick="showInput()"> Chọn file.txt để thêm <input
					type="file" id="fileInput" accept=".txt" style="display: none;">
				</label> <input type="button" id="showEditorButton"
					class="btn btn-secondary" onclick="showSaveButton()">Hiển
				thị nhập nội dung truyện
				<div>
					<div id="editor"></div>

					<br>
					<button id="saveButton" class="btn btn-secondary"
						style="display: none;">Lưu</button>
				</div>
				    <input type="hidden" name="chapter_content" id="chapter_content">
				   	<input type="hidden" name="story_id" id="chapter_content" value = "${story.get().story_id}">
				    <input type="hidden" name="story_code" id="chapter_content" value = "${story.get().story_code}">
				    
				
			</form>
			<button class="formbold-btn"  onclick = "submitContent()">Đăng bài</button>
			
		</div>
	</div>

	<script
		src="https://cdn.ckeditor.com/ckeditor5/38.1.0/classic/ckeditor.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/turndown/7.0.0/turndown.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/dompurify/2.3.1/purify.min.js"></script>

	<script>
  var fileContent = null;
  var isFileSelected = false;
  var editor;
  


  var editor;

  
  document.getElementById('showEditorButton').addEventListener('click', function() {
	  ClassicEditor
	    .create(document.querySelector('#editor'),{
	    	enterMode: 2
	  })
	    .then(newEditor => {
	    	newEditor.editing.view.document.on('keydown', (event, data) => {
		        if (data.keyCode === 13) {
		          event.stop();
		          editor.execute('enter');

		        }
		      });
	      editor = newEditor;
	    })
	    .catch(error => {
	      console.error(error);
	    });
	  
	  
	  });
//open file txt 
  document.getElementById('fileInput').addEventListener('change', handleFileSelect, false);

  function handleFileSelect(event) {
    var file = event.target.files[0];

    var reader = new FileReader();
    reader.onload = function(e) {
      var textContent = e.target.result;

      
      // Đưa nội dung văn bản vào trình soạn thảo CKEditor
      ClassicEditor
        .create(document.querySelector('#editor'))
        .then(newEditor => {
        	newEditor.setData(textContent.replace(/\n/g, '<br>'));
        	editor = newEditor;
        })
        .catch(error => {
          console.error(error);
        });
    };
    reader.readAsText(file);
  }
  
  //save file to computer from CKEditor
  document.getElementById('saveButton').addEventListener('click', handleSaveClick);

  function handleSaveClick() {
    if (editor) {
      var content = editor.getData();

      // Sử dụng DOMPurify để loại bỏ các thẻ HTML không cần thiết và các ký tự không gian
      var sanitizedContent = DOMPurify.sanitize(content, {
        ALLOWED_TAGS: [],
        ALLOWED_ATTR: []
      });

      // Thay thế các ký tự không gian bằng một xuống dòng duy nhất
      var formattedContent = sanitizedContent.replace(/&nbsp;/g, '\n\n');

      // Tạo đối tượng Blob từ nội dung đã được xử lý
      var blob = new Blob([formattedContent], { type: 'text/plain' });

      // Tạo đường dẫn URL từ Blob
      var url = URL.createObjectURL(blob);

      // Tạo phần tử <a> để tải xuống tệp
      var link = document.createElement('a');
      link.href = url;
      link.download = 'content.txt';

      // Mô phỏng sự kiện nhấp chuột vào phần tử <a>
      var event = new MouseEvent('click');
      link.dispatchEvent(event);
    } else {
      console.log("Editor chưa được khởi tạo.");
    }
  }
  function showSaveButton() {
	    var saveButton = document.getElementById('saveButton');

	    saveButton.style.display = 'block';
	  }
  
  function generateStoryCode() {
		var storyName = document.getElementById("chapter_name").value;
		var rpd = storyName.toLowerCase();
		console.log(rpd);
		var txt =  rpd.replace(/đ/g, "d");
		var storyCode = removeDiacritics(txt).toLowerCase().replace(
				/ /g, "-");
		document.getElementById("slug").value = storyCode;
	}

	function removeDiacritics(str) {
	    return str.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
	}
		
	function submitContent() {
	    const chapterName = document.getElementById('chapter_name').value;
	    const slug = document.getElementById('slug').value;
	    const editorContent = editor.getData();
	    document.getElementById('chapter_content').value = editorContent;
	    document.getElementById('myForm').submit();
	}
  </script>
</body>
</html>
