package com.fssa.greenfarm.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.fssa.greenfarm.exception.DAOException;
import com.fssa.greenfarm.model.User;
import com.fssa.greenfarm.service.UserService;
import com.google.protobuf.ServiceException;

/**
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = new User();

		UserService userservice = new UserService();
		
		String emailId = request.getParameter("emailId");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		int pincode = Integer.parseInt(request.getParameter("pincode"));
		long mobilenumber = Long.parseLong(request.getParameter("mobilenumber"));

		User users = new User();
		users.setEmail(emailId);
		users.setAddress(address);
		users.setCity(city);
		users.setState(state);
		users.setPincode(pincode);
		users.setMobilenumber(mobilenumber);
		
		System.out.println(emailId);

		try {
			boolean added = userservice.updateUserDetails(users);

			if (added) {
				System.out.println("Added");
				response.sendRedirect("home.jsp");
			} else {
				System.out.println("Not added");
			}

		} catch (ServiceException | DAOException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();

			response.sendRedirect("home.jsp");
		} 

	}
}
