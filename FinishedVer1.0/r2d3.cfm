<cfif GetUserRoles() IS NOT "Admin">
	<cflocation url="http://127.0.0.1:50481/TestingApp/home.cfm" >
	<cfabort>
<cfelse>
<!--- Lines 1-4 are reserved for white list security.  Essentially only admins can access this page
	  even if someone were to reach this page from within the network if they aren't logged in
	  with an Admin account it would send the user back to the home screen and stop parsing
	  protecting the code --->
<cfset fun = #Form.action#>

<cfoutput >
<!--- Project creation function.  <cfif> prevents double entries or starting date being further along the timeline than ending date --->
<cfif fun eq "create">
	<cfif #Form.sYear# LTE #Form.eYear#>
			<cfif #Form.sMonth# LTE #Form.eMonth#>
				<cfquery name="Projects" datasource="r2d2">
  					INSERT INTO PROJECT
  					VALUES ('#Form.pName#','#Form.pCC#','#Form.pMang#','#Form.sMonth#','#Form.sYear#','#Form.eMonth#','#Form.eYear#')
				</cfquery>
				<cfset error = "No">
            	<cfinclude template="create_proj.cfm">
			<cfelse>
			  	<cfset error = "Yes">
            	<cfinclude template="create_proj.cfm">
           		 <cfabort>
			</cfif>	

	<cfelse>
		<cfset error = "Yes">
           <cfinclude template="create_proj.cfm">
           	<cfabort>	
	</cfif>

	
<!--- Project deletion function.  <cfif> ensure there is only one record as to prevent deleting a single project--->
<cfelseif fun eq "delete">
		<cfquery name="projD" datasource="r2d2" >

		SELECT charge_code FROM PROJECT WHERE charge_code = <cfqueryparam value="#Form.pCC#" cfsqltype="CF_SQL_VARCHAR">

		</cfquery>    
		
		<cfif projD.RecordCount EQ '1'>	
			<cfquery name="Projects" datasource="r2d2">
  				DELETE FROM PROJECT
  				WHERE charge_code = <cfqueryparam value="#Form.pCC#" cfsqltype="CF_SQL_VARCHAR">
			</cfquery>
				<cfset error = "No">
            	<cfinclude template="delete_proj.cfm">
			<cfelse>
			  	<cfset error = "Yes">
            	<cfinclude template="delete_proj.cfm">
           		 <cfabort>	
		</cfif>

<!--- Employee assign function.  <cfif> ensure there is no employee with the same Employee ID (unique) and charge code (unique) in the same month preventing double entry--->
<cfelseif fun eq "assign">
		<cfquery name="projD" datasource="r2d2" >

		SELECT charge_code FROM employee_util WHERE charge_code = <cfqueryparam value="#Form.pMang#" cfsqltype="CF_SQL_VARCHAR"> 
														AND 
														emp_id = <cfqueryparam value="#Form.pEmp#" cfsqltype="CF_SQL_VARCHAR"> 
														AND 
														month = <cfqueryparam value="#Form.sMonth#" cfsqltype="CF_SQL_VARCHAR"> 
														AND 
														year = <cfqueryparam value="#Form.sYear#" cfsqltype="CF_SQL_VARCHAR"> 
		</cfquery>    
		
		<cfif projD.RecordCount EQ '0'>	
				<cfquery name="Projects" datasource="r2d2">
  					INSERT INTO employee_util
  					VALUES ('#Form.pMang#','#Form.pEmp#','#Form.aHours#', '0', '#Form.sMonth#','#Form.sYear#')
				</cfquery>
				<cfset error = "No">
            	<cfinclude template="add_emp.cfm">
           		 <cfabort>	
			<cfelse>
			  	<cfset error = "Yes">
            	<cfinclude template="add_emp.cfm">
           		 <cfabort>	
		</cfif>
<!--- Employee removal function.  <cfif> ensure there is only one record as to prevent deleting the wrong instance--->		
<cfelseif fun eq "remove">
		<cfquery name="projD" datasource="r2d2" >

				SELECT charge_code FROM employee_util WHERE charge_code = <cfqueryparam value="#Form.pMang#" cfsqltype="CF_SQL_VARCHAR"> 
														AND 
														emp_id = <cfqueryparam value="#Form.pEmp#" cfsqltype="CF_SQL_VARCHAR"> 
														AND 
														month = <cfqueryparam value="#Form.sMonth#" cfsqltype="CF_SQL_VARCHAR"> 
														AND 
														year = <cfqueryparam value="#Form.sYear#" cfsqltype="CF_SQL_VARCHAR"> 
		</cfquery>    
		
		<cfif projD.RecordCount EQ '1'>	
			<cfquery name="Projects" datasource="r2d2">
  				DELETE FROM employee_util
  				WHERE charge_code = <cfqueryparam value="#Form.pMang#" cfsqltype="CF_SQL_VARCHAR">
				AND 
				emp_id = <cfqueryparam value="#Form.pEmp#" cfsqltype="CF_SQL_VARCHAR"> 
				AND 
				month = <cfqueryparam value="#Form.sMonth#" cfsqltype="CF_SQL_VARCHAR"> 
				AND 
				year = <cfqueryparam value="#Form.sYear#" cfsqltype="CF_SQL_VARCHAR"> 			
			</cfquery>
				<cfset error = "No">
            	<cfinclude template="remove_emp.cfm">
			<cfelse>
			  	<cfset error = "Yes">
            	<cfinclude template="remove_emp.cfm">
           		 <cfabort>	
		</cfif>
