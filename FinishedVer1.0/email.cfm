<cfoutput>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Create Account</title>
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
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="">PROJECTS <span class="caret"></span></a>
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
  
<div class="container-fluid">
	<div class="row">
		<div class="col-xs-6">
		</div>
    <div class="col-xs-6">
	

	</div>
		</div>
			</div>
<div class="container-fluid">
<div class="row">
<div class="col-xs-12">

<center>
Send User E-Mail
</center>

<form action="r2d3.cfm" method="POST">
  <div class="form-group">
    <label for="recipient">Enter recipient's e-mail:</label>
    <input type="text" class="form-control" name="recipient">
  </div>
  <div class="form-group">
    <label for="subject">Subject:</label>
    <input type="text" class="form-control" name="subject">
  </div>
  <div class="form-group">
    <label for="messagetext">Message:</label>
    <input type="text" class="form-control" name="messagetext">
  </div>
  <input type="hidden" id="choice" name="choice" value="message">
  <button type="submit" class="btn btn-primary">Send Message</button>
</form>

<div class="container-fluid">
<hr/>
	<div class="row">
		<div class="col-xs-12">
		
			<footer class="pull-left text-muted"><p style="font-size: 10px;">R2 Solutions has created this web application for the use of Clango, Inc.</p></footer>
		</div>
	</div>
</div>
  
    
    
  </div>
</div>
</div>

</body>
</html>
</cfoutput>