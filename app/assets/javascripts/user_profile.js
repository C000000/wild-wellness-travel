$(document).ready(function(){
	$(".tab").on("click", function(e){
		$(".tab-content").hide();
		$(".tab").removeClass("active");
		$($(this).data("target")).fadeIn(500);
		$(this).addClass("active");
	});
});
