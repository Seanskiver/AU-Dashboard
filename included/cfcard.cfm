<!-- Top bar and Navigation -->

<link rel="stylesheet" type="text/css" href="css/cardStyle.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<body>
    <div id="page">

        
        
        <!--- QUERY DB FOR ALL RESULTS --->
        <cfquery name="GetAllCards" datasource="MyAuCards" result="allCards">
            USE MyAuCards;
            SELECT *
            FROM dbo.cards
        </cfquery>

        <!--- QUERY USER-SPECIFIC DATA --->
        <cfquery name="GetUserCards" datasource="MyAuCards" result="userCards">
            USE MyAuCards;
            SELECT *
            FROM dbo.user_cards
            WHERE username = '#GetAuthUser()#'
        </cfquery>
        
        <cfif userCards.RecordCount EQ 0>
            <cfloop query="GetAllCards">
                <cfquery datasource="MyAuCards">
                    INSERT INTO user_cards
                    (username,card_id,card_parent,card_position,hidden,card_class)
                     VALUES ('#GetAuthUser()#', #GetAllCards.id#, '#GetAllCards.parentDiv#', '#GetAllCards.position#', #GetAllCards.hidden#, '#GetAllCards.class#');
                </cfquery>
            </cfloop>         
        </cfif>
    <!-- Page Loader -->


        <cfif userCards.RecordCount LT GetAllCards.RecordCount>
            <!--- Gets all rows in the cards table that dont exist in the user_cards table --->
            <cfset count = 1>
            <cfquery name="GetAllMissing" datasource="MyAuCards">
                SELECT * FROM cards
                WHERE 
                <cfloop query="GetUserCards">
                    id != #GetUserCards.card_id#
                    <cfif count LT #GetUserCards.RecordCount#>
                        AND 
                    </cfif>
         
                   <cfset count=#count# +1>
                </cfloop>
            </cfquery>        


            <!--- Loops through each record of the MissingRows query and inserts the rows that are missing from the user_cards table --->
            <cfquery name="insert" datasource="MyAuCards">
                <cfloop query="GetAllMissing">
                    INSERT INTO user_cards (username, card_id, card_parent, card_position, hidden, card_class)
                    VALUES (
                        <cfqueryparam value="#GetAuthUser()#"           cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#GetAllMissing.id#"        cfsqltype="CF_SQL_INTEGER">, 
                        <cfqueryparam value="#GetAllMissing.parentDiv#" cfsqltype="CF_SQL_VARCHAR">, 
                        <cfqueryparam value="#GetAllMissing.position#"  cfsqltype="CF_SQL_INTEGER">, 
                        <cfqueryparam value="#GetAllMissing.hidden#"    cfsqltype="CF_SQL_BIT">, 
                        <cfqueryparam value="#GetAllMissing.class#"     cfsqltype="CF_SQL_VARCHAR">
                    );            
                </cfloop>
            </cfquery>   
        </cfif>


    




    <!-- QUERY DB FOR ALL RESULTS -->
    <cfquery name="cards" datasource="MyAuCards">
        USE MyAuCards;
        SELECT *
        FROM dbo.user_cards
        INNER JOIN cards
        ON user_cards.card_id = cards.id
        WHERE user_cards.hidden = 0
        AND username = '#GetAuthUser()#'
        ORDER BY card_parent, card_position 
    </cfquery>


    <!-- LEFT COLUMN -->
    <cfquery name="left" dbtype="query">
        SELECT * FROM cards
        WHERE card_parent = 'left'
    </cfquery>
    
    <!-- MIDDLE COLUMN -->
    <cfquery name="middle" dbtype="query">
        SELECT * FROM cards 
        WHERE card_parent = 'middle'
    </cfquery>
    
    <!-- RIGHT COLUMN -->
    <cfquery name="right" dbtype="query">
        SELECT * FROM cards
        WHERE card_parent = 'right'
    </cfquery>
    
    <div id="container">
        <!-- LEFT -->
        <ul id="left" class="draggable">
            <cfloop query="left">
            <cfoutput>
                <li class="panel panel-info #Title# " >   
                        <div class="panel-heading">
                            <h3 class="title">#Title#</h3>
                            <div class="controls-ribbon">
                                <div class="controls">
                                    <i class="icon-minus11"></i>
                                        <i class="icon-resize-full-screen" style="opacity:0; position:absolute"></i>

                                    <cfif #closable# EQ 1>
                                        <i class="icon-close3 closeCard"></i>
                                    </cfif>
                                </div>
                            </div>
                        </div>

                        <div class="panel-body #card_class#">
                            <cfif #contentAddr# NEQ "">
                                <div class="content"><cfinclude template="#contentAddr#"></div>
                            <cfelse>
                                <div class="content">#content#</div>
                            </cfif>
                        </div>

                        <div class="arrow-container">
                            <span class="arrow glyphicon glyphicon-chevron-down"></span>
                        </div>
                    </li>   
            </cfoutput> 	
            </cfloop>
        </ul>
        
        <!-- MIDDLE -->
        <ul id="middle" class="draggable large">
            <cfloop query="middle">
            <cfoutput>
                    <li class="panel panel-info #Title#">
                        <div class="panel-heading">
                            <h3 class="title">#Title#</h3>
                            <div class="controls-ribbon">
                                <div class="controls">
                                    <i class="icon-minus11"></i>

                                        <i class="icon-resize-full-screen"></i>


                                    <cfif #closable# EQ 1>
                                        <i class="icon-close3 closeCard"></i>
                                    </cfif>
                                </div>
                            </div>
                        </div>     
                        <div class="panel-body #card_class#">
                            <cfif #contentAddr# NEQ "">
                                <div class="content"><cfinclude template="#contentAddr#"></div>
                            <cfelse>
                                <div class="content">#content#</div>
                            </cfif>
                        </div>

                        <div class="arrow-container">
                            <span class="arrow glyphicon glyphicon-chevron-down"></span>
                        </div>
                    </li>   
            </cfoutput>     	
            </cfloop>
        </ul>
        
        
        <!-- RIGHT -->
        <ul id="right" class="draggable">
            <cfloop query="right">
            <cfoutput>
                    <li class="panel panel-info #Title#">
                        <div class="panel-heading">
                            <h3 class="title">#Title#</h3>
                            <div class="controls-ribbon">
                                <div class="controls">
                                    <i class="icon-minus11"></i>

                                    <i class="icon-resize-full-screen" style="opacity:0; position:absolute"></i>

                                    <cfif #closable# EQ 1>
                                        <i class="icon-close3 closeCard"></i>
                                    </cfif>
                                </div>
                            </div>
                        </div>
                        
                        <div class="panel-body #card_class#">
                            <cfif #contentAddr# NEQ "">
                                <div class="content"><cfinclude template="#contentAddr#"></div>
                            <cfelse>
                                <div class="content">#content#</div>
                            </cfif>
                        </div>

                        <div class="arrow-container">
                            <span class="arrow glyphicon glyphicon-chevron-down"></span>
                        </div>
                            
                    </li>   
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
            handle: '.panel-heading',
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
                    console.log('removeResizing()');
                } else {
                    addResizing(ui.item);
                    console.log('removeResizing()');
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

