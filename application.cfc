<cfcomponent>
	

	<cfset THIS.SessionManagement = true />
	<cfset THIS.SessionTimeout = CreateTimeSpan( 0, 0, 1000, 0 ) />
    <cfset THIS.SetClientCookies = true />

<cffunction name="OnRequestStart"> 
    <cfargument name="request" required="true"/> 
        
        <cfset THIS.SessionManagement = true />
        <cfset THIS.setclientcookies = true />
            
        <cfif IsDefined("Form.logout")> 
            <cflogout> 
        </cfif> 
     
        <cflogin> 
            <cfif NOT IsDefined("cflogin")> 
                <cfinclude template="loginform.cfm"> <cfabort> 
            <cfelse> 
                <cfif cflogin.name IS "" OR cflogin.password IS ""> 
                    <cfoutput> 
                        <h2>You must enter text in both the User Name and Password fields. 
                        </h2> 
                    </cfoutput> 
                    <cfinclude template="loginform.cfm"> 
                    <cfabort> 
                <cfelse> 
                    <cfset userSuffix = "@alfred.edu" /> 
                    <cfset LDAP_user = cflogin.name />
                    <cfset LDAP_username = cflogin.name&#userSuffix# /> 
                    <cfset LDAP_Pass = cflogin.password />
                    
                    <cftry>
                    <cfsilent>
                                <cfldap action="QUERY"
                                    name="Auth"
                                    attributes="givenname,samaccountname,sn,dn,cn,mail"
                                    start="dc=alfred,dc=edu"
                                    maxrows="1"
                                    scope="subtree"
                                    filter="(&(objectclass=user)(samaccountname=#cflogin.name#))"
                                    server="ldap.alfred.edu"
                                    username="#LDAP_username#"
                                    password="#LDAP_Pass#" />
                    </cfsilent>
                    
                    
                    <cfif Auth.recordcount> 
                        <cfloginuser name="#LDAP_user#" Password="#LDAP_Pass#" roles=""> 
                    <cfelse>
                        <cfinclude template="loginform.cfm"> 
                        <script>alert("Invalid username and password. Please try again.");</script>
                        <cfabort>
                    </cfif>
                            
                    <cfcatch type="any">
                        <cfinclude template="loginform.cfm"> 
                        <script>alert("Invalid username and password. Please try again.");</script>
                        <cfabort>
                    </cfcatch>
                    </cftry>
                    
                </cfif>     
            </cfif> 
        </cflogin> 
  
    

    <!--- Checks if user is using a mobile browser --->

<cfif isDefined("SESSION.mobile")>
        <!--- do nothing if it is defined --->
<cfelse>
	<cfset mobileDetection = CreateObject("component", "includes.utilities.mobileDetection").init() />
	<cfif mobileDetection.isMobile()>
		<script type="text/javascript">
    
        var choice = confirm("Click OK to be directed to the mobile AU website.");
        if(choice == true){
            <cfif findnocase("dev", server_name)>
                <cfset SESSION.mobile = TRUE>
                <cfset THIS.Name = "MobileUsers" />
                window.location = "http://dev-m.alfred.edu";
            <cfelse>			
                <cfset SESSION.mobile = TRUE>
                <cfset THIS.Name = "MobileUsers" />
                window.location = "http://m.alfred.edu";
             
            </cfif>
        } else {
            <cfif findnocase("dev", server_name)>
                <cfset SESSION.mobile = FALSE>
            <cfelse>
                <cfset SESSION.mobile = FALSE>
            </cfif>
        }       
        </script>
	</cfif> 


	</cfif>
    
    
    
    

</cffunction>

<cffunction name="onSessionStart">

	<Cfif CGI.SCRIPT_NAME contains '/webboards'>
    	<cfif GetAuthUser() NEQ ""> 
                <cfinclude template="lay_annoucemnts.cfm">
        </cfif> 
    </Cfif>
</cffunction> 

</cfcomponent>