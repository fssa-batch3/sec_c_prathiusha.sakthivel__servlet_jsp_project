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

@WebServlet("/CartItemsDetails")
public class CartItemsDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CartItemsDetails() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		String email=(String) session.getAttribute("email");

		ArrayList<CartItems> cartDetails = null;
		try {
			UserDAO userdao = new UserDAO();
			User user = userdao.getUserByEmail(email);
			int userId = UserDAO.getUserIdByEmail(user.getEmail());
			cartDetails = CartDAO.getCartItemsByUserId(userId);
			System.out.println(cartDetails);
			request.setAttribute("CartItemsDetails", cartDetails);

		} catch (DAOException | SQLException e) {
			e.getMessage();
			e.printStackTrace();
		}

		RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
		rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
