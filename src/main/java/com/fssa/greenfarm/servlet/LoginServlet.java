package com.fssa.greenfarm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.greenfarm.DAO.UserDAO;
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

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		doPost(req, resp);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		UserService userservice = new UserService();

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		PrintWriter out = response.getWriter();
		UserDAO userdao = new UserDAO();
		User user = new User();
		user.setEmail(email);
		user.setPassword(password);

		try {

			if (userservice.userLogin(email, password)) {
				HttpSession session = request.getSession(true);
				User userss = userdao.getUserByEmail(user.getEmail());
		     	session.setAttribute("userss",userss);
				session.setAttribute("email", email);
				session.setAttribute("loggedInSuccess", true);
				request.getRequestDispatcher("home.jsp").forward(request, response);
			}else {

		        if (!userdao.emailExists(email)) {
		        	RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp?error=Invalid Email");
		        	dispatcher.forward(request, response);
		        } else {
		        	response.sendRedirect(request.getContextPath() + "/login.jsp?error2=Invalid Password");
		        }
			
			}

		} catch (ServiceException | InvalidUserDetailException | DAOException | SQLException e) {
				e.printStackTrace();
				
//			response.sendRedirect("/login.jsp?error=" + e.getMessage());
			
			// RequestDispatcher dispatcher =
			// request.getRequestDispatcher(request.getContextPath() + "/pages/login.jsp");
			// dispatcher.forward(request, response);
			// e.printStackTrace();

		}

	}

}


