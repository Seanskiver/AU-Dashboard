<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script>
	init = function(){
		$('#j_username').focus();
		setTimeout(function(){
			$('#j_username').focus()
			}, 500);
	}
</script>

<script>
function set_focus(){
	$('#j_username').focus();
}
<!---
function validate_fields(){
	if($('#j_password').val().length >= 10 && $('#j_username').val().length >= 3){
		$('#login_button').removeAttr('disabled');
	}
	else if($('#j_password').val().length < 10 || $('#j_username').val().length < 3){
		$('#login_button').attr('disabled','disabled');
	}
}
--->
</script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<cfinclude template="/includes/www/head-start.alfred">
<cfinclude template="/includes/www/head-end.alfred">
<cfinclude template="/includes/www/header.alfred">
<cfinclude template="/includes/www/menu.alfred">
</head>

<body>

<cfwindow
initshow="true" name="destroyme"
        center="true"
        closable="false"
        destroyonclose="true"
        draggable="false"
        modal="true"
        resizable="false"
        width="300"
        height="200">
    <cfform method="post" id="login_form">  
        <br /><br />  
        <div id="username_field">
            Username: <br />
            <cfinput name="j_username" id="j_username" type="text" /><br /><br />      
        </div>
        <div id="password_field">
            Password:<br />
            <cfinput name="j_password" type="password" /><br /><br />
        </div>    
        <div id="login">
            <cfinput name="submit" type="submit" value="Login" style="width:75px"/>
        </div>
        <div id="messages"></div>
    </cfform>
</cfwindow>

<cfif StructKeyExists(form, "login")>
	<cfset #uname# = REReplaceNoCase(#form.j_username#, "[^A-Za-z0-9]", "", "all")>
    <cfif Len(#uname#) EQ 0 OR Len(#form.j_password#) LT 10>
    	<cfabort>
    </cfif>
</cfif>

<cfset AjaxOnLoad("init")> 
</body>
</html>