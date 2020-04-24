<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Employee</title>
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

<div style="float:right;padding-right: 10px;padding-top: 10px;"><a href="home.jsp">Home</a><b>Welcome, <%= username %></b>&nbsp;<a href="logout">Log Out</a></div><br>

<form action="updateEmployee">
<b>Enter Employee Id : </b>
<input type="number" name="eid" required>
<input type="submit" value="Search"> 
</form>

<br><br><br>
<c:set value="${updateEmp}" var="uemp"></c:set> 
<c:if test="${uemp!=null}">
<c:if test="${uemp==true}">  
   <h2 style="color: limegreen;">Employee Details Updated Sucessfully!!!</h2>  
   <% session.removeAttribute("updateEmp"); %>
</c:if> 
<c:if test="${uemp==false}">  
   <h2 style="color: red;">Employee Details Update Failed!!!</h2>  
</c:if>  
</c:if>

<c:set value="${emp}" var="emp"></c:set>  
<c:if test="${emp!=null}">
<c:choose>  
<c:when test="${emp.eid==0}">  
<c:out value="Sorry!! No Employee found with this Id."></c:out>  
</c:when>  
<c:otherwise>  
<br>

<form action="updateEmployee" method="post">
<b>Employee Id:</b> <input type="number" name="eid" value="${emp.eid}" required><br>
<b>Employee Name:</b><input type="text" name="ename" value="${emp.ename}" required> <br>
<b>Employee Father's Name:</b><input type="text" name="fname" value="${emp.fname}" required><br>
<b>Employee Age:</b><input type="number" name="age" value="${emp.age}" required><br>
<b>Employee DOB:</b><input type="text" name="dob" value="${emp.dob}" required><br>
<b>Employee Qualification:</b><input type="text" name="qual" value="${emp.qualification}" required><br>
<b>Employee Post:</b><input type="text" name="post" value="${emp.post}" required><br>
<b>Employee Phone:</b><input type="number" name="phone" value="${emp.phone}" required><br>
<b>Employee Email Id:</b><input type="email" name="email" value="${emp.email}" required><br>
<b>Employee Adhaar No:</b><input type="number" name="adhar" value="${emp.adhaar}" required><br>
<b>Employee Address:</b><input type="text" name="address" value="${emp.address}" required><br>
<input type="submit" value="Update"> 
</form>
</c:otherwise>  
</c:choose>  
</c:if>
</body>
</html>