import './top-items.sp.scss'
import Swiper from 'swiper/dist/js/swiper.min'

var topItemsSwiper = new Swiper ('.top-swiper-container', {
  slidesPerView: 3.5,
  spaceBetween: 10,
  slidesPerColumn: 1,
})
