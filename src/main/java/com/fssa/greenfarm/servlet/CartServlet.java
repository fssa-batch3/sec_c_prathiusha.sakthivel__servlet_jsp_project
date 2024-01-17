package com.fssa.greenfarm.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.greenfarm.DAO.CartDAO;
import com.fssa.greenfarm.DAO.UserDAO;
import com.fssa.greenfarm.exception.DAOException;
import com.fssa.greenfarm.model.CartItems;
import com.fssa.greenfarm.model.User;
import com.fssa.greenfarm.service.CartService;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String email=(String) session.getAttribute("email");
		UserDAO userdao = new UserDAO();
		

		int productid = Integer.parseInt(request.getParameter("productid"));
		float quantity = Float.parseFloat(request.getParameter("quantity"));
		float price = Float.parseFloat(request.getParameter("price"));
		float totalprice = price * quantity;

		//check whether the product is already there using the dao method .
		//if(true) the below code 
		//else{...
		//
		//send.redirect(""/greenfarm-web/payment.jsp?id=" + productId + "&quantity=" + quantity + "&totalPrice=" + priceUpdate; & isExist=true")
		//}
		try {
			User user = userdao.getUserByEmail(email);
			int userId = UserDAO.getUserIdByEmail(user.getEmail());
			CartItems cart = new CartItems();
			cart.setTotalprice(totalprice);
			cart.setQuantity(quantity);
			cart.setProduct_id(productid);
			cart.setUser_id(userId);
			CartService.addToCart(cart);
			System.out.println("added to cart successfully");

			ArrayList<CartItems> cartItems = CartDAO.getCartItemsByUserId(userId);
			System.out.println("Entered");
			request.setAttribute("CartItemsDetails", cartItems);
			RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
			rd.forward(request, response);

		} catch (DAOException | SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
	}

}
