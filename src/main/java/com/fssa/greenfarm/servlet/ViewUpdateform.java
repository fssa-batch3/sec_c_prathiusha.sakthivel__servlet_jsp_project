package com.fssa.greenfarm.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.greenfarm.exception.DAOException;
import com.fssa.greenfarm.exception.ProductInvalidException;
import com.fssa.greenfarm.model.Product;
import com.fssa.greenfarm.service.ProductService;

/**
 * Servlet implementation class ViewUpdateform
 */
@WebServlet("/ViewUpdateform")
public class ViewUpdateform extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ViewUpdateform() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductService productservice = new ProductService();

		try {
			String productId = request.getParameter("id");
			if(productId != null) {
			Product product = ProductService.getProductById(Integer.parseInt(productId));
			request.setAttribute("product", product);
			
			}
		} catch (DAOException | SQLException | ProductInvalidException e) {
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/updateform.jsp");
		dispatcher.forward(request, response);
	}

}


