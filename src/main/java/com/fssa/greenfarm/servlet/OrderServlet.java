package com.fssa.greenfarm.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.greenfarm.DAO.UserDAO;
import com.fssa.greenfarm.enums.PaymentMethod;
import com.fssa.greenfarm.exception.DAOException;
import com.fssa.greenfarm.exception.InValidOrderDetailException;
import com.fssa.greenfarm.exception.ProductInvalidException;
import com.fssa.greenfarm.logger.Logger;
import com.fssa.greenfarm.model.Order;
import com.fssa.greenfarm.model.OrderedProduct;
import com.fssa.greenfarm.model.Product;
import com.fssa.greenfarm.model.User;
import com.fssa.greenfarm.service.OrderService;
import com.fssa.greenfarm.service.ProductService;
import com.google.protobuf.ServiceException;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		OrderService orderService = new OrderService();
		UserDAO userDaO = new UserDAO();
		int productId = Integer.parseInt(request.getParameter("id"));

		System.out.println(productId);
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		int pincode = Integer.parseInt(request.getParameter("pincode"));
		long mobilenumber = Long.parseLong(request.getParameter("mobilenumber"));
		String paymenttype = request.getParameter("rdo");
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		float totalPrice = Float.parseFloat(request.getParameter("price"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));

		

		Order order = new Order();
		OrderedProduct orderProduct = new OrderedProduct();
		ProductService productService = new ProductService();

		try {
			User user = userDaO.getUserByEmail(email);
			Product product = productService.getProductById(productId);
			List<OrderedProduct> productsList = new ArrayList<>();
			int userId = UserDAO.getUserIdByEmail(user.getEmail());
			orderProduct.setProductId(productId);
			orderProduct.setProductname(product.getName());

			orderProduct.setProductPrice(product.getPrice());

			orderProduct.setQuantity(quantity);

			orderProduct.setTotalAmount(totalPrice);

			productsList.add(orderProduct);
			order.setAddress(address);
			order.setOrderedProducts(productsList);
			order.setCity(city);
			order.setState(state);
			order.setPincode(pincode);

			order.setPaymentmethod(PaymentMethod.CASHONDELIVERY);
			order.setOrderdate(LocalDate.now());
			order.setUser_id(userId);
			
			order.setMobile_number(mobilenumber);
			
			System.out.println(order);
			Logger.info(order);
			orderService.createOrder(order);
			Logger.info("Order Placed Sucessfully ");
		} catch (DAOException | SQLException | InValidOrderDetailException | ServiceException
				| ProductInvalidException e) {
			Logger.info("Order Failed" + e.getMessage());
			e.printStackTrace();
		}

		RequestDispatcher rd = request.getRequestDispatcher("orderplaced.jsp");
		rd.forward(request, response);

	}

}
