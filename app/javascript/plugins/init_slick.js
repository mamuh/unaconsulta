import $ from 'jquery';
import 'slick-carousel';

const reviews = document.querySelectorAll('.card-review');

const slick = () => {
  $(document).ready(function(){
    $('.property-photos').slick({
      slidesToShow: 3,
      dots:true,
      centerMode: true,
      focusOnSelect: true
    });
    $('.review-content-container').slick({
      vertical: true,
      verticalSwiping: true,
      slidesToShow: 2,
      slidesToScroll: reviews.length,
      swipeToSlide: true
    });
    // $('.thumb-photos').slick({
    //   dots: true,
    //   slidesToScroll: reviews.length,
    //   swipeToSlide: true,
    //   slidesToShow: 4
    // });
  });
}

export { slick };