// Find and remove the resizing option of the div
function removeResizing(element) {
	console.log('removeResizing()');
	$(element).find('.glyphicon-resize-horizontal').css({
		'position' : 'absolute',
		'opacity': '0',
		'pointer-events': 'none'
	});

}

// Adds the resizing option to the div 
function addResizing(element) {
	console.log('addResizing()');
	$(element).find('.glyphicon-resize-horizontal').css({
		'position' : 'relative',
		'opacity': '100',
		'pointer-events': 'auto'
	});
}

// document.ready function to get modules that are less than 400 pixels wide and remove the resizing option 
$(document).ready(function() {
	if ($('.panel-info').css('width') < '400' + 'px') {
		$('.panel-info').find('.glyphicon-resize-horizontal').css({
		'position' : 'absolute',
		'opacity': '0',
		'pointer-events': 'none'
	});
	}



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
	 // if(parseInt($(this).css('height')) < 500) {
	 // 	//console.log('height: ' + $(this).css('height'));
	 // 	$(this).animate( {
	 // 		height: '+=250'
	 // 		class: 'medium'
	 // 	});
	 // } else{
	 // 	$(this).animate( {
	 // 		height: '53'
	 // 	});
	 // }
	//}
	
	var className = "";
	var title = $(this).parent().parent().find('.title').text();
	console.log("Title: " + title);
	if ($(this).closest('.panel-body').hasClass('short')) {
		$(this).closest('.panel-body').removeClass('short');
		$(this).closest('.panel-body').addClass('medium');
		className = 'medium';
		console.log('First If');
	} else if ($(this).closest('.panel-body').hasClass('medium')) {
		$(this).closest('.panel-body').removeClass('medium');
		$(this).closest('.panel-body').addClass('tall');

		// Change Arrow to face upward
		$(this).closest('.glyphicon').removeClass('glyphicon-chevron-down');
		$(this).closest('.glyphicon').addClass('glyphicon-chevron-up');


		className='tall';
		console.log('Second If');

	} else if ($(this).closest('.panel-body').hasClass('tall')) {
		$(this).closest('.panel-body').removeClass('tall');
		$(this).closest('.panel-body').addClass('short');
		className = 'short';

		// Switch Arrow to face downward
		$(this).closest('.glyphicon').removeClass('glyphicon-chevron-up');
		$(this).closest('.glyphicon').addClass('glyphicon-chevron-down');
	}

	updateSize(className, title);
	 		
});


$(function() {
	$('.hideme').hide();
});

