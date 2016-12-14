$(document).ready(function(){
	$("#landing-wrapper").fadeIn(1000);
	$(".back-layer > div:gt(0)").hide();
	setInterval(function() { 
		$('.back-layer > div:first')
		.fadeOut(1000)
		.next()
		.fadeIn(1000)
		.end()
		.appendTo('.back-layer');
	},  4000);
})