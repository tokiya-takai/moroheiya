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

// ファイル名を表示
$(function () {
  $('#thumbnail').on("change", function () {
    var file = this.files[0];
    const fileName = document.getElementById("file-name");
    console.log(file);
    if (file != null) {
      fileName.insertAdjacentHTML('afterend', file.name);
    }
  });
});

window.addEventListener('load', startButtonClicked);