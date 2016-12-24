$(document).ready(function(){
  $(".dash-tab").on("click", function(e){
    $(".dashboard-content").hide();
    $(".dash-tab").removeClass("active");
    $($(this).data("target")).show();
    $(this).addClass("active");
  });
});
