package com.fssa.greenfarm.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.greenfarm.DAO.CartDAO;
import com.fssa.greenfarm.exception.DAOException;
import com.fssa.greenfarm.model.CartItems;

/**
 * Servlet implementation class cartpayment
 */
@WebServlet("/cartpayment")
public class cartpayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cartpayment() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cartIdsParam = request.getParameter("cartIds");

        if (cartIdsParam != null && !cartIdsParam.isEmpty()) {
            String[] cartIdsArray = cartIdsParam.split(",");
            ArrayList<CartItems> cartItemsList = new ArrayList<>();

            for (String cartId : cartIdsArray) {
                try {
                    int cartIdInt = Integer.parseInt(cartId.trim());
                    CartDAO cartdao=new CartDAO();	
                    ArrayList<CartItems> cartItems = cartdao.getCartItemsByCartId(cartIdInt);
                    cartItemsList.addAll(cartItems);
                } catch (NumberFormatException | DAOException | SQLException e) {
                    e.printStackTrace();
                }
            }

            request.setAttribute("cartItemsList", cartItemsList);
            request.getRequestDispatcher("/cartpayment.jsp").forward(request, response);
        }
    }


    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 
	 doGet(req, resp);
}

}
