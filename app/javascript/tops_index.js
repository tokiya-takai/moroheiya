$(function () {
  $('.catch_copy').animate({ opacity: 1 }, { duration: 800, easing: 'swing' });
});

function toHow() {
  const toHow = document.getElementById('to-how');
  const how = document.getElementById('how');

  toHow.addEventListener('click', () => {
    if (how == null) {
      return false;
    }
    how.scrollIntoView({
      behavior: 'smooth',
      block: 'start'
    });
  });
}

window.addEventListener('load', toHow);