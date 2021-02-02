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

function sayDummy() {
  const dummies = document.querySelectorAll('.dummy');
  
  dummies.forEach(function (dummy) {
    dummy.addEventListener('mouseenter', () => {
      $(dummy).children('.fukidashi').animate({ opacity: 1 }, { duration: 200, easing: 'swing' });
    });
    dummy.addEventListener('mouseleave', () => {
      $(dummy).children('.fukidashi').animate({ opacity: 0 }, { duration: 200, easing: 'swing' });
    });
  });
}

window.addEventListener('load', toHow);
window.addEventListener('load', sayDummy);