package com.fssa.greenfarm;

import java.io.IOException;
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
 * Servlet implementation class searchproductbyprice
 */
@WebServlet("/searchproductbyprice")
public class searchproductbyprice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		double fromrange = Double.parseDouble(request.getParameter("FromRange"));
		double torange = Double.parseDouble(request.getParameter("ToRange"));

	    ProductService service = new ProductService();
	    try {

			List<Product> filteredProducts= service.searchingPrice(fromrange, torange);
			response.getWriter().append("Success");
			//productList
			request.setAttribute("productList", filteredProducts);
			RequestDispatcher rd = request.getRequestDispatcher("./product.jsp");
			rd.forward(request, response);
//			response.sendRedirect(request.getContextPath() + "/GetAllProductDetailsServlet");
	    
	    }
	    catch(DAOException  | SQLException e){
	    	System.out.println(e.getMessage());
	    	
	    	
	    }
	
 
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}


}
