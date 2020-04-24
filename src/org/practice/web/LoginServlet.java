package org.practice.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.practice.web.dao.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		// TODO Auto-generated method stub
		String submit_type = request.getParameter("login_register");
		String uname = request.getParameter("username");
		String pass = request.getParameter("password");
		PrintWriter out = response.getWriter();
//		System.out.println(submit_type);
		if(submit_type.equals("Login"))
		{
			User usr = new User();
			try {
				if(usr.check(uname, pass))
				{
					out.println("Login Sucessful");
					System.out.println(submit_type);
					HttpSession session = request.getSession();
					session.setAttribute("username",uname);
					response.sendRedirect("home.jsp");
				}
				else {
					out.println("Login not Sucessful");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		else {
			response.sendRedirect("register.jsp");
		}
	}

}
