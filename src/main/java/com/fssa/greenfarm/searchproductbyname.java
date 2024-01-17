package com.fssa.greenfarm;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

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
 * Servlet implementation class searchproductbyname
 */
@WebServlet("/searchproductbyname")
public class searchproductbyname extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchproductbyname() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String search=request.getParameter("search");
		
		ProductService productservice=new ProductService();
		
		try {
			List<Product> product = productservice.searchProductByName(search);
	        request.setAttribute("productList", product);
	
		} catch (  SQLException | DAOException e) {
			e.printStackTrace();
		}
		
	    request.getRequestDispatcher("./product.jsp").forward(request, response);
	}
	
}
