// css
import 'src/bootstrap'
import 'src/swiper'
import 'src/usr/pc/items_slider.scss'

// js
import 'bootstrap/dist/js/bootstrap.min'
var itemsSwiper = new Swiper ('.swiper-container', {
  slidesPerView: 5.5,
  spaceBetween: 10,
  slidesPerColumn: 2,
  //centeredSlides: true,
  //loop: true,
  pagination: {
    el: '.swiper-pagination',
    clickable: true,
  },
  scrollbar: {
    el: '.swiper-scrollbar',
    draggable: true,
  },
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  },
})
