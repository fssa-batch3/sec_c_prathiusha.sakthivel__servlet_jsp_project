package com.fssa.greenfarm.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.greenfarm.exception.DAOException;
import com.fssa.greenfarm.service.OrderService;

/**
 * Servlet implementation class CancelOrder
 */
@WebServlet("/CancelOrder")
public class CancelOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 String orderIdStr = request.getParameter("orderId");
		 
	        if (orderIdStr != null) {
	        	
	            try {
	            	
	                int orderId = Integer.parseInt(orderIdStr);
	                OrderService orderService = new OrderService();
	                
	                orderService.cancelOrder(orderId);
	                System.out.println("Deleted order Successfully");
	                request.setAttribute("success", "Order Cancelled Successfully");
					request.getRequestDispatcher("OrderHistoryServlet").forward(request, response);	                
	            } catch ( DAOException | SQLException  e) {
	            	
	            	request.setAttribute("error", e.getMessage());
	                System.out.println("Delete order failed");
					request.getRequestDispatcher("OrderHistoryServlet").forward(request, response);	                
	                e.printStackTrace();
	            }
	        } else {
	            System.out.println("Invalid order ID");
	            response.sendRedirect("OrderServlet");
	        }
	    }
	}

	


