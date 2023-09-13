package com.fssa.greenfarm;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

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
 * Servlet implementation class greenfarm
 */
@WebServlet("/greenfarm")
public class greenfarm extends HttpServlet {

	ProductService service = new ProductService();

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String Fromrange = request.getParameter("Fromrange");
		String Torange = request.getParameter("Torange");
		double fromrange = Double.parseDouble(Fromrange);
		double torange = Double.parseDouble(Torange);

	    ProductService service = new ProductService();
	    try {
	    	
	    	Product product = (Product) service.searchProductByName(null);
	    	request.setAttribute("productList", product);
	    	request.setAttribute("check", "check");
	    	System.out.println("gff"+ product);
	    }
	    catch(DAOException  | SQLException e){
	    	e.getMessage();
	    	
	    }
	    RequestDispatcher dis = request.getRequestDispatcher("/product.jsp");
	    dis.forward(request, response);
 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}

}
