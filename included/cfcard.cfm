<!-- Top bar and Navigation -->

<link rel="stylesheet" type="text/css" href="css/cardStyle.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<body>
    <div id="page">
    <!-- Page Loader -->

    
    <!-- QUERY DB FOR ALL RESULTS -->
    <cfquery name="cards" datasource="MyAuCards">
        USE MyAuCards;
        SELECT * 
        FROM dbo.cards
        ORDER BY parentDiv, position
    </cfquery>
    
    <!-- LEFT COLUMN -->
    <cfquery name="left" dbtype="query">
        SELECT * FROM cards
        WHERE parentDiv = 'left'
    	
    </cfquery>
    
    <!-- MIDDLE COLUMN -->
    <cfquery name="middle" dbtype="query">
        SELECT * FROM cards 
        WHERE parentDiv = 'middle'
        
    </cfquery>
    
    <!-- RIGHT COLUMN -->
    <cfquery name="right" dbtype="query">
        SELECT * FROM cards
        WHERE parentDiv = 'right'
        
    </cfquery>
    
    <div id="container">
        <!-- LEFT -->
        <ul id="left" class="draggable">
            <cfloop query="left">
            <cfoutput>
                <cfif #hidden# eq 0>
                    <li class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="title">#Title#</h3>
                            <div class="controls-ribbon">
                                <div class="controls">
                                    <i class="icon-minus11"></i>

                                    <cfif #resizable# EQ 1 AND #parentDiv# NEQ "left" AND #parentDiv# NEQ "right">
                                        <i class="icon-resize-full-screen"></i>
                                    </cfif>

                                    <cfif #closable# EQ 1>
                                        <i class="icon-close3 closeCard"></i>
                                    </cfif>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body #class#">#Content#</div>
                    </li>   
                </cfif>
            </cfoutput> 	
            </cfloop>
        </ul>
        
        <!-- MIDDLE -->
        <ul id="middle" class="draggable large">
            <cfloop query="middle">
            <cfoutput>
                <cfif #hidden# eq 0>
                    <li class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="title">#Title#</h3>
                            <div class="controls-ribbon">
                                <div class="controls">
                                    <i class="icon-minus11"></i>

                                    <cfif #resizable# EQ 1 AND #parentDiv# NEQ "left" AND #parentDiv# NEQ "right">
                                        <i class="icon-resize-full-screen"></i>
                                    </cfif>

                                    <cfif #closable# EQ 1>
                                        <i class="icon-close3 closeCard"></i>
                                    </cfif>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body #class#">#Content#</div>
                    </li>   
                </cfif>
            </cfoutput>     	
            </cfloop>
        </ul>
        
        
        <!-- RIGHT -->
        <ul id="right" class="draggable">
            <cfloop query="right">
            <cfoutput>
                <cfif #hidden# eq 0>
                    <li class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="title">#Title#</h3>
                            <div class="controls-ribbon">
                                <div class="controls">
                                    <i class="icon-minus11"></i>

                                    <cfif #resizable# EQ 1 AND #parentDiv# NEQ "left" AND #parentDiv# NEQ "right">
                                        <i class="icon-resize-full-screen"></i>
                                    </cfif>

                                    
                                    <cfif #closable# EQ 1>
                                        <i class="icon-close3 closeCard"></i>
                                    </cfif>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body #class#">#Content#</div>
                    </li>   
                </cfif>
            </cfoutput>     
            </cfloop>
        </ul>
    </div>
    <!-- /Modules -->
    
    <script>
        $('#left, #middle, #right').sortable( {
            dropOnEmpty: true,
            connectWith: '.draggable',
            placeholder: 'placeholder',
            containment: 'document',
            revert: 'invalid',
            start: function(e, ui) {
                //$( '#sortLeft, #sortRight, #sortMiddle').sortable( "refreshPositions" );
                // $(ui.item).css('top', e.clientY);
                // var position = $(ui.item).position();
                // var offset = $(ui.item).offset();
                // console.log('Item top: ' + (parseInt($(ui.item).css('top')) + offset.top));
                // $(ui.item).css({
                    
                // });
                
                $(ui.helper).addClass('dragging');
            },
        
            // Animates the snap into position
            end: function(e, ui) {
                $(ui.placeholder).hide(100);
                // If the div now belongs to a small column, take away the ability to resize it
                
        
            },
            // ANimates the movement of other elements to get out of the way
            change: function(e, ui) {
                $(ui.placeholder).hide().show(200);	
            },
        
            // When a list receives an element
            receive: function(e, ui) {
                // check the width of the element received
                // If it is less than 300px, it belongs to a narrow column, 
                // and the resizable option is removed with the removeResizing() function
				// Get the positiion of the div that was just dropped.
				var position = $(ui.item).index();
				
				
                if( ui.item.css('width') < 400 + "px" ) {
                    removeResizing(ui.item);
                } else {
                    addResizing(ui.item);
                }
        
                $(ui.item).removeClass('panel-short');
            },
			
			stop: function(e, ui) {
				var position = $(ui.item).index();
				var title = $(ui.item).find('h3').text();
				var parent = $(ui.item).parent().attr('id');

				
                var siblings = $(ui.item).siblings().andSelf();

                for (var i = 0; i < siblings.length; i++) {
                    var title = $(siblings[i]).find('h3').text();
                    var position = $(siblings[i]).index();
                    
                    console.log("name : " + title + " | Position: " + position + " | Parent: " + parent);

                    updatePosition(position, title, parent);

                    
                }
				

                //
				
			}
        });
    
    </script>	
    
    <!-- AJAX -->
    <script>
		function updatePosition(position, title, parent) {
			$.get('./cfc/updatePosition.cfc?method=updatePosition&position='+position+'&title='+title+'&parent='+parent, function(data) {
				console.log(data);	
			});
		}

        // function updateSize(height, title) {
        //     $.get('updatePosition.cfc?method=updateHeight&height='+height+'&title='+title, function(data) {
        //         console.log(data);  
        //     });
        // }
	</script>
</body>
</html>

