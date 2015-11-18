$(document).ready(function{
	
	$('.tabs li').click(function(){
	  var c = $(this).attr('data-sec');
	  $('.view .' + c).removeClass('hidden').siblings().addClass('hidden');
	});



	$('#insta').hover(function() {
	  $('#top-bar').toggleClass("insta_color");
	});



	$('#insta').hover(function() {
	  $('#words').toggleClass("insta_color2");
	});



	$('#yelp').hover(function() {
	  $('#top-bar').toggleClass("yelp_color");
	});



	$('#yelp').hover(function() {
	  $('#words').toggleClass("yelp_color2");
	});



	$('#twitter').hover(function() {
	  $('#top-bar').toggleClass("twitter_color");
	});



	$('#twitter').hover(function() {
	  $('#words').toggleClass("twitter_color2");
	});

});
