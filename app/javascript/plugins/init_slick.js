import $ from 'jquery';
window.$ = window.jQuery = $;
import 'slick-carousel';


// const reviews = document.querySelectorAll('.card-review');

const slick = () => {
    $(document).ready(function(){
      $('.property-photos').slick({
        slidesToShow: 3,
        dots:true,
        arrows: true,
        centerMode: true,
        focusOnSelect: true
      });
      // $('.review-content-container').slick({
      //   dots: true,
      //   vertical: true,
      //   slidesToScroll: reviews.length,
      //   slidesToShow: 1,
      //   verticalSwiping: true,
      // });
    });
}

export { slick };
