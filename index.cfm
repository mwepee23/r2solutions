<cfset testVar = "Hello World">
<cfoutput>
	<h1>#testVar#</h1>
</cfoutput>

<cfquery datasource="r2d2" name="Users">
select *
from User
</cfquery>

<p>All Users (results of initial query)</p>
<cfoutput query="Users">
 #FirstName# #LastName#<br />
</cfoutput>
