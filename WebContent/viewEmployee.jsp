	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.practice.web.model.Employee" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Employee</title>
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
<form action="viewEmployee">
<b>Enter Employee Id : </b>
<input type="number" name="eid" required>
<input type="submit" value="View"> 
</form>

<br><br><br>
<c:set value="${emp}" var="emp"></c:set>  
<c:if test="${emp!=null}">
<c:choose>  
<c:when test="${emp.eid==0}">  
<c:out value="Sorry!! No Employee found with this Id."></c:out>  
</c:when>  
<c:otherwise>  
<br>
<b>Employee Id:</b>${emp.eid}<br>
<b>Employee Name:</b>${emp.ename}<br>
<b>Employee Father's Name:</b>${emp.fname}<br>
<b>Employee Age:</b>${emp.age}<br>
<b>Employee DOB:</b>${emp.dob}<br>
<b>Employee Qualification:</b>${emp.post}<br>
<b>Employee Post:</b>${emp.qualification}<br>
<b>Employee Phone:</b>${emp.phone}<br>
<b>Employee Email Id:</b>${emp.email}<br>
<b>Employee Adhaar No:</b>${emp.adhaar}<br>
<b>Employee Address:</b>${emp.address}<br> 
</c:otherwise>  
</c:choose>  
</c:if> 

</body>
</html>