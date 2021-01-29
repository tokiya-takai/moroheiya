$(function () {
  $('.start_page_container').animate({ opacity: 1 }, { duration: 800, easing: 'swing' });
});

// $(function () {
//   $('.start_page_container').animate({ opacity: 1 }, { duration: 800, easing: 'swing' });
// });

function startButtonClicked() {
  const startButtons = document.querySelectorAll('.start_button');

  startButtons.forEach(function (startButton) {
    startButton.addEventListener('click', () => {
      $('.start_page_container').animate({ opacity: 0 }, { duration: 400, easing: 'swing' });
    });
  });
}

window.addEventListener('load', startButtonClicked);