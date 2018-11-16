<!DOCTYPE html>
<html lang="en">
<head>
  <title>Home</title>
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

<div class = "container-fluid">
	<div class = "row">
	<div class = "col-xs-2"></div>
		<div class = "col-xs-8">
			<div class = "well-sm text-center">
			<h1 style="font-family:'Montserrat', sans-serif; font-weight:lighter;">
			CRUMAN
			</h1> 
				
					<h3>
						<i>/ˈkro͞omən/</i> 
					</h3>
					
				<h4 style="font-family:'Montserrat', sans-serif; font-weight:lighter;">
					<i>noun</i>
						<br/>		
					1. <b>C</b>lango <b>R</b>esource <b>U</b>tilization <b>Man</b>ager, a web application designed by R2 Solutions:
				</h4>
					<p style="font-family:'Montserrat', sans-serif; font-weight:lighter; color: #939393">"The administrators, managers, and employees of Clango, Inc. use the CRUMAN app to create projects, organize them, and assign resources to them to maximize resource utilization."</p>  
		<!--<hr />
			
		
					<img class="img-responsive center-block" src="cruman.png" alt="CRUMAN" > 
			-->
			</div>
			
		</div>
			<div class = "col-xs-2"></div>
	</div>	
</div>
  
  <footer>
  <hr />
 	<div class="col-xs-12 text-center">
		<p>R2 Solutions has created this web application for the use of Clango, Inc.</p>
	</div>
 
	<img class="img-responsive center-block" src="cruman-sm.png" alt="CRUMAN" >
	</div>
</footer>


 


</body>


</html>