$(document).ready(function(){
  $(".retreat-pictures > div:first").fadeIn(300);
  if ($(".retreat-pictures div").length > 1) {
    setInterval(function() {
      $(".retreat-pictures > div:first").hide("slide", { direction: "left" }, 500)
      .next().show("slide", { direction: "right" }, 500)
      .end().appendTo(".retreat-pictures");
    },  4000);
  }

  var $window = $(window),
  $stickyEl = $('.booking-info'),
  elTop = $stickyEl.offset().top;

  $window.scroll(function() {
    $stickyEl.toggleClass('sticky', $window.scrollTop() > elTop);
  });
});
