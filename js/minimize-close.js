// minimize div
$('.icon-minus11').click(function() {
	 var panelBody = $(this).closest('.panel').find('.panel-body');
	// if(parseInt(panelBody.css('height')) == 0) {
	// 	panelBody.animate({
	// 		'height': 52,
	// 		'opacity': 100,
	// 		'padding' : 15
	// 	});
	// } else {
	// 	panelBody.animate({
	// 		'height': 0,
	// 		'overflow': 'hidden',
	// 		'padding': 0,
	// 		'opacity': 0
	// 	})
	// }

	$(panelBody).toggleClass('minimized');
	
});


//close div
//$('.icon-close3').click(function() {
//	// triggers animation to hide the div, then quietly removes it from the DOM
//	$(this).closest('.panel').hide(700, function(){ 
//		$(this).closest('.panel').remove(); 
//	});
//});
