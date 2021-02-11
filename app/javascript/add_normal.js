function favorite() {
  const normal = document.getElementById('normal');
  const normalNum = document.getElementById('normal_num');

  normal.addEventListener('click', () => {
    if (normal.classList.contains('added') == false) {
      normalNum.innerHTML = Number(normalNum.innerHTML) + 1;
      normal.classList.add('added');
    }
  });
}
window.addEventListener('load', favorite);