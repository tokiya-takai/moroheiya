function userButton() {

  const signInButton = document.querySelector('.sign_in_button');
  const signUpButton = document.querySelector('.sign_up_button');

  signInButton.addEventListener('mouseover', () => {
    signInButton.style.borderBottom = "2px solid #2d2020";
  });
  signInButton.addEventListener('mouseout', () => {
    signInButton.style.borderBottom = "none";
  });

  signUpButton.addEventListener('mouseover', () => {
    signUpButton.style.borderBottom = "2px solid #2d2020";
  });
  signUpButton.addEventListener('mouseout', () => {
    signUpButton.style.borderBottom = "none";
  });
}

function findList() {

  const find = document.getElementById("find");
  const findList = document.getElementById("find-list");
  const findListZone = document.getElementById("find-list-zone")
  const showLater = document.getElementById("show-later");

  //ファインドリストの開閉
  find.addEventListener('click', () => {
    if (findListZone.classList.contains("open_list") === false) {
      findListZone.classList.add("open_list");
      findList.style.display = "inline";
      $(".find_list_container").animate({ height: "300px" }, 200);
      showLater.style.display = "inline";
    } else {
      findListZone.classList.remove("open_list");
      showLater.style.display = "none";
      $(".find_list_container").animate({ height: "0px" }, 200);
      const promise = new Promise((resolve) => {
        setTimeout(() => {
          resolve();
        },200)
      })
      promise.then(() => {
        findList.style.display = "none";
      });
    }
  });
  
  //外側をクリックした場合はファインドリストを閉じる
  document.addEventListener('click', (e) => {
    if (!e.target.closest('#find') && !e.target.closest('#find-list-zone')) {
      findListZone.classList.remove("open_list");
      
      showLater.style.display = "none";
      $(".find_list_container").animate({ height: "0px" }, 200);
      const promise = new Promise((resolve) => {
        setTimeout(() => {
          resolve();
        },200)
      })
      promise.then(() => {
        findList.style.display = "none";
      });
    }
  })
}


//ホバーしたファインドリストを少し透過する
function listItemOpacity() {
  const listItems = document.querySelectorAll('.list_item');

  listItems.forEach(function (listItem) {
    listItem.addEventListener('mouseover', () => {
      listItem.style.opacity = 0.7;
    });
    listItem.addEventListener('mouseout', () => {
      listItem.style.opacity = 1;
    });
  });
}

// クリックしたらユーザーメニューが表示される
function openUserMenu() {
  const userButton = document.getElementById('user-button');
  const userMenu = document.getElementById('user-menu');

  userButton.addEventListener('click', () => {
    if (userButton.classList.contains('open_menu') === false) {
      userButton.classList.add('open_menu');
      userMenu.style.display = 'block';
    } else {
      userButton.classList.remove('open_menu');
      userMenu.style.display = 'none';
    }
  });
  document.addEventListener('click', (e) => {
    if (!e.target.closest('#user-button') && (!e.target.closest('#user-menu'))) {
      userButton.classList.remove("open_menu");
      userMenu.style.display = "none";
    }
  });
}

// 使い方GitHubへのアクセスを確認する
function confirmAccess() {
  const toGit = document.querySelector(".to_git");
  const dialog = document.getElementById("dialog");
  const yesButton = document.getElementById("yes");
  const noButton = document.getElementById("no");
  const dialogBackground = document.getElementById("dialog-background");
  const path = "https://github.com/tokiya-takai/moroheiya";

  //スクロール禁止の関数
  function noScroll(event) {
    event.preventDefault();
  }
  //ダイアログの処理
  toGit.addEventListener('click', () => {
    //ダイアログを表示
    dialogBackground.style.display = "block";
    //スクロールを禁止
    document.addEventListener('touchmove', noScroll, { passive: false });
    document.addEventListener('mousewheel', noScroll, { passive: false });
    //はいを押すとGitのページへ遷移
    yesButton.addEventListener('click', () => {
      window.location.href = path;
      dialogBackground.style.display = "none";
    });
    //いいえを押すとダイアログを閉じる
    noButton.addEventListener('click', () => {
      dialogBackground.style.display = "none";
      //スクロール禁止を解除
      document.removeEventListener('touchmove', noScroll, { passive: false });
      document.removeEventListener('mousewheel', noScroll, { passive: false });
    });
  })
}


window.addEventListener('load', userButton);
window.addEventListener('load', findList);
window.addEventListener('load', listItemOpacity);
window.addEventListener('load', openUserMenu);
window.addEventListener('load', confirmAccess);
