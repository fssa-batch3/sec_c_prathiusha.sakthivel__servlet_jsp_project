package com.fssa.greenfarm;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.greenfarm.exception.DAOException;
import com.fssa.greenfarm.exception.ProductInvalidException;
import com.fssa.greenfarm.service.ProductService;

/**
 * Servlet implementation class deleteform
 */
@WebServlet("/deleteform")
public class deleteform extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
response.getWriter().append("Served at: ").append(request.getContextPath());
	
		
		int productId = Integer.parseInt(request.getParameter("productid"));
		String productname=request.getParameter("productname");

		ProductService productService = new ProductService();

		try {

			productService.deleteProduct(productId, productname);
			response.getWriter().append("Success");
			response.sendRedirect(request.getContextPath() + "/GetAllProductDetailsServlet");
		
		} catch (ProductInvalidException | SQLException | DAOException e) {
		
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

	

}
