import bulmaCarousel from 'bulma-carousel/dist/js/bulma-carousel.min.js';

// Initialize all elements with carousel class.
const carousels = bulmaCarousel.attach('.carousel', carouselOptions);

const carouselOptions = {
  slidesToScroll: 1,
  slidesToShow: 1,
  infinite: true,
  autoplay: true,
  pagination: false,
}

document.querySelector(".slider-container").style.width = "auto";
document.querySelectorAll(".slider-item").forEach(item => { item.style.width = "auto"; });

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