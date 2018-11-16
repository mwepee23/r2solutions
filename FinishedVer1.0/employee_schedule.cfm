<!DOCTYPE html>



<!-- 
	
	getting page content
	
	-->

<cfquery datasource="r2d2" name="rsPage">

	select emp_name, emp_role, emp_id
	from employee
    
    where emp_name = '#Form.EmployeeName#'

</cfquery>

    
<cfquery datasource= "r2d2" name="hours">

	select hours_allocated, actual_hours_worked, charge_code
	from employee_util
	where emp_id = '#rsPage.emp_id#'AND
		  month = '#Form.sMonth#' AND
		  year = '#Form.sYear#'


</cfquery>



<cfset allocated = valueList(hours.hours_allocated) />



<cfset allocatedArray = listToArray(allocated) />

<cfset allocated = #numberFormat(arraySum(allocatedArray))# />



<cfset worked = valueList(hours.actual_hours_worked) />

<cfset workedArray = listToArray(worked) />

<cfset worked = #numberFormat(arraySum(workedArray))# />

<!--
    Query to get project name for each individual employee
-->

<cfquery datasource="r2d2" name="project_names">
  select project_name
  from project
  where charge_code = '#hours.charge_code#'
</cfquery>

<cfset names = valueList(project_names.project_name) />

<cfset allNames = listToArray(names) />

<html lang="en">

<head>
  <title>Search Employees</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://fonts.googleapis.com/css?family=Montserrat|Unica+One" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="custom.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
</head>
<body>

<div class="container-fluid">
	<div class="row">
		<div class="well-sm">
			<div class="col-xs-6">
			<a href="home.cfm"><img class="pull-left img-responsive" src="clango-med.png" alt="Clango Logo" ></a></div>
			<div class="col-xs-6">
				<a href="yeet.html"><img class="pull-right img-responsive" src="r2Logo.png" alt="R2 Solutions Logo" ></a>
				
			</div>
		</div>
	</div>
</div>
<nav class="navbar navbar-default">
	<div class="container-fluid">
	 <div class="navbar-header">

    </div>
			<ul class="nav navbar-nav navbar-left">
  <li><a href="home.cfm"> <span class="glyphicon glyphicon-home"></span></a></li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">PROJECTS <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="create_proj.cfm">CREATE PROJECT</a></li>
					<li><a href="delete_proj.cfm">DELETE PROJECT</a></li>
					<li><a href="add_emp.cfm">ADD EMPLOYEE</a></li>
					<li><a href="remove_emp.cfm">DELETE EMPLOYEE</a></li>
					<li><a href="edit_hrs.cfm">EDIT HOURS</a></li>	
				</ul>
				</li>
				<li><a href="create_account.cfm">CREATE ACCOUNT</a></li>	
				<li><a href="projectreport.cfm">PROJECT REPORTS</a></li>
				<li><a href="employee_view.cfm">EMPLOYEE VIEW</a></li>
				<li><a href="search_employee.cfm">RESOURCE UTILIZATION</a></li>
				<li><a href="email.cfm">MESSAGES</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
			<li>
				<a href="logout.cfm" data-toggle="popover" data-placement="bottom"  title="session variable" data-content="Role: session variable"> 
					<cfoutput>#GetAuthUser()# </cfoutput><span class="glyphicon glyphicon-log-out"></span></a></li>
			</ul>

<script>
$(document).ready(function(){
    $('[data-toggle="popover"]').popover();   
});
</script>

<script>
$(document).ready(function(){
    $('[data-toggle="popover"]').popover();   
});
</script>
				
  </div>
  
</nav>
  
<div class="container">
<div class="row">

<div class="col-xs-8">               
                
            <cfoutput query="rsPage">
                
                <h1 style="font-family:'Montserrat', sans-serif; font-weight:lighter; text-align:justify;">#emp_name#</h1>
                <p style="font-family:'Montserrat', sans-serif; font-weight:lighter; text-align:justify; padding-left: 10px;">#emp_role#</p><hr/>
                
            </cfoutput>

            <cfoutput query="hours">

            <script>

                window.onload = function () {
                    
                CanvasJS.addColorSet("greenBlueRed",
                    [//colorSet Array

                        "red",
                        "blue",
                        "green"                
                    ]);               

                var chart1 = new CanvasJS.Chart("chartContainer1", {
            
                        animationEnabled: true,

                        colorSet: "greenBlueRed",

                        title:{

                                        text:"Employee Schedule"

                        },

                        axisX:{

                                        interval: 1

                        },

                        axisY2:{

                                        interlacedColor: "rgba(255,165,0,.3)",

                                        gridColor: "rgba(1,77,101,.1)",

                                        title: "Project Hours"

                        },

                        data: [{

                                        type: "bar",

                                        name: "hours",

                                        axisYType: "secondary",

                                        dataPoints: [

                                                        { y: #worked#, label: "Hours Worked"},

                                                        { y: #allocated#, label: "Allocated Hours" },

                                                        { y: 160, label: "Total Hours" },

                                                    ]

                        }]
                        
                });
                    
                    chart1.render();
                }    
                
            </script>
                
                    <div id="chartContainer1" style="height: 370px; width: 100%;"></div>
                    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>  

            </cfoutput>
    
                    <br /><br /><br /><br /> 

                <!-- change action depending on current system -->

                <form action="http://127.0.0.1:50481/FinishedVer1.0/search_employee.cfm">
                    <input type="Submit" class="btn btn-primary" name="Find Another Employee" value="Find Another Employee"> 
                </form>
</div>

<div class="col-xs-2"></div>

</div>
  
  </div>
  

  <footer class="pull-left text-muted">
  	<p style="font-size: 10px;">
  		<br /><br /><br /><br /> 
        <br /><br /><br /><br />
        <br /><br /><br /><br />
        <br /><br /><br /><br />
        <br /><br />
  		R2 Solutions has created this web application for the use of Clango, Inc.
  	</p>
  </footer>

</body>
</html>