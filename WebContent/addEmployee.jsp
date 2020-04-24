<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Employee</title>
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

if(session.getAttribute("username")==null)
{
	response.sendRedirect("index.jsp");
}

String username=(String)session.getAttribute("username");
%>
<div style="float:right;padding-right: 10px;padding-top: 10px;"><a href="home.jsp">Home</a><b>Welcome, <%= username %></b>&nbsp;<a href="logout">Log Out</a></div><br>
<div>
<center>

<c:set value="${addEmp}" var="emp"></c:set> 
<c:if test="${emp==true}">  
   <h2 style="color: limegreen;">Employee Added Sucessfully..</h2>  
   <% session.removeAttribute("addEmp"); %>
</c:if> 
<c:if test="${emp==false}">  
   <h2 style="color: red;">Adding Employee Failed..</h2>  
</c:if>  


<h2>Add Employee Details</h2>
<form action="addEmployee" method="post">
<b>ID:</b><input type="number" name="eid" required><br>
<b>Name:</b><input type="text" name="ename" required><br>
<b>Father Name:</b><input type="text" name="fname" required><br>
<b>Age:</b><input type="number" name="age" required><br>
<b>Date of Birth:</b><input type="text" name="dob" required><br>
<b>Qualification:</b><input type="text" name="qual" required><br>
<b>Post:</b><input type="text" name="post" required><br>
<b>Phone:</b><input type="number" name="phone" required><br>
<b>Email Id:</b><input type="email" name="email" required><br>
<b>Adhaar Id:</b><input type="number" name="adhar" required><br>
<b>Address:</b><textarea rows="5" name="address" required></textarea><br>

<input type="submit" value="Add">
</form>
</center>
</div>
</body>
</html>