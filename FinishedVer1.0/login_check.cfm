<cflogin >

<!--- The GetAuthUser() function will be "" until a employee sucessfully logs in.  Otherwise the user is sent back to the login page --->
 	<cfif GetAuthUser() IS "">
		<cfset counter = 0>
	<cfelse> 
		<cfset counter = 3>
	</cfif>
	
	<cfif NOT (IsDefined ("Form.user") AND IsDefined ("Form.id")) AND counter IS NOT 3>
        <cfinclude template="login.cfm">
        <cfabort>
    <!--- Cfif ensures that the user logged in and when this page is recalled by Application.cfc it won't double include --->    
    <cfelse>
        <!--- Query searches for exactly one matach --->
            <CFQUERY NAME="login" DATASOURCE=r2d2>
            SELECT      username,emp_name,emp_id,emp_role
            FROM         employee
            WHERE        (username = <cfqueryparam value="#Form.user#" cfsqltype="CF_SQL_VARCHAR"> 
                        AND password = <cfqueryparam value="#Form.id#" cfsqltype="CF_SQL_VARCHAR">)
            </CFQUERY>
		<!--- If there is a match then the RecordCount equals 1 --->
        <cfif login.RecordCount EQ '1'>
            <cfloginuser name="#login.emp_name#" password="#Form.id#" roles="#login.emp_role#">
<!--- IF there WAS NOT a matching record, an "Invalid Login" message is shown and the user is prompted to login again. --->     
        <cfelse>
            <!--- Creates the Variable "notFound" which carries over to login.cfm and launching a error message.. --->
            <cfset notFound = "Yes">
            <cfinclude template="login.cfm">
            <cfabort>
        </cfif>        
    </cfif>    
</cflogin>

<!--- Will relocate employee to home screen to prevent possible data collection of login code --->
<cfset EmployeeName = GetAuthUser()>
<cflocation url="http://127.0.0.1:50481/FinishedVer1.0/home.cfm" >

