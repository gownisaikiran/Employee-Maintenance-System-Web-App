<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="resources/css/home.css" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%
// Restricts Logout back button
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

if(session.getAttribute("username")==null)
{
	response.sendRedirect("index.jsp");
}
String username=(String)session.getAttribute("username");
%>

<div style="float:right;padding-right: 10px;padding-top: 10px;"><b>Welcome, <%= username %></b>&nbsp;<a href="logout">Log Out</a></div>
<br><br>
<div id="home_container">
	<div class="container">
		<div class="row">
		  <div class="col-sm-6"><a href="addEmployee.jsp"><h2>Add Employee</h2></a></div>
		  <div class="col-sm-6"><a href="updateEmployee.jsp"><h2>Update Employee</h2></a></div>
		</div>
		<br><br><br>
		<div class="row">
		  <div class="col-sm-6"><a href="viewEmployee.jsp"><h2>View Employee</h2></a></div>
		  <div class="col-sm-6"><a href="deleteEmployee.jsp"><h2>Delete Employee</h2></a></div>
	    </div>
	    <br><br><br>
	    <div class="row">
		  <div class="col-sm-12"><a href="viewallEmployees.jsp"><h2>View All Employees</h2></a></div>
	    </div>
	</div>
</div>
</body>
</html>