package org.practice.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.practice.web.dao.User;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String submit_type = request.getParameter("login_register");
		String uname = request.getParameter("username");
		String pass = request.getParameter("password");
		PrintWriter out = response.getWriter();
//		System.out.println(submit_type);
		if(submit_type.equals("Register") )
		{
			User usr = new User();
			if(usr.register(uname,pass))
			{
				out.println("Register Sucessful");
//				HttpSession session = request.getSession();
//				session.setAttribute("username",uname);
				response.sendRedirect("index.jsp");
			}
			else {
				out.println("Register not Sucessfull");
			}
		}
		else {
			response.sendRedirect("index.jsp");
		}
	}

}
