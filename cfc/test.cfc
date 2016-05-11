<cfcomponent>
    <!---Get Switch states will query all from the cards table and return a list of switches with their names and states --->
	<cffunction name="getSwitchStates" access="remote" returnFormat="plain" returntype="string">
		<!--- QUERY DB FOR ALL RESULTS --->
	    <cfquery name="cards" datasource="MyAuCards">
	        SELECT * 
	        FROM cards
	    </cfquery>
        <!---creating the content --->
        <cfsavecontent variable="content">
            <cfoutput>
                <!---Loop throuch the query --->
                <cfloop query="cards">
                    <!---Only get the records that are for test data --->
                    <cfif #cards.type# eq 'test'>
                        <!---choose which state they should be in. On/Off Hidden/NotHidden --->
                        <cfif #cards.hidden# eq 1>
                            <li class="text-center h-20 col-xxs-6 col-exs-4 col-sm-3 col-md-3 col-lg-3"><label for="#cards.title#">#cards.title#</label><br/><input type="checkbox" name="#cards.title#" data-size="small" data-on-text="+" data-off-text="-" data-on-color="success" data-off-color="default"></li>
                        <cfelse>
                            <li class="text-center h-20 col-xxs-6 col-exs-4 col-sm-3 col-md-3 col-lg-3"><label for="#cards.title#">#cards.title#</label><br/><input type="checkbox" checked name="#cards.title#" data-size="small" data-on-text="+" data-off-text="-" data-on-color="success" data-off-color="default"></li>
                        </cfif>
                    </cfif>
                </cfloop>
            </cfoutput>
        </cfsavecontent>
	    <cfreturn content>
    </cffunction>
    <!---This function is called when a switch is fliped or when a card is closed--->
    <cffunction name="updateHidden" access="remote" returnFormat="plain" returntype="string">
        <!---Accept in two arguments from the AJAX call --->
        <cfargument name="cardTitle" default=url.cardTitle>
        <cfargument name="hiddenValue" default=url.hiddenValue>
            <!---See which state we're setting the record too --->
            <cfif hiddenValue eq "false">
                <!---Set the state --->
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
    
    <!---This query is called when the model is being opened and we need to initialze the switches via JS --->
    <!---We need to run this so we can get all of the proper records that relate to the switches --->
    <cffunction name="switchInitialization" access="remote" returnFormat="plain" returntype="any">
		<!--- QUERY DB FOR ALL RESULTS --->
	    <cfquery name="cards" datasource="MyAuCards">
	        SELECT * 
	        FROM cards
	    </cfquery>
        <!---Set the string we pass back --->
        <cfset titleString = ""/>
        <cfoutput>
            <cfloop query="cards">
                <!---Only get the records that are for the test data --->
                <cfif #cards.type# eq 'test'>
                    <!---Concatinate onto the string the title of each record --->
                    <cfset titleString &= "'" & #title# & "'," />
                </cfif>
            </cfloop>
        </cfoutput>
        <cfreturn titleString>
    </cffunction>
    
    <!---You just need to know what it is... --->
    <!---This is suppose to re-populate the cards after a switch changes a record to not hidden aka On. --->
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