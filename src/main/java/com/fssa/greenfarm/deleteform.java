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
	
//response.getWriter().append("Served at: ").append(request.getContextPath());
	
		
        try {
            int productId = Integer.parseInt(request.getParameter("id"));
            String productName = request.getParameter("name");

            ProductService productService = new ProductService();
            productService.deleteProduct(productId, productName);

            // Set a success message as an attribute
            request.setAttribute("successMessage", "Product deleted successfully");

        } catch (NumberFormatException | ProductInvalidException | SQLException | DAOException e) {
            // Handle exceptions appropriately
            e.printStackTrace();
            // Set an error message as an attribute
            request.setAttribute("errorMessage", "Error deleting product");
        }

        // Redirect to AdminServlet
        response.sendRedirect(request.getContextPath() + "/AdminServlet");
    }
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

	

}
