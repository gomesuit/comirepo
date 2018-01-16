import './top-items.sp.scss'
import Swiper from 'swiper/dist/js/swiper.min'

var itemsSwiper = new Swiper ('.swiper-container', {
  slidesPerView: 2.5,
  spaceBetween: 10,
  slidesPerColumn: 2,
  //centeredSlides: true,
  //loop: true,
  freeMode: true,
  pagination: {
    el: '.swiper-pagination',
    type: 'progressbar',
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

var topItemsSwiper = new Swiper ('.top-swiper-container', {
  slidesPerView: 3.5,
  spaceBetween: 10,
  slidesPerColumn: 1,
})