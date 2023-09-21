package com.fssa.greenfarm.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.greenfarm.logger.Logger;
import com.fssa.greenfarm.model.User;
import com.fssa.greenfarm.service.UserService;
import com.google.protobuf.ServiceException;

/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String conformpassword = request.getParameter("conformpassword");
		if (!password.equals(conformpassword)) {
			Logger.info("Password and confirm password doesn't match");
			RequestDispatcher rd = request.getRequestDispatcher("./signup.jsp");
			rd.forward(request, response);

		} else {
			User user = new User();

			user.setFirstname(firstname);
			user.setLastname(lastname);
			user.setEmail(email);
			user.setPassword(password);

			UserService userservice = new UserService();

			try {
				boolean added = userservice.userSignUp(user);

				if (added) {
					System.out.println("added");
					response.sendRedirect("./login.jsp");

				} else {
					System.out.println("not added");
				}

			} catch (ServiceException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();

				response.sendRedirect("signup.jsp");
			}

		}
	}

}
