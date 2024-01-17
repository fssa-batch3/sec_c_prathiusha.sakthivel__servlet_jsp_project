package com.fssa.greenfarm.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.greenfarm.DAO.CartDAO;
import com.fssa.greenfarm.DAO.ProductDAO;
import com.fssa.greenfarm.exception.DAOException;
import com.fssa.greenfarm.model.CartItems;

/**
 * Servlet implementation class CartOrderServlet
 */
@WebServlet("/CartOrderServlet")
public class CartOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CartOrderServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] cartIdsArray = request.getParameterValues("CartIds");

        if (cartIdsArray != null && cartIdsArray.length > 0) {
            try {
                List<Integer> cartIds = Arrays.stream(cartIdsArray)
                        .map(Integer::parseInt)
                        .collect(Collectors.toList());

                List<CartItems> cartItemsList = new ArrayList<>();
                for (int cartId : cartIds) {
                    cartItemsList.addAll(CartDAO.getCartItemsByCartId(cartId));
                }

                request.setAttribute("cartId", cartIds);

                request.setAttribute("cartItemsList", cartItemsList);

                RequestDispatcher dispatcher = request.getRequestDispatcher("/orderplaced.jsp");
                dispatcher.forward(request, response);
            } catch (SQLException | DAOException e) {
                e.printStackTrace();
            }
        } 
    }


}
