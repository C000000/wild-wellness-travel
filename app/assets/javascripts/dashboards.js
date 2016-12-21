$(document).ready(function(){
  $(".dashboard-btn").on("click", function(e){
    $(".dashboard-content").hide();
    $(".dashboard-btn").removeClass("active");
    $($(this).data("target")).show();
    $(this).addClass("active");
  });
});
