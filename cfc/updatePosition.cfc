<cfcomponent>
	<cffunction name="updatePosition" access="remote" returnFormat="plain" returntype="string">
    	<cfargument name="position" default=url.position>
        <cfargument name="title" default=url.title>
        <cfargument name="parent" default=url.parent>
        
        <cfquery name="shiftDown" datasource="MyAuCards">
            UPDATE user_cards SET card_position = ABS(card_position+1)
            WHERE card_position >= <cfqueryparam value="#position#">
        </cfquery>

        <cfquery name="shiftUp" datasource="MyAuCards">
            UPDATE user_cards SET card_position = ABS(card_position-1)
            WHERE card_position <= <cfqueryparam value="#position#">
        </cfquery>

        <cfquery name="update" datasource="MyAuCards">
            UPDATE UC
            SET UC.card_position = <cfqueryparam value="#position#">, UC.card_parent = <cfqueryparam value="#parent#">
            FROM dbo.user_cards AS UC
            INNER JOIN dbo.cards as C
                ON UC.card_id = C.id
            WHERE C.title = <cfqueryparam value="#title#">
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
            UPDATE UC
            SET UC.card_class = <cfqueryparam value="#className#">
            FROM dbo.user_cards AS UC
            INNER JOIN dbo.cards as C
                ON UC.card_id = C.id
            WHERE C.title = <cfqueryparam value="#title#">
        </cfquery>

        <cfoutput>  
            Title: #title#
            Class: #className#
        </cfoutput>
    </cffunction>
</cfcomponent>