<!--- Employee hour editor function.  <cfif> ensure there is only one record that matches the parameters as to prevent editing the wrong instance--->
<cfelseif fun eq "edit">
		<cfquery name="projD" datasource="r2d2" >

				SELECT charge_code FROM employee_util WHERE charge_code = <cfqueryparam value="#Form.pMang#" cfsqltype="CF_SQL_VARCHAR"> 
														AND 
														emp_id = <cfqueryparam value="#Form.pEmp#" cfsqltype="CF_SQL_VARCHAR"> 
														AND 
														month = <cfqueryparam value="#Form.sMonth#" cfsqltype="CF_SQL_VARCHAR"> 
														AND 
														year = <cfqueryparam value="#Form.sYear#" cfsqltype="CF_SQL_VARCHAR"> 
		</cfquery>    
		
		<cfif projD.RecordCount EQ '1'>	
			<cfquery name="Projects" datasource="r2d2">
  				UPDATE employee_util
  				SET hours_allocated = '#Form.aHours#', actual_hours_worked = '#Form.wHours#'
  				WHERE charge_code = <cfqueryparam value="#Form.pMang#" cfsqltype="CF_SQL_VARCHAR">
				AND 
				emp_id = <cfqueryparam value="#Form.pEmp#" cfsqltype="CF_SQL_VARCHAR"> 
				AND 
				month = <cfqueryparam value="#Form.sMonth#" cfsqltype="CF_SQL_VARCHAR"> 
				AND 
				year = <cfqueryparam value="#Form.sYear#" cfsqltype="CF_SQL_VARCHAR"> 			
			</cfquery>
				<cfset error = "No">
            	<cfinclude template="edit_hrs.cfm">
			<cfelse>
			  	<cfset error = "Yes">
            	<cfinclude template="edit_hrs.cfm">
           		 <cfabort>	
		</cfif>	
<!--- Creates account function.  Base of white list policy, only the admin can hand out accounts.  Prevent duplication of employee id (unique identifier) --->		
<cfelseif fun eq "createAcc">
		<cfquery name="projD" datasource="r2d2" >

				SELECT username,emp_id FROM employee WHERE emp_id = <cfqueryparam value="#Form.eID#" cfsqltype="CF_SQL_VARCHAR"> AND username = <cfqueryparam value="#Form.uName#" cfsqltype="CF_SQL_VARCHAR"> 
												     
		</cfquery>    
		
		<cfif projD.RecordCount EQ '0'>	
			<cfquery name="Projects" datasource="r2d2">
					INSERT INTO employee
  					VALUES ('#Form.uName#','#Form.eName#','#Form.eID#','#Form.roll#','#Form.pWssAord#')			
			</cfquery>
				<cfset error = "No">
            	<cfinclude template="create_account.cfm">
			<cfelse>
			  	<cfset error = "Yes">
            	<cfinclude template="create_account.cfm">
           		 <cfabort>	
		</cfif>
<cfelseif fun eq "deleteA">
		<cfquery name="projD" datasource="r2d2" >

				SELECT username,emp_id FROM employee WHERE emp_id = <cfqueryparam value="#Form.eID#" cfsqltype="CF_SQL_VARCHAR">  
												     
		</cfquery>    
		
		<cfif projD.RecordCount EQ '1'>	
			<cfquery name="Projects" datasource="r2d2">
					DELETE FROM employee
  					WHERE emp_id = '#Form.eiD#'	
			</cfquery>
				<cfset error = "No">
            	<cfinclude template="delete_account.cfm">
			<cfelse>
			  	<cfset error = "Yes">
            	<cfinclude template="delete_account.cfm">
           		 <cfabort>	
		</cfif>	
<cfelseif fun eq "changeP">
		<cfquery name="projD" datasource="r2d2" >

				SELECT password,username,emp_name FROM employee WHERE emp_name = '#GetAuthUser()#'
																AND password = '#Form.oldPass#'
		</cfquery>    												  
		
		<cfif projD.RecordCount EQ '1'>	
			<cfquery name="Projects" datasource="r2d2">
  				UPDATE employee
  				SET password = '#Form.password#'
  				WHERE emp_name = '#GetAuthUser()#'
					  AND password = '#Form.oldPass#' 		
			</cfquery>
				<cfset error = "No">
            	<cfinclude template="change_pass.cfm">
			<cfelse>
			  	<cfset error = "Yes">
            	<cfinclude template="change_pass.cfm">
           		 <cfabort>	
		</cfif>							
</cfif>

</cfoutput>
</cfif>
