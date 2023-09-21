package com.fssa.greenfarm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.greenfarm.exception.DAOException;
import com.fssa.greenfarm.exception.InvalidUserDetailException;
import com.fssa.greenfarm.model.User;
import com.fssa.greenfarm.service.UserService;
import com.google.protobuf.ServiceException;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		UserService userservice = new UserService();

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		PrintWriter out = response.getWriter();

		User user = new User();
		user.setEmail(email);
		user.setPassword(password);

		try {

			if (userservice.userLogin(email, password)) {
				HttpSession session = request.getSession(true);
				session.setAttribute("email", email);
				session.setAttribute("loggedInSuccess", true);
				request.getRequestDispatcher("pages/home.jsp").forward(request, response);
			}else {
				response.sendRedirect(request.getContextPath() + "/login.jsp?error=Login Failed");
			}

		} catch (ServiceException | InvalidUserDetailException | DAOException | SQLException e) {
			e.printStackTrace();
			out.print(e.getMessage());
//			response.sendRedirect("/login.jsp?error=" + e.getMessage());
			
			
			// RequestDispatcher dispatcher =
			// request.getRequestDispatcher(request.getContextPath() + "/pages/login.jsp");
			// dispatcher.forward(request, response);
			// e.printStackTrace();

		}

	}

}
