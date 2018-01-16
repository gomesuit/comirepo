import './top-items.pc.scss'
import 'components/usr/slide-items/slide-items.pc'
import Swiper from 'swiper/dist/js/swiper.min'

const swiper = new Swiper ('.top-items--swiper-container', {
  slidesPerView: 4.5,
  spaceBetween: 10,
  slidesPerColumn: 1,
})
