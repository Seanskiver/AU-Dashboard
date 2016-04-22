<cfcomponent>
	<cffunction name="updatePosition" access="remote" returnFormat="plain" returntype="string">
    	<cfargument name="position" default=url.position>
        <cfargument name="title" default=url.title>
        <cfargument name="parent" default=url.parent>
        
        <cfquery name="shiftDown" datasource="MyAuCards">
            UPDATE cards SET position = ABS(position+1)
            WHERE position >= <cfqueryparam value="#position#">
        </cfquery>

        <cfquery name="shiftUp" datasource="MyAuCards">
            UPDATE cards SET position = ABS(position-1)
            WHERE position <= <cfqueryparam value="#position#">
        </cfquery>

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

    <cffunction name="updateHeight" access="remote" returnFormat="plain" returnType="string">
        <cfargument name="className" default=url.className>
            <cfargument name="title" default=url.title>

        <cfquery name="Height" datasource="MyAuCards">
            UPDATE cards 
            SET class = <cfqueryparam value="#className#">
            WHERE title = <cfqueryparam value="#title#">
        </cfquery>

        <cfoutput>  
            Title: #title#
            Class: #className#
        </cfoutput>
    </cffunction>
</cfcomponent>