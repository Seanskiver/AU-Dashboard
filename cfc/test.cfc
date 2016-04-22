<cfcomponent>
	<cffunction name="getCardsQuery" access="remote" returnFormat="plain" returntype="string">
		<!--- QUERY DB FOR ALL RESULTS --->
	    <cfquery name="cards" datasource="MyAuCards">
	        SELECT * 
	        FROM cards
	    </cfquery>
        <cfsavecontent variable="content">
            <cfoutput>
                <cfloop query="cards">
                    <cfif #cards.type# eq 'test'>
                        <cfif #cards.hidden# eq 1>
                            <li class="text-center h-20 col-xxs-6 col-exs-4 col-sm-3 col-md-3 col-lg-3"><label for="#cards.id##cards.title#">#cards.title#</label><br/><input type="checkbox" name="#cards.id##cards.title#" data-size="small" data-on-text="+" data-off-text="-" data-on-color="success" data-off-color="default"></li>
                        <cfelse>
                            <li class="text-center h-20 col-xxs-6 col-exs-4 col-sm-3 col-md-3 col-lg-3"><label for="#cards.id##cards.title#">#cards.title#</label><br/><input type="checkbox" checked name="#cards.id##cards.title#" data-size="small" data-on-text="+" data-off-text="-" data-on-color="success" data-off-color="default"></li>
                        </cfif>
                    </cfif>
                </cfloop>
            </cfoutput>
        </cfsavecontent>
	    <cfreturn content>
    </cffunction>
    <cffunction name="updateHidden" access="remote" returnFormat="plain" returntype="string">
        <cfargument name="cardTitle" default=url.cardTitle>
        <cfargument name="hiddenValue" default=url.hiddenValue>
            <cfif hiddenValue eq "false">
                <cfquery name="cards" datasource="MyAuCards">
                    UPDATE cards
                    SET hidden = 0
                    WHERE title = <cfqueryparam value="#cardTitle#">
                </cfquery>        
            <cfelse>
                <cfquery name="cards" datasource="MyAuCards">
                    UPDATE cards
                    SET hidden = 1
                    WHERE title = <cfqueryparam value="#cardTitle#">
                </cfquery>
            </cfif>
    </cffunction>
    
    <cffunction name="updatePosition" access="remote" returnFormat="plain" returntype="string">
    	<cfargument name="position" default=url.position>
        <cfargument name="title" default=url.title>
        <cfargument name="parent" default=url.parent>
        
        <cfquery name="update" datasource="MyAuCards">
        	UPDATE cards 
            SET position = <cfqueryparam value="#position#">, parentDiv = <cfqueryparam value="#parent#">
            WHERE title = <cfqueryparam value="#title#">
        </cfquery>
        
        <cfoutput>
        	Position: #position#
            Title: #title#
            Parent: #parent#
        </cfoutput>
        
    </cffunction>
    <cffunction name="gushingGrannnies" access="remote" returnFormat="plain" returntype="string">
        <cfquery name="cards" datasource="MyAuCards">
	        SELECT * 
	        FROM cards
	    </cfquery>
        
        <!--- LEFT COLUMN --->
        <cfquery name="left" dbtype="query">
            SELECT * FROM cards
            WHERE parentDiv = 'left'

        </cfquery>

        <!--- MIDDLE COLUMN --->
        <cfquery name="middle" dbtype="query">
            SELECT * FROM cards 
            WHERE parentDiv = 'middle'

        </cfquery>

        <!--- RIGHT COLUMN --->
        <cfquery name="right" dbtype="query">
            SELECT * FROM cards
            WHERE parentDiv = 'right'

        </cfquery>

        <cfoutput> <!---Start Page Generation Content--->
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

            <!--- MIDDLE --->
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


            <!--- RIGHT --->
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
        </cfoutput> <!---END PAGE CONTENT GENERATION THINGY THING.--->
        
    </cffunction>
</cfcomponent>