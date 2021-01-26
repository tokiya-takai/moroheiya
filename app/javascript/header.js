function userButton() {
  const leftButton = document.getElementById("left-btn");
  const rightButton = document.getElementById("right-btn");

  leftButton.addEventListener('mouseover', () => {
    leftButton.style.backgroundColor = "#7c6060";
  });
  leftButton.addEventListener('mouseout', () => {
    leftButton.style.backgroundColor = "#5a4040";
  });

  rightButton.addEventListener('mouseover', () => {
    rightButton.style.backgroundColor = "#4f4040";
  });
  rightButton.addEventListener('mouseout', () => {
    rightButton.style.backgroundColor = "#2d2020";
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
    })
  })
}

window.addEventListener('load', userButton);
window.addEventListener('load', findList);
window.addEventListener('load', navChoiceUnderBar);