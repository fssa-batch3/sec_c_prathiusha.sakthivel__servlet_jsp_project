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
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 String orderIdStr = request.getParameter("order_id");
	        //if (orderIdStr != null) {
	        	
	            try {
	            	
	                int orderId = Integer.parseInt(orderIdStr);
	                OrderService orderService = new OrderService();
	                
	                orderService.cancelOrder(orderId);
	                System.out.println("Deleted order Successfully");
	                response.sendRedirect("pages/home.jsp");
	                
	            } catch ( DAOException | SQLException  e) {
	                System.out.println("Delete order failed");
	                response.sendRedirect("OrderServlet");
	                e.printStackTrace();
	            }
	        //} else {
	          //  System.out.println("Invalid order ID");
	           // response.sendRedirect("OrderServlet");
	        //}
	    }
	}

	


