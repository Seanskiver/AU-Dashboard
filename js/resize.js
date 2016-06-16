// Find and remove the resizing option of the div
function removeResizing(element) {
	$(element).find('.icon-resize-full-screen').css({
		'position' : 'absolute',
		'opacity': '0',
		'pointer-events': 'none'
	});
	

}

// Adds the resizing option to the div 
function addResizing(element) {
	$(element).find('.icon-resize-full-screen').css({
		'position' : 'relative',
		'opacity': '100',
		'pointer-events': 'auto'
	});


}

// document.ready function to get modules that are less than 400 pixels wide and remove the resizing option 
$(document).ready(function() {
	var panels = $('.panel-info');


		if($('.panel-info').parent().attr('id') == 'middle') {
			console.log('middle');
			addResizing($(this));
		}


	// if ($('.panel-info').css('width') < '400' + 'px') {
	// 	console.log('REady');
	// 	$('.panel-info').find('.icon-resize-full-screen').css({
	// 	'position' : 'absolute',
	// 	'opacity': '0',
	// 	'pointer-events': 'none'
	// });
	//}



});

//



// AJAX CALL back to server
function updateSize(className, title) {
    $.get('./cfc/updatePosition.cfc?method=updateHeight&className='+className+'&title='+title, function(data) {
        console.log(data);  
    });
}



// widen ./ narrow div
$('.icon-resize-full-screen').click(function() {
	$(this).closest('.panel').toggleClass('panel-short', 200);
	

});

 
// Make div taller / smaller
$('.glyphicon-chevron-down').click(function() {

	var className = "";
	var title = $(this).parent().parent().find('.title').text();

	console.log("Title: " + title);
	//console.log($(this).pa('.panel-body').attr('class'));

	console.log($(this).parent().siblings('.panel-body').attr('class'))
	

	if ($(this).parent().siblings('.panel-body').hasClass('short')) {
		$(this).parent().siblings('.panel-body').removeClass('short');
		$(this).parent().siblings('.panel-body').addClass('medium');
		className = 'medium';
		console.log('First If');
	} else if ($(this).parent().siblings('.panel-body').hasClass('medium')) {
		$(this).parent().siblings('.panel-body').removeClass('medium');
		$(this).parent().siblings('.panel-body').addClass('tall');

		// Change Arrow to face upward
		$(this).removeClass('glyphicon-chevron-down');
		$(this).addClass('glyphicon-chevron-up');


		className='tall';
		console.log('Second If');

	} else if ($(this).parent().siblings('.panel-body').hasClass('tall')) {
		$(this).parent().siblings('.panel-body').removeClass('tall');
		$(this).parent().siblings('.panel-body').addClass('short');
		className = 'short';

		// Switch Arrow to face downward
		$(this).removeClass('glyphicon-chevron-up');
		$(this).addClass('glyphicon-chevron-down');
	} else {
		$(this).parent().siblings('.panel-body').addClass('medium');
	}

	updateSize(className, title);
	 		
});


$(function() {
	$('.hideme').hide();
});

