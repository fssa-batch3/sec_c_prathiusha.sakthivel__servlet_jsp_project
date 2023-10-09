package com.fssa.greenfarm.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.greenfarm.model.User;
import com.fssa.greenfarm.service.UserService;

/**
 * Servlet implementation class UpdateProfile
 */
@WebServlet("/UpdateProfile")
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserService userService = new UserService();
		HttpSession session = request.getSession(false);
		String email = (String) session.getAttribute("email");
		System.out.print(email);
		try {
			// Retrieve user data by email from the service
			User user = userService.getUserByEmail(email);

			if (user != null) {
				// If the user exists, set the user object as an attribute and forward to the
				// profilepage.jsp
				request.setAttribute("user", user);
				request.getRequestDispatcher("" + "profilepage.jsp").forward(request, response);
			} else {
				System.out.println("null user");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
