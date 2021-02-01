// ページをフェード
$(function () {
  $('.start_page_container').animate({ opacity: 1 }, { duration: 800, easing: 'swing' });
});
function startButtonClicked() {
  const startButtons = document.querySelectorAll('.start_button');

  startButtons.forEach(function (startButton) {
    startButton.addEventListener('click', () => {
      $('.start_page_container').animate({ opacity: 0 }, { duration: 400, easing: 'swing' });
    });
  });
}

// ファイル名を表示（コンテスト開催）
$(function () {
  $('#thumbnail').on("change", function () {
    var file = this.files[0];
    const fileName = document.getElementById("file-name");
    if (file != null) {
      fileName.insertAdjacentHTML('afterbegin', file.name);
    }
  });
});

// ファイル名を表示（作品を投稿）
$(function () {
  $('#work-file').on("change", function () {
    var file = this.files[0];
    const fileName = document.getElementById("work-file-name");
    if (file != null) {
      fileName.insertAdjacentHTML('afterbegin', file.name);
    }
  });

  $('#work-thumbnail').on("change", function () {
    var file = this.files[0];
    const fileName = document.getElementById("work-thumbnail-name");
    if (file != null) {
      fileName.insertAdjacentHTML('afterbegin', file.name);
    }
  });

  $('#work').on("change", function () {
    var file = this.files[0];
    const fileName = document.getElementById("work-name");
    if (file != null) {
      fileName.insertAdjacentHTML('afterbegin', file.name);
    }
  });
});

window.addEventListener('load', startButtonClicked);