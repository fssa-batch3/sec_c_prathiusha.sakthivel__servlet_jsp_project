package com.fssa.greenfarm;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;

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
 * Servlet implementation class updateform
 */
@WebServlet("/updateform")
public class updateform extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     
	     int productId = Integer.parseInt(request.getParameter("productId"));
	     String Productname = request.getParameter("productname");
	     String Productimageurl = request.getParameter("imageurl");
	     double Productprice = Double.parseDouble(request.getParameter("price"));
	     double Productquantity = Double.parseDouble(request.getParameter("quantity"));
	     String Category=request.getParameter("sub");
	     String Description=request.getParameter("description");
	     int OfferPercentage=Integer.parseInt(request.getParameter("percentage"));
	     LocalDate createddate =LocalDate.parse(request.getParameter("createdDate"));

	     ProductService productservice=new ProductService();

	     Product product = new Product();
	     product.setId(productId);
	     product.setName(Productname);
	     product.setImageURL(Productimageurl);
	     product.setPrice(Productprice);
	     product.setQuantity(Productquantity);
	     product.setCategory(Category);
	     product.setDescription(Description);
	     product.setCreateddate(createddate);
	     product.setPercentage(OfferPercentage);
	     
	     try {
	    	 if(productservice.updateProduct(product)) {
			System.out.println("successful");

	    	 }
		} catch (SQLException | DAOException | ProductInvalidException e) {
			e.printStackTrace();
		}
	     RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher( "/AdminServlet");
	     dispatcher.forward(request, response);

	}

	}



