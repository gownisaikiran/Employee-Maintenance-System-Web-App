<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="resources/css/register.css" type="text/css">
<title>Register-Employee Management System</title>
</head>
<body>
<%
if(session.getAttribute("username")!=null)
{
	response.sendRedirect("index.jsp");
}
//String username=(String)session.getAttribute("username");
%>
<center><h1>Employee Maintenance System</h1></center>
<div id="reg_container">
<center>
<form action="register" method="post"> 
<center><h2>Register</h2></center>
<b>Enter Username :</b><br>  <input type="text" name="username" required><br><br>
<b>Enter Password :</b><br> <input type="password" name="password" required><br><br>
<b>Confirm Password :</b><br> <input type="password" name="con_password" ><br><br>
<input type="submit" value="Register" name="login_register">
</form>
<br>
<span>Already have an Account ?</span>
<a href="index.jsp"><input type="button" value="Login" /></a> 
</center>
</div>

</body>
</html>