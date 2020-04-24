<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Employee</title>
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

<form action="deleteEmployee">
<b>Enter Employee Id : </b>
<input type="number" name="eid" required>
<input type="submit" value="Search"> 
</form>

<br><br><br>
<c:set value="${deleteEmp}" var="demp"></c:set> 
<c:if test="${demp!=null}">
<c:if test="${demp==true}">  
   <h2 style="color: limegreen;">Employee Details Deleted Sucessfully!!!</h2>  
   <% session.removeAttribute("deleteEmp"); %>
</c:if> 
<c:if test="${demp==false}">  
   <h2 style="color: red;">Employee Details Deletion Failed!!!</h2>  
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

<form action="deleteEmployee" method="post">
<b>Employee Id:</b> ${emp.eid}<br>
<b>Employee Name:</b>${emp.ename}<br>
<b>Employee Father's Name:</b>${emp.fname}<br>
<b>Employee Age:</b>${emp.age}<br>
<b>Employee DOB:</b>${emp.dob}<br>
<b>Employee Qualification:</b>${emp.qualification}<br>
<b>Employee Post:</b>${emp.post}<br>
<b>Employee Phone:</b>${emp.phone}<br>
<b>Employee Email Id:</b>${emp.email}<br>
<b>Employee Adhaar No:</b>${emp.adhaar}<br>
<b>Employee Address:</b>${emp.address}<br>
<br>
<input type="hidden" value="${emp.eid}" name="eid">
<input type="submit" value="Delete"> 
</form>
</c:otherwise>  
</c:choose>  
</c:if>

</body>
</html>