package com.fssa.greenfarm.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.greenfarm.model.Seller;
import com.fssa.greenfarm.service.SellerService;

/**
 * Servlet implementation class SellerloginServlet
 */
@WebServlet("/SellerloginServlet")
public class SellerloginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellerloginServlet() {
        super();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
		SellerService sellerservice = new SellerService();
		
		String  username = request.getParameter("username");
		String email = request.getParameter("email");
		
		Seller seller = new Seller();
		
		seller.setName(username);
		seller.setEmail(email);
		
		
		try {
			if(sellerservice.sellerLogin(email, username)) {
			HttpSession session = request.getSession(true);
			session.setAttribute("email",email);
			session.setAttribute("loggedin Sucessful",true);
			request.getRequestDispatcher("index.jsp").forward(request, response);
			
			}else {
			 response.sendRedirect(request.getContextPath()+"/pages/sellerlogin.jsp?error=Login Failed! Invalid Seller Details");
			}
		}
			catch (Exception e) {
				e.printStackTrace();
			}		
    }
}
