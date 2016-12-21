$(document).ready(function(){
	if ($(window).height() < $(".page-wrapper").height()) {
		console.log("window < page");
		$(".footer").css("position", "relative");
	} else {
		console.log("page < window");
		$(".footer").css("position", "fixed");
	}
});