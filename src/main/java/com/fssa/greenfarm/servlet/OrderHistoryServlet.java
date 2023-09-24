package com.fssa.greenfarm.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.greenfarm.DAO.UserDAO;
import com.fssa.greenfarm.exception.DAOException;
import com.fssa.greenfarm.model.Order;
import com.fssa.greenfarm.model.OrderedProduct;
import com.fssa.greenfarm.model.User;
import com.fssa.greenfarm.service.OrderService;
import com.fssa.greenfarm.service.OrderedProductService;
import com.fssa.greenfarm.service.UserService;
import com.google.protobuf.ServiceException;

/**
 * Servlet implementation class OrderHistoryServlet
 */
@WebServlet("/OrderHistoryServlet")
public class OrderHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderService orderService = new OrderService();
		HttpSession session = request.getSession(false);
		String email = (String) session.getAttribute("email");
		UserService userservice = new UserService();
	
		
		int userId;
		try {
			User user=userservice.getUserByEmail(email);
			userId = UserDAO.getUserIdByEmail(user.getEmail());
			OrderedProductService orderedproductservice = new OrderedProductService();
			List<Order> orderDetails=orderedproductservice.getOrderById(userId);
			request.setAttribute("orderDetails", orderDetails);
			RequestDispatcher requestDispatcher = request.getServletContext().getRequestDispatcher("/orderhistory.jsp");
			requestDispatcher.forward(request, response);
		} catch (DAOException|SQLException | ServiceException  e) {
			System.out.println("Getting order details failed");
			e.printStackTrace();
		} 
	}

}
