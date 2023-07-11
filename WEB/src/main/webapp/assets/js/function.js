
function sendParameters(start, end) {
  var form = document.createElement("form");
  form.setAttribute("method", "GET");
  form.setAttribute("action", "/top-chapter");

  var startInput = document.createElement("input");
  startInput.setAttribute("type", "hidden");
  startInput.setAttribute("name", "start");
  startInput.setAttribute("value", start);
  form.appendChild(startInput);

  var endInput = document.createElement("input");
  endInput.setAttribute("type", "hidden");
  endInput.setAttribute("name", "end");
  endInput.setAttribute("value", end);
  form.appendChild(endInput);

  document.body.appendChild(form);
  form.submit();
}
function toggleChapterSelect() {
    var button = document.querySelector('.chapter_jump');
    var button1 = document.querySelector('.change_jump');

    var select = document.querySelector('#chapterSelect');
    var select1 = document.querySelector('#chapterSelect1');
    
    button.style.display = 'none';
    button1.style.display = 'none';
    select.style.display = 'block';
    select1.style.display = 'block';
  }
 //choose chappter before
 var chapterSelect = document.getElementById('chapterSelect');
  var storedChapter = localStorage.getItem('selectedChapter');
   
  // Khôi phục tùy chọn trước đó nếu có
  if (storedChapter ) {
    var index = Array.from(chapterSelect.options).findIndex(function(option) {
      return option.value === storedChapter;
    });
    if (index !== -1) {
      chapterSelect.selectedIndex = index;
    }
  }
  
  chapterSelect.onchange = function() {
    var selectedOption = chapterSelect.options[chapterSelect.selectedIndex];
    var link = selectedOption.value;
    
    if (link !== '' ) {
      // Lưu tùy chọn được chọn vào Local Storage
      localStorage.setItem('selectedChapter', link);
      window.location.href = link;
    }
  };
  
   //choose chappter after
   var chapterSelect1 = document.getElementById('chapterSelect1');

  // Khôi phục tùy chọn trước đó nếu có
  if (storedChapter) {
    var index = Array.from(chapterSelect1.options).findIndex(function(option) {
      return option.value === storedChapter;
    });
    if (index !== -1) {
      chapterSelect1.selectedIndex = index;
    }
  }
  
  chapterSelect1.onchange = function() {
    var selectedOption = chapterSelect1.options[chapterSelect1.selectedIndex];
    var link = selectedOption.value;
    
    if (link !== '' ) {
      // Lưu tùy chọn được chọn vào Local Storage
      localStorage.setItem('selectedChapter', link);
      window.location.href = link;
    }
  };
  
  function updateSelectedOption(element) {
    var link = element.getAttribute("href");

    if (link !== '') {
      var selectElement = document.getElementById("chapterSelect");
      for (var i = 0; i < selectElement.options.length; i++) {
        if (selectElement.options[i].value === link) {
          selectElement.options[i].selected = true;
          break;
        }
      }

      localStorage.setItem("selectedChapter", link);
    }
  }

  // Đặt lại giá trị option từ localStorage khi trang được tải
  if (storedChapter) {
    var selectElement = document.getElementById("chapterSelect");
    for (var i = 0; i < selectElement.options.length; i++) {
      if (selectElement.options[i].value === savedOption) {
        selectElement.options[i].selected = true;
        break;
      }
    }
  }
  
  