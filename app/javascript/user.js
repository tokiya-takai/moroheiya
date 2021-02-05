// ユーザープロフィール表示ボタン
$(function () {
  const userProfile = document.querySelector('.user_profile');

  $('.rotation_arrow').on('click', function () {
    if (this.classList.contains('up') == false) {
      this.classList.add('up');
      $(this)
      .css({ top: 0 })
      .animate2({ transform: 'rotate(180deg)' }, 100);
      const profileHeight = userProfile.getBoundingClientRect().height;
      console.log(profileHeight);
      $('.user_profile_container').animate({ height: `${profileHeight}px` }, { duration: 300, easing: 'swing' });
    } else {
      this.classList.remove('up');
      $(this)
      .css({ top: 100 })
      .animate2({ transform: 'rotate(0deg)' }, 100);
      $('.user_profile_container').animate({ height: '100px' }, { duration: 300, easing: 'swing' });
    }
  });
});

$.fn.animate2 = function (properties, duration, ease) {
  ease = ease || 'ease';
  var $this = this;
  var cssOrig = { transition: $this.css('transition') };
  return $this.queue(next => {
      properties['transition'] = 'all ' + duration + 'ms ' + ease;
      $this.css(properties);
      setTimeout(function () {
          $this.css(cssOrig);
          next();
      }, duration);
  });
};

// 選択した画像を表示
$(function() {
  $('#user-image').on('change', function(e) {
      var file = e.target.files[0];
      // ブラウザ上でのみ有効なローカルなURLを取得する
      var blobUrl = window.URL.createObjectURL(file);

    $('.attr_user_image').attr('src', blobUrl);
    $('#image-delete-message').val('false');
  });
});

$(function () {
  $('.delete_user_image').on('click', function () {
    $('.attr_user_image').attr('src', '/assets/user_icon.svg');
    $('#image-delete-message').val('true');
  });
});