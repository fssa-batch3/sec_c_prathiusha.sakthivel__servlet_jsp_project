package com.fssa.greenfarm.servlet;

import com.fssa.greenfarm.DAO.AllCheckOutDAO;
import com.fssa.greenfarm.DAO.UserDAO;
import com.fssa.greenfarm.model.CartItems;
import com.fssa.greenfarm.model.Product;
import com.fssa.greenfarm.model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AllCheckoutServlet")
public class AllCheckoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    AllCheckOutDAO dao = new AllCheckOutDAO();
    UserDAO userdao = new UserDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

       doPost(request,response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String numberPattern = "\\d+";
        String ids = request.getParameter("id");

        HttpSession session = request.getSession(false);
        String email=(String) session.getAttribute("email");


        List<CartItems> products = new ArrayList<>();

        try{

            User user = userdao.getUserByEmail(email);
            int userId = UserDAO.getUserIdByEmail(user.getEmail());

            if (!ids.matches(numberPattern)) {

                String[] nums = ids.split(",");
                List<Integer> nos = new ArrayList<>();

                for(String item : nums){

                    nos.add(Integer.parseInt(item.trim()));
                }

                products =  dao.getOneProducts(nos,userId);


            } else {

                String total_qty = request.getParameter("total_qty");
                String total_price = request.getParameter("total_price");

                CartItems cart = new CartItems();
                cart.setProduct_id(Integer.parseInt(ids.trim()));
                cart.setQuantity(Float.parseFloat(total_qty.trim()));
                cart.setTotalprice(Float.parseFloat(total_price.trim()));
                products.add(cart);

            }
            request.setAttribute("items", products);

            RequestDispatcher rd = request.getRequestDispatcher("AllPaymentPage.jsp");
            rd.forward(request, response);

        }catch (Exception e){

            e.printStackTrace();

        }
    }

}
