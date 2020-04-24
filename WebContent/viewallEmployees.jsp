<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.practice.web.dao.EmployeeDao, org.practice.web.model.Employee, java.util.*" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Employees</title>
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

<div style="float:right;padding-right: 10px;padding-top: 10px;"><a href="home.jsp">Home</a><b>Welcome, <%= username %></b>&nbsp;<a href="logout">Log Out</a></div>
<br><br>
<%
EmployeeDao emp_dao = new EmployeeDao();
List<Employee> emps = emp_dao.getEmps();
%>

<style>
table {
  border-collapse: collapse;
}

table, th, td {
  border: 1px solid black;
}
table {
  width: 100%;
}

th, tr {
  height: 50px;
}
tr:hover 
{
background-color: #f5f5f5;
}
tr:nth-child(even)
{
background-color: #f2f2f2;
}
th, td {
  padding: 15px;
  text-align: left;
}
table td, table th {
        font-size: 20px;
    } 
</style>

<center><h1>Employees List</h1></center>
<table style="border:3px solid black;">
<thead><tr>
<th>Id</th>
<th>Name</th>
<th>Father's Name</th>
<th>Age</th>
<th>Dob</th>
<th>Qualification</th>
<th>Post</th>
<th>Phone</th>
<th>Email</th>
<th>Adhaar No</th>
<th>Address</th>
</tr></thead>
<tbody>
<% 
for(Employee emp : emps)
{
%>

<tr>
<td style="border:1px solid black;"><%= emp.getEid() %></td>
<td style="border:1px solid black;"><%= emp.getEname() %></td>
<td style="border:1px solid black;"><%= emp.getFname() %></td>
<td style="border:1px solid black;"><%= emp.getAge() %></td>
<td style="border:1px solid black;"><%= emp.getDob() %></td>
<td style="border:1px solid black;"><%= emp.getQualification() %></td>
<td style="border:1px solid black;"><%= emp.getPost() %></td>
<td style="border:1px solid black;"><%= emp.getPhone() %></td>
<td style="border:1px solid black;"><%= emp.getEmail() %></td>
<td style="border:1px solid black;"><%= emp.getAdhaar() %></td>
<td style="border:1px solid black;"><%= emp.getAddress() %></td>
</tr>

<%	
}
%>
</tbody>
</table>
<br>
</body>
</html>