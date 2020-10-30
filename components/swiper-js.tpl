
{%- if has_swiper == true -%}
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/5.4.5/js/swiper.min.js" integrity="sha512-VHsNaV1C4XbgKSc2O0rZDmkUOhMKPg/rIi8abX9qTaVDzVJnrDGHFnLnCnuPmZ3cNi1nQJm+fzJtBbZU9yRCww==" crossorigin="anonymous"></script>
  <script>
    initSwiper();

    $( window ).resize(function() {
      initSwiper();
    });



    function initSwiper() {
      {%- if editmode -%}
        var conditionalBool = false;
        var autoPlay = false;
      {%- else -%}
        var conditionalBool = true;
        var autoPlay = {delay: 3000, disableOnInteraction: true};
      {%- endif -%}

      if ($('.swiper-container').length > 0) {
        var swiper = new Swiper('.swiper-container', {
          preloadImages: false,
          lazy: {
            loadPrevNext: true,
            loadPrevNextAmount: 2,
          },
          dynamicBullets: true,
          grabCursor: conditionalBool,
          loop: true,
          centeredSlides: true,
          autoplay: autoPlay,
          pagination: {
            el: '.swiper-pagination',
            clickable: true
          },
          navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
          },
          keyboard: {
            enabled: true,
            onlyInViewport: false,
          },
          effect: 'fade',
          fadeEffect: { crossFade: true },
          speed: 1000,
          parallax: true,
          allowTouchMove: conditionalBool,
          slideToClickedSlide: conditionalBool
        });
      }
    }
  </script>
{%- endif -%}
