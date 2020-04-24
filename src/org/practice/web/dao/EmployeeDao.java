package org.practice.web.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.practice.web.model.Employee;


public class EmployeeDao {
	String url = Provider.url;
	String username = Provider.username;
	String password = Provider.password;
	
	public Employee getEmp(int eid) 

	{
		Employee emp = new Employee();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");			
		    Connection con = DriverManager.getConnection(url,username,password);
		    Statement st = con.createStatement();
		    String sql = "select * from employee where emp_id="+eid;
		    ResultSet rs = st.executeQuery(sql);
		    if(rs.next())
		    {
		    	emp.setEid(eid);
				emp.setEname(rs.getString("name"));
				emp.setFname(rs.getString("fname"));
				emp.setAge(Integer.parseInt(rs.getString("age")));
				emp.setDob(rs.getString("dob"));
				emp.setQualification(rs.getString("education"));
				emp.setPost(rs.getString("post"));
				emp.setPhone(rs.getString("phone"));
				emp.setEmail(rs.getString("email"));
				emp.setAdhaar(rs.getString("aadhar"));
				emp.setAddress(rs.getString("addess"));
				
		    }
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return emp;
	}

	public boolean setEmp(Employee emp)
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");			
		    Connection con = DriverManager.getConnection(url,username,password);
		    String sql = "insert into employee values(?,?,?,?,?,?,?,?,?,?,?);";
		    PreparedStatement st = con.prepareStatement(sql);		    
		    st.setString(1,emp.getEname());
			st.setString(2, emp.getFname());
			st.setString(3,Integer.toString(emp.getAge()));
			st.setString(4, emp.getDob());
			st.setString(5, emp.getAddress());
			st.setString(6, emp.getPhone());
			st.setString(7, emp.getEmail());
			st.setString(8, emp.getQualification());
			st.setString(9, emp.getPost());
			st.setString(10, emp.getAdhaar());
			st.setString(11, Integer.toString(emp.getEid()));
			
		    int status = st.executeUpdate();
		    if(status>0)
				return true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean updateEmp(Employee emp)
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");			
		    Connection con = DriverManager.getConnection(url,username,password);
		    String sql = "update employee set name=?,fname=?,age=?,dob=?,addess=?,phone=?,email=?,education=?,post=?,aadhar=?,emp_id=? where emp_id=?;";
		    PreparedStatement st = con.prepareStatement(sql);		    
		    st.setString(1,emp.getEname());
			st.setString(2,emp.getFname());
			st.setString(3,Integer.toString(emp.getAge()));
			st.setString(4, emp.getDob());
			st.setString(5, emp.getAddress());
			st.setString(6, emp.getPhone());
			st.setString(7, emp.getEmail());
			st.setString(8, emp.getQualification());
			st.setString(9, emp.getPost());
			st.setString(10, emp.getAdhaar());
			st.setString(11, Integer.toString(emp.getEid()));
			st.setString(12, Integer.toString(emp.getEid()));
			
		    int status = st.executeUpdate();
		    if(status>0)
				return true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean deleteEmp(int eid)
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");			
		    Connection con = DriverManager.getConnection(url,username,password);
		    String sql = "delete from employee where emp_id=?;";
		    PreparedStatement st = con.prepareStatement(sql);		    
		   
			st.setString(1, Integer.toString(eid));
			
		    int status = st.executeUpdate();
		    if(status>0)
				return true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}

	public List<Employee> getEmps()
	{
		List<Employee> emps = new ArrayList<Employee>();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");			
		    Connection con = DriverManager.getConnection(url,username,password);
		    Statement st = con.createStatement();
		    String sql = "select * from employee;";
		    ResultSet rs = st.executeQuery(sql);
		    while(rs.next())
		    {	
		    	Employee emp = new Employee();
				emp.setEname(rs.getString("name"));
				emp.setFname(rs.getString("fname"));
				emp.setAge(Integer.parseInt(rs.getString("age")));
				emp.setDob(rs.getString("dob"));
				emp.setQualification(rs.getString("education"));
				emp.setPost(rs.getString("post"));
				emp.setPhone(rs.getString("phone"));
				emp.setEmail(rs.getString("email"));
				emp.setAdhaar(rs.getString("aadhar"));
				emp.setAddress(rs.getString("addess"));
				emp.setEid(Integer.parseInt(rs.getString("emp_id")));
				emps.add(emp);
		    }
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return emps;
	}
}


