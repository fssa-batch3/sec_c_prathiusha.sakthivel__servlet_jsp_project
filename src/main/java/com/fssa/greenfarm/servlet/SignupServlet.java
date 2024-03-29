package com.fssa.greenfarm.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.greenfarm.DAO.UserDAO;
import com.fssa.greenfarm.exception.DAOException;
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
        UserService userservice = new UserService();

        if (!password.equals(conformpassword)) {
            Logger.info("Password and confirm password don't match");
            request.setAttribute("errorMessage", "Passwords do not match. Please check and try again.");
            RequestDispatcher rd = request.getRequestDispatcher("./signup.jsp");
            rd.forward(request, response);
        } else {
        	UserDAO userdao = new UserDAO();
            try {
				if (userdao.emailExists(email)) {
				    response.setContentType("text/html");
				    request.setAttribute("errorMessage", "Email already exists. Please use a different email.");
				    RequestDispatcher rd = request.getRequestDispatcher("./signup.jsp");
				    rd.include(request, response);
				} else {
				    User user = new User();
				    user.setFirstname(firstname);
				    user.setLastname(lastname);
				    user.setEmail(email);
				    user.setPassword(password);

				    try {
				        boolean added = userservice.userSignUp(user);

				        if (added) {
				            System.out.println("Added");
				            response.sendRedirect("./login.jsp");
				        } else {
				            System.out.println("Not added");
				        }

				    } catch (ServiceException e) {
				        System.out.println(e.getMessage());
				        e.printStackTrace();

				        response.sendRedirect("signup.jsp");
				    }
				}
			} catch (DAOException | IOException | ServletException e) {
		
				e.printStackTrace();
			}
        }
    }


}
