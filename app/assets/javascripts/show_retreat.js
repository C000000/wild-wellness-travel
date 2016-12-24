$(document).ready(function(){
  $(".ret-tab").on("click", function(e){
    $(".retreat-content").hide();
    $(".ret-tab").removeClass("active");
    $($(this).data("target")).fadeIn(500);
    $(this).addClass("active");
  });

  $(".retreat-pictures > div:first").fadeIn(300);
  setInterval(function() {
  $(".retreat-pictures > div:first").hide("slide", { direction: "left" }, 500)
  .next().show("slide", { direction: "right" }, 500)
  .end().appendTo(".retreat-pictures");
  },  4000);
});
