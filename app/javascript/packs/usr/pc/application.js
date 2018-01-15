import 'lib/bootstrap'
import 'lib/swiper'
import Swiper from 'swiper/dist/js/swiper.min'
import 'components/usr/items/items.pc'
import 'components/usr/counter/counter.pc'

var itemsSwiper = new Swiper ('.swiper-container', {
  slidesPerView: 5.5,
  spaceBetween: 10,
  slidesPerColumn: 2,
  //centeredSlides: true,
  //loop: true,
  //pagination: {
  //  el: '.swiper-pagination',
  //  clickable: true,
  //},
  //scrollbar: {
  //  el: '.swiper-scrollbar',
  //  draggable: true,
  //},
  //navigation: {
  //  nextEl: '.swiper-button-next',
  //  prevEl: '.swiper-button-prev',
  //},
})

var topItemsSwiper = new Swiper ('.top-swiper-container', {
  slidesPerView: 4.5,
  spaceBetween: 10,
  slidesPerColumn: 1,
})
