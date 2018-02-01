$(document).ready(function () {
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

  if ($('.range-slider').length > 0) {
    $('.range-slider').each(function () {
      var range_slider = $(this);
      $(range_slider).ionRangeSlider({
        type: "double",
        grid: range_slider.data('grid'),
        min: range_slider.data('min'),
        max: range_slider.data('max'),
        from: range_slider.data('from'),
        to: range_slider.data('to'),
        prefix: range_slider.data('prefix')
      });
    });
  }
});