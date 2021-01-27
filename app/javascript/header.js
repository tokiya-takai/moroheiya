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
    if (!e.target.closest('#find')) {
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

//ホバーしたナビゲーションに印を付ける
function navChoiceUnderBar() {
  const navItems = document.querySelectorAll('.nav_items');

  navItems.forEach(function (navItem) {
    navItem.addEventListener('mouseover', () => {
      navItem.classList.add('nav_item_border');
    });
    navItem.addEventListener('mouseout', () => {
      navItem.classList.remove('nav_item_border');
    });
  });
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

window.addEventListener('load', userButton);
window.addEventListener('load', findList);
window.addEventListener('load', navChoiceUnderBar);
window.addEventListener('load', listItemOpacity);