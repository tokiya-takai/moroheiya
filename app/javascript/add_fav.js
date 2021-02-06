function add_fav() {
  const normal = document.getElementById('normal')
  const normalNum = document.getElementById('normal_num')

  normal.addEventListener('click', () => {
    if (normalNum.classList.contains('added') == false) {
      normalNum.innerHTML = Number(normalNum.innerHTML) + 1;
      normalNum.classList.add('added');
    }
  })

}
window.addEventListener('load',add_fav)