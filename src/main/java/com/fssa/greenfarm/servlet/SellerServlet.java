package com.fssa.greenfarm.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.greenfarm.exception.SellerInvalidException;
import com.fssa.greenfarm.model.Seller;
import com.fssa.greenfarm.service.SellerService;
import com.google.protobuf.ServiceException;

/**
 * Servlet implementation class SellerServlet
 */
@WebServlet("/SellerServlet")
public class SellerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellerServlet() {
        super();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String ownershiptype= request.getParameter("ownershiptype");
		String gender=request.getParameter("gender");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String district = request.getParameter("district");
		String state = request.getParameter("state");
		String bankname = request.getParameter("bankname");
		String branchname = request.getParameter("branchname");
		String farmimage = request.getParameter("farmimage");
		String feedback = request.getParameter("feedback");
		
		SellerService sellerservice = new SellerService();	
		Seller seller = new Seller();

		seller.setName(name);
		seller.setOwnershipType(ownershiptype);
		seller.setGender(gender);
		seller.setEmail(email);
		seller.setAddress(address);
		seller.setDistrict(district);
		seller.setState(state);
		seller.setBankname(bankname);
		seller.setBranchname(branchname);
		seller.setFarmimage(farmimage);
		seller.setFeedback(feedback);
		
		try {
		boolean added=sellerservice.sellerSignUp(seller);
	
		if(added) {
			System.out.println("added");
			response.sendRedirect(request.getContextPath()+"/sellerlogin.jsp");
			
			
		}
		else {
			System.out.println("not added");
		}
	
		} catch (ServiceException|SellerInvalidException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			
			response.sendRedirect(request.getContextPath()+"/sellerregister.jsp");
		} 
		
	

	}

}
