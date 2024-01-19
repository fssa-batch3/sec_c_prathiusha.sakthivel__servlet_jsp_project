package com.fssa.greenfarm.servlet;

import com.fssa.greenfarm.DAO.AllCheckOutDAO;
import com.fssa.greenfarm.DAO.CartDAO;
import com.fssa.greenfarm.DAO.ProductDAO;
import com.fssa.greenfarm.DAO.UserDAO;
import com.fssa.greenfarm.enums.PaymentMethod;
import com.fssa.greenfarm.logger.Logger;
import com.fssa.greenfarm.model.*;
import com.fssa.greenfarm.service.OrderService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.file.LinkOption;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AllOrderServlet")
public class AllOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    AllCheckOutDAO dao = new AllCheckOutDAO();
    UserDAO userdao = new UserDAO();

    ProductDAO productDAO = new ProductDAO();

    OrderService orderService = new OrderService();

    CartDAO cartDAO = new CartDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request,response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String numberPattern = "\\d+";
        String ids = request.getParameter("id");

        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        int pincode = Integer.parseInt(request.getParameter("pincode"));
        long mobilenumber = Long.parseLong(request.getParameter("mobilenumber"));

        HttpSession session = request.getSession(false);
        String email=(String) session.getAttribute("email");


        List<CartItems> products = new ArrayList<>();
        List<Product> orderProducts = new ArrayList<>();

        try{

            User user = userdao.getUserByEmail(email);
            int userId = UserDAO.getUserIdByEmail(user.getEmail());

            List<Integer> nos = new ArrayList<>();

            if (!ids.matches(numberPattern)) {

                String[] nums = ids.split(",");


                for(String item : nums){

                    nos.add(Integer.parseInt(item.trim()));
                }

                products =  dao.getOneProducts(nos,userId);


                for(CartItems item : products){

                    Product findItem = productDAO.getProductById(item.getProduct_id());

                    findItem.setQuantity(item.getQuantity());
                    findItem.setPrice(item.getTotalprice());

                    orderProducts.add(findItem);

                }


            } else {

                orderProducts.add(productDAO.getProductById(Integer.parseInt(ids.trim())));
            }

            List<OrderedProduct> finalProducts = bundleProducts(orderProducts);

            Order order = new Order();
            order.setAddress(address);
            order.setOrderedProducts(finalProducts);
            order.setCity(city);
            order.setState(state);
            order.setPincode(pincode);
            order.setPaymentmethod(PaymentMethod.CASHONDELIVERY);
            order.setOrderdate(LocalDate.now());
            order.setUser_id(userId);
            order.setMobile_number(mobilenumber);

            orderService.createOrder(order);
            Logger.info("Order Placed Sucessfully ");

            if(!ids.matches(numberPattern)){

                for(int del :nos){

                    cartDAO.removeCartItemsByCartId(del);
                }

                Logger.info("Order cart items removed");
            }


            RequestDispatcher rd = request.getRequestDispatcher("orderplaced.jsp");
            rd.forward(request, response);

        }catch (Exception e){

            e.printStackTrace();
        }
    }

    private List<OrderedProduct> bundleProducts(List<Product> products){

        List<OrderedProduct> items = new ArrayList<>();


        for(Product item : products){

            OrderedProduct pro = new OrderedProduct();
            pro.setProductId(item.getId());
            pro.setProductname(item.getName());
            pro.setProductPrice(item.getPrice());
            pro.setQuantity(item.getQuantity());
            pro.setTotalAmount(item.getPrice());

            items.add(pro);
        }

        return items;

    }

}
