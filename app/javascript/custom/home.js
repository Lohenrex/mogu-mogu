const toggleBurger = () => {
  let burgerIcon = document.querySelector('.burger');
  let dropMenu = document.querySelector('#navbarMenu');
  burgerIcon.classList.toggle('is-active');
  dropMenu.classList.toggle('is-active');
};

document.addEventListener("turbo:load", () => {
  document.querySelector('.burger').addEventListener('click', () =>{
    toggleBurger();
  });
});