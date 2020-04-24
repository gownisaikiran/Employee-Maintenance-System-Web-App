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
 * Servlet implementation class DeleteEmployeeServlet
 */
@WebServlet("/deleteEmployee")
public class DeleteEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteEmployeeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		EmployeeDao emp_dao = new EmployeeDao();
		Employee emp = emp_dao.getEmp(Integer.parseInt(request.getParameter("eid")));
		request.setAttribute("emp",emp);
		request.getRequestDispatcher("deleteEmployee.jsp").forward(request,response);
//		response.sendRedirect("deleteEmployee.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int eid= Integer.parseInt(request.getParameter("eid"));
		EmployeeDao emp_dao = new EmployeeDao();
		boolean status = emp_dao.deleteEmp(eid);
		HttpSession session = request.getSession();
		session.setAttribute("deleteEmp",status);
		//request.getRequestDispatcher("addEmployee.jsp").forward(request,response);
		response.sendRedirect("deleteEmployee.jsp");
	}

}
