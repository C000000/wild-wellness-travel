$(document).ready(function(){
	if ($(window).height() / 1.5 < $(".page-wrapper").height()) {
		$(".footer").css("position", "relative");
	} else {
		$(".footer").css("position", "fixed");
	}
});
