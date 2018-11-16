<cfcomponent >

    <cfset THIS.Name = "ClangoCruR2" />
    <cfset THIS.Datasource = "employee" />
    <cfset THIS.ApplicationTimeout = CreateTimeSpan( 0, 2, 0, 0 ) /> <!---Day, Hours, Minutes, Second | How long till application timesout | Need to start application again after two days of inactivity --->
    <cfset THIS.SessionManagement = true />
    <cfset THIS.SessionTimeout = CreateTimeSpan( 0, 0, 30, 0 ) /> <!---Day, Hours, Minutes, Second | How long till session timesout | Need to login again after 30 minutes of inactivity--->

 <!--- onApplicationStart are commands to be carried out everytime the application starts, usually activated once --->
 <cffunction name="onApplicationStart" access="public" returntype="void" output="false">
	<cfreturn>
 </cffunction>	

 <!--- onSessionStart are commands to be carried out everytime a user logins succesfully, usually activated once | Place to store constant variables for accounts | Just use <CFIF> to set session variables to be carried throughout the login --->
 <cffunction name="onSessionStart" access="public" returntype="void" output="false">

 </cffunction>	
<!--- onRequestStart are commands to be carried out everytime a user request another webpage, accessed with every hyperlink.  Placed login trigger here so this will alway redirect non logged in user to the login screen.  1st Layer of defense of unauthorized access to webpage.  The 2nd is a restriction on certain page allowing only those with an "Admin" role in. ---> 
<cffunction name="OnRequestStart"> 
<cfif GetAuthUser() IS "">
	<cfset counter = 0>
<cfelse> 
	<cfset counter = 3>
</cfif>
<cfloop condition = "counter LESS THAN 1">
	<cfif counter IS 0>
		<cfinclude template="login_check.cfm" >
	</cfif>
	<cfset counter = 3>
</cfloop>


	

 </cffunction>



</cfcomponent>
