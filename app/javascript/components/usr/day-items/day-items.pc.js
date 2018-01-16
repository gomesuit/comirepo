import './day-items.pc.scss'
import 'components/usr/slide-items/slide-items.pc'
import Swiper from 'swiper/dist/js/swiper.min'

const swiper = new Swiper ('.day-items--swiper-container', {
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
