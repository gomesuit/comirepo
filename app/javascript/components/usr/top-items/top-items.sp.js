import './top-items.sp.scss'
import 'components/usr/item/item.sp'
import Swiper from 'swiper/dist/js/swiper.min'

const swiper = new Swiper ('.top-items--swiper-container', {
  slidesPerView: 3.5,
  spaceBetween: 10,
  slidesPerColumn: 1,
})
