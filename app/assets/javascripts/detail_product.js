$(window).load(function () {
    // Quick View button
  $('.qview-btn').fancybox({
    content: $('.qview-modal'),
    padding: 0,
    helpers : {
      overlay : {
          locked  : false
      }
    }
  });

    // Product Images Slider
  if ($('.prod-slider-car').length > 0) {
    $('.prod-slider-car').each(function () {
      $(this).bxSlider({
        pagerCustom: $(this).parents('.prod-slider-wrap').find('.prod-thumbs-car'),
        adaptiveHeight: true,
        infiniteLoop: false,
      });
      $(this).parents('.prod-slider-wrap').find('.prod-thumbs-car').bxSlider({
        slideWidth: 5000,
        slideMargin: 8,
        moveSlides: 1,
        infiniteLoop: false,
        minSlides: 5,
        maxSlides: 5,
        pager: false,
      });
    });         
  }

    // Filter
  if ($('.section-filter-ttl').length > 0) {
    $('.section-filter').on('click', '.section-filter-ttl', function () {
      if ($(this).parents('.section-filter-item').hasClass('opened')) {
        $(this).parents('.section-filter-item').removeClass('opened');

      } else {
        $(this).parents('.section-filter-item').addClass('opened');
      }
      return false;
    });
  }
    
    // Product Countdown
  if ($('.countdown').length > 0) {
    $('.countdown').each(function () {
      if (!$(this).data('date')) {
        return;
      }
      var countdown = $(this);
      var BigDay = new Date(countdown.data('date'));
      var msPerDay = 24 * 60 * 60 * 1000 ;
      window.setInterval(function(){
        var today = new Date();
        var timeLeft = (BigDay.getTime() - today.getTime());
        var e_daysLeft = timeLeft / msPerDay;
        var daysLeft = Math.floor(e_daysLeft);
        var e_hrsLeft = (e_daysLeft - daysLeft)*24;
        var hrsLeft = Math.floor(e_hrsLeft);
        var e_minsLeft = (e_hrsLeft - hrsLeft)*60;
        var minsLeft = Math.floor(e_minsLeft);
        var e_secsLeft = (e_minsLeft - minsLeft)*60;
        var secsLeft = Math.floor(e_secsLeft);
        var timeString = daysLeft + "d " + pad(hrsLeft) + ":" + pad(minsLeft) + ":" + pad(secsLeft);
        countdown.html(timeString);
        if (!countdown.hasClass('display')) {
            countdown.addClass('display');
        }
      }, 1000);
    });
  }
});
