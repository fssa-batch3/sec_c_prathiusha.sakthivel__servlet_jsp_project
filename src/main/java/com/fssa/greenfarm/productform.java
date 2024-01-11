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
 * Servlet implementation class productform
 */
@WebServlet("/productform")
public class productform extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//add product
     ProductService productservice=new ProductService();
     
     String Productname = request.getParameter("productname");
     String Productimageurl = request.getParameter("imageurl");
     double Productprice = Double.parseDouble(request.getParameter("price"));
     double Productquantity = Double.parseDouble(request.getParameter("quantity"));
     String Category=request.getParameter("sub");
     String Description=request.getParameter("description");
     int OfferPercentage=Integer.parseInt(request.getParameter("percentage"));
     LocalDate createddate =LocalDate.parse(request.getParameter("createdDate"));

     Product product = new Product();
     
     product.setName(Productname);
     product.setImageURL(Productimageurl);
     product.setPrice(Productprice);
     product.setQuantity(Productquantity);
     product.setCategory(Category);
     product.setDescription(Description);
     product.setCreateddate(createddate);
     product.setPercentage(OfferPercentage);
     
     try {
		productservice.addProduct(product);

	} catch (SQLException | DAOException | ProductInvalidException e) {
		e.printStackTrace();
	}
	
		RequestDispatcher dis = request.getRequestDispatcher("/AdminServlet");
	    dis.forward(request, response);
  
}

}
