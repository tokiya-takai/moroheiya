function userButton() {
  // const leftButton = document.getElementById("left-btn");
  // const rightButton = document.getElementById("right-btn");
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

  find.addEventListener('mouseover', () => {
    find.classList.add('nav_item_border');
    findList.style.display = "inline";
  });
  find.addEventListener('mouseout', () => {
    find.classList.remove('nav_item_border');
    findList.style.display = "none";
  });
  findListZone.addEventListener('mouseover', () => {
    find.classList.add('nav_item_border');
    findList.style.display = "inline";
  });
  findListZone.addEventListener('mouseout', () => {
    find.classList.remove('nav_item_border');
    findList.style.display = "none";
  });
}

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