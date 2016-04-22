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
$('.panel-body').click(function() {
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
	var title = $(this).parent().find('h3').text();

	if ($(this).hasClass('short')) {
		$(this).removeClass('short');
		$(this).addClass('medium');
		className = 'medium';
	} else if ($(this).hasClass('medium')) {
		$(this).removeClass('medium');
		$(this).addClass('tall');
		className='tall';

	} else if ($(this).hasClass('tall')) {
		$(this).removeClass('tall');
		$(this).addClass('short');
		className = 'short';
	}

	updateSize(className, title);
	 		
});



