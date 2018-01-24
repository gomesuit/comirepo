import './day-items.sp.scss'
import 'components/usr/item/item.sp'
import Swiper from 'swiper/dist/js/swiper.min'

const swiper = new Swiper ('.day-items--swiper-container', {
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

