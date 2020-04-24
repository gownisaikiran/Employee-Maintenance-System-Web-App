package org.practice.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.practice.web.dao.EmployeeDao;
import org.practice.web.model.Employee;

/**
 * Servlet implementation class AddEmployeeServlet
 */
@WebServlet("/addEmployee")
public class AddEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEmployeeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.sendRedirect("addEmployee.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int eid= Integer.parseInt(request.getParameter("eid"));
		String ename= request.getParameter("ename");
		String fname= request.getParameter("fname");
		int age= Integer.parseInt(request.getParameter("age"));
		String dob= request.getParameter("dob");
		String qual= request.getParameter("qual");
		String post= request.getParameter("post");
		String phone= request.getParameter("phone");
		String email= request.getParameter("email");
		String adhar= request.getParameter("adhar");
		String address= request.getParameter("address");
		
		EmployeeDao emp_dao = new EmployeeDao();
		Employee emp = new Employee();
		emp.setEid(eid);
		emp.setEname(ename);
		emp.setFname(fname);
		emp.setAge(age);
		emp.setDob(dob);
		emp.setQualification(qual);
		emp.setPost(post);
		emp.setPhone(phone);
		emp.setEmail(email);
		emp.setAdhaar(adhar);
		emp.setAddress(address);
		boolean status = emp_dao.setEmp(emp);
		HttpSession session = request.getSession();
		session.setAttribute("addEmp",status);
		//request.getRequestDispatcher("addEmployee.jsp").forward(request,response);
		response.sendRedirect("addEmployee.jsp");
	}

}
