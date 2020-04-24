<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="resources/css/login.css" type="text/css">
<title>Login-Employee Management System</title>
</head>
<body>

<%

if(session.getAttribute("username")!=null)
{
	response.sendRedirect("home.jsp");
}

%>
<center><h1>Employee Maintenance System</h1></center>
<div id="login_container">
<center>
<form action="login" method="post"> 
<center><h2>Login</h2></center>
<b>Enter Username :</b> <br> <input type="text" name="username" required><br><br>
<b>Enter Password :</b> <br> <input type="password" name="password" required><br><br>
<input type="submit" value="Login" name="login_register" />
</form>
<br>
<span>Don't have an Account ?</span>
<a href="register.jsp"><input type="button" value="Register" /></a>  
</center>
</div>

</body>
</html>