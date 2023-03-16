
const navBar = document.getElementById('navBar');

window.addEventListener('scroll', () => {
  if (window.pageYOffset > 50) {
    navBar.style.backgroundColor = '#fff';
  } else {
    navBar.style.backgroundColor = '#333';
  }
